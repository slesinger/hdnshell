"""
Unit tests for sdk.semantic_search — fully offline.

No real embedding provider is used: a deterministic FakeEmbedder stands in
for langchain's OpenAIEmbeddings/AzureOpenAIEmbeddings so tests never touch
the network or require an API key.
"""

import os
import pickle

import numpy as np
import pytest

from sdk.semantic_search import (
    _content_key,
    _embed_chunks,
    _load_cache,
    _save_cache,
    chunk_manual,
    semantic_search,
)
from agent_tools import search_manual


class FakeEmbedder:
    """Deterministic embedder: maps known substrings to fixed 3D vectors.

    Any text containing "mount" gets a vector close to [1, 0, 0], text
    containing "network" gets a vector close to [0, 1, 0], everything else
    gets [0, 0, 1]. This lets tests assert exact ranking behavior without a
    real model.
    """

    embedding_model_name = "fake-embedding-v1"

    def __init__(self):
        self.calls = []

    def _vector_for(self, text: str):
        low = text.lower()
        if "mount" in low:
            return [1.0, 0.01, 0.0]
        if "network" in low:
            return [0.0, 1.0, 0.01]
        return [0.0, 0.0, 1.0]

    def embed_documents(self, texts):
        self.calls.append(list(texts))
        return [self._vector_for(t) for t in texts]


class ExplodingEmbedder:
    """Simulates a network/provider failure."""

    embedding_model_name = "fake-exploding"

    def embed_documents(self, texts):
        raise RuntimeError("simulated network error")


# ── chunk_manual ─────────────────────────────────────────────────────────────


def test_chunk_manual_splits_on_blank_line_and_skips_empty():
    manual = {
        "a.md": "First para.\n\nSecond para.\n\n\n\n",
        "b.md": "Only para.",
    }
    chunks = chunk_manual(manual)
    assert chunks == [
        ("a.md", "First para."),
        ("a.md", "Second para."),
        ("b.md", "Only para."),
    ]


def test_chunk_manual_handles_empty_manual():
    assert chunk_manual({}) == []
    assert chunk_manual(None) == []


# ── cache round-trip ─────────────────────────────────────────────────────────


def test_cache_round_trip(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    key = _content_key("fake-model", "hello world")
    vec = np.array([1.0, 2.0, 3.0], dtype=np.float32)

    _save_cache(cache_path, {key: vec})
    loaded = _load_cache(cache_path)

    assert key in loaded
    np.testing.assert_array_equal(loaded[key], vec)


def test_cache_missing_file_returns_empty(tmp_path):
    cache_path = str(tmp_path / "does_not_exist.pkl")
    assert _load_cache(cache_path) == {}


def test_cache_corrupt_file_does_not_crash(tmp_path):
    cache_path = str(tmp_path / "corrupt.pkl")
    with open(cache_path, "wb") as fh:
        fh.write(b"not a valid pickle stream !!!")

    assert _load_cache(cache_path) == {}


def test_cache_wrong_type_treated_as_empty(tmp_path):
    cache_path = str(tmp_path / "wrong_type.pkl")
    with open(cache_path, "wb") as fh:
        pickle.dump(["not", "a", "dict"], fh)

    assert _load_cache(cache_path) == {}


# ── cache reuse: embedder only called for uncached chunks ──────────────────


def test_embed_chunks_only_embeds_missing_entries(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    chunks = [("a.md", "Use mnt to mount a disk."), ("a.md", "Network settings here.")]

    result1 = _embed_chunks(embedder, chunks, cache_path)
    assert set(result1.keys()) == {
        "Use mnt to mount a disk.",
        "Network settings here.",
    }
    assert len(embedder.calls) == 1
    assert len(embedder.calls[0]) == 2

    # Second call with the same chunks plus one new one: only the new
    # paragraph should be sent to the embedder.
    chunks2 = chunks + [("b.md", "Totally new paragraph.")]
    result2 = _embed_chunks(embedder, chunks2, cache_path)

    assert len(embedder.calls) == 2
    assert embedder.calls[1] == ["Totally new paragraph."]
    assert set(result2.keys()) == {
        "Use mnt to mount a disk.",
        "Network settings here.",
        "Totally new paragraph.",
    }


def test_embed_chunks_persists_cache_to_disk(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    chunks = [("a.md", "Use mnt to mount a disk.")]

    _embed_chunks(embedder, chunks, cache_path)

    assert os.path.exists(cache_path)
    on_disk = _load_cache(cache_path)
    key = _content_key(embedder.embedding_model_name, "Use mnt to mount a disk.")
    assert key in on_disk


def test_embed_chunks_returns_none_on_provider_failure(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = ExplodingEmbedder()
    chunks = [("a.md", "Some paragraph.")]

    result = _embed_chunks(embedder, chunks, cache_path)
    assert result is None
    # Nothing should have been written since embedding failed outright.
    assert _load_cache(cache_path) == {}


# ── cosine ranking correctness ───────────────────────────────────────────────


def test_semantic_search_ranks_by_cosine_similarity(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    manual = {
        "shell.md": (
            "Use mnt to mount a D64 image.\n\n"
            "Configure network settings from the menu.\n\n"
            "This paragraph is unrelated filler text."
        )
    }

    results = semantic_search(
        "how do I mount a disk",
        manual,
        top_k=3,
        cache_path=cache_path,
        embedder=embedder,
    )

    assert results is not None
    assert len(results) == 3
    # Top result should be the mount-related paragraph (closest cosine sim).
    top_score, top_fname, top_para = results[0]
    assert "mount" in top_para.lower()
    assert top_fname == "shell.md"
    # Scores should be sorted descending.
    scores = [r[0] for r in results]
    assert scores == sorted(scores, reverse=True)


def test_semantic_search_respects_top_k(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    manual = {
        "a.md": "Para one.\n\nPara two.\n\nPara three.\n\nPara four."
    }

    results = semantic_search(
        "query", manual, top_k=2, cache_path=cache_path, embedder=embedder
    )
    assert results is not None
    assert len(results) == 2


# ── graceful degradation ─────────────────────────────────────────────────────


def test_semantic_search_returns_none_for_empty_query(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    manual = {"a.md": "Some text."}

    assert (
        semantic_search("", manual, cache_path=cache_path, embedder=embedder) is None
    )
    assert (
        semantic_search("   ", manual, cache_path=cache_path, embedder=embedder)
        is None
    )


def test_semantic_search_returns_none_for_empty_manual(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    embedder = FakeEmbedder()
    assert (
        semantic_search("query", {}, cache_path=cache_path, embedder=embedder) is None
    )


def test_semantic_search_returns_none_when_no_embedder_available(tmp_path, monkeypatch):
    """Simulates: no API key / package installed -> _create_embedder() returns None."""
    cache_path = str(tmp_path / "embeddings.pkl")
    manual = {"a.md": "Some text about mounting disks."}

    monkeypatch.setattr("sdk.semantic_search._create_embedder", lambda: None)

    result = semantic_search("mount", manual, cache_path=cache_path)
    assert result is None


def test_semantic_search_returns_none_on_provider_exception(tmp_path):
    cache_path = str(tmp_path / "embeddings.pkl")
    manual = {"a.md": "Some text about mounting disks."}

    result = semantic_search(
        "mount", manual, cache_path=cache_path, embedder=ExplodingEmbedder()
    )
    assert result is None


def test_semantic_search_returns_none_on_query_embedding_failure(tmp_path):
    """Document embeds succeed but the query embed call fails afterwards."""

    class FailsOnSecondCall(FakeEmbedder):
        def embed_documents(self, texts):
            self.calls.append(list(texts))
            if len(self.calls) >= 2:
                raise RuntimeError("network dropped")
            return super().embed_documents(texts)

    cache_path = str(tmp_path / "embeddings.pkl")
    manual = {"a.md": "Use mnt to mount a disk."}

    result = semantic_search(
        "mount", manual, cache_path=cache_path, embedder=FailsOnSecondCall()
    )
    assert result is None


# ── search_manual integration: semantic first, keyword fallback ────────────


def test_search_manual_uses_semantic_results_when_available(monkeypatch):
    manual = {
        "shell.md": (
            "Use mnt to mount a D64 image.\n\n"
            "Use umnt to unmount the active image."
        )
    }

    fake_ranked = [(0.99, "shell.md", "Use mnt to mount a D64 image.")]
    monkeypatch.setattr(
        "agent_tools._try_semantic_search", lambda topic, content, top_k=8: fake_ranked
    )

    result = search_manual("how do I mount", manual)
    assert "=== shell.md ===" in result
    assert "Use mnt to mount a D64 image." in result
    # The other paragraph should NOT be included since semantic search
    # short-circuits the keyword path entirely.
    assert "unmount" not in result


def test_search_manual_falls_back_to_keyword_search_when_semantic_returns_none(
    monkeypatch,
):
    manual = {
        "shell.md": (
            "Use mnt to mount a D64 image.\n\n"
            "Use umnt to unmount the active image."
        )
    }

    monkeypatch.setattr(
        "agent_tools._try_semantic_search", lambda topic, content, top_k=8: None
    )

    result = search_manual("mount", manual)
    assert "mount a D64" in result


def test_search_manual_falls_back_to_keyword_search_when_semantic_returns_empty_list(
    monkeypatch,
):
    manual = {
        "shell.md": "Use mnt to mount a D64 image.",
    }

    monkeypatch.setattr(
        "agent_tools._try_semantic_search", lambda topic, content, top_k=8: []
    )

    result = search_manual("mount", manual)
    assert "mount a D64" in result


def test_search_manual_all_and_empty_topic_bypass_semantic_search(monkeypatch):
    """'all'/empty topic must still short-circuit to the full manual without
    ever consulting semantic search."""
    manual = {"a.md": "Section A.", "b.md": "Section B."}

    def _boom(*args, **kwargs):
        raise AssertionError("semantic search should not be called for 'all'/empty")

    monkeypatch.setattr("agent_tools._try_semantic_search", _boom)

    result_all = search_manual("all", manual)
    assert "=== a.md ===" in result_all and "=== b.md ===" in result_all

    result_empty = search_manual("", manual)
    assert "=== a.md ===" in result_empty and "=== b.md ===" in result_empty


def test_search_manual_semantic_module_import_failure_falls_back(monkeypatch):
    """If sdk.semantic_search can't even be imported, search_manual must still work."""
    import builtins

    manual = {"shell.md": "Use mnt to mount a D64 image."}

    real_import = builtins.__import__

    def _fake_import(name, *args, **kwargs):
        if name == "sdk.semantic_search":
            raise ImportError("simulated missing module")
        return real_import(name, *args, **kwargs)

    monkeypatch.setattr(builtins, "__import__", _fake_import)

    result = search_manual("mount", manual)
    assert "mount a D64" in result


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
