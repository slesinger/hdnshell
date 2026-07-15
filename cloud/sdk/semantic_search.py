"""
Lightweight semantic search over the in-memory user manual.

Rationale (see project TODO.md): FAISS was suggested for in-memory similarity
search, but with ~25 short manual pages a full FAISS index is overkill. This
module instead:

  - Splits each manual page into paragraphs (same "\\n\\n" convention used by
    agent_tools.search_manual).
  - Embeds paragraphs with whatever LLM provider is already configured for the
    'chat' role (reusing sdk.config_manager.get_llm_config), via LangChain's
    OpenAIEmbeddings / AzureOpenAIEmbeddings — only these two providers expose
    an embeddings API compatible with the rest of the app's config shape.
  - Pickles a {content_sha256: embedding_vector} cache to disk so repeated
    runs only embed new/changed paragraphs.
  - Ranks paragraphs by plain numpy cosine similarity (no FAISS needed at this
    scale).

Every public function is designed to fail soft: missing packages, missing
credentials, network errors, or a corrupt cache must never raise out of this
module. Callers should treat `None` / `[]` as "semantic search unavailable,
fall back to keyword search".
"""

import hashlib
import logging
import os
import pickle
import threading

import numpy as np

logger = logging.getLogger(__name__)

# ── Cache location ──────────────────────────────────────────────────────────

_CACHE_LOCK = threading.Lock()


def get_embeddings_cache_path() -> str:
    """Return the on-disk path for the pickled embeddings cache.

    Lives under workspace/.cache/ so it sits alongside workspace/.config/ and
    is covered by the same gitignored `workspace/` tree.
    """
    from .workspace import WORKSPACE_DIR

    cache_dir = os.path.join(WORKSPACE_DIR, ".cache")
    return os.path.join(cache_dir, "manual_embeddings.pkl")


# ── Chunking ─────────────────────────────────────────────────────────────────


def chunk_manual(manual_content: dict) -> list[tuple[str, str]]:
    """Split each manual page into paragraphs, keeping each paragraph attached
    to its nearest preceding markdown heading.

    Plain "\\n\\n" splitting on its own separates a "## Section Title" line
    from the paragraphs under it. That starves both keyword and semantic
    matching of context: a command's own paragraph (e.g. "`ll` — List files
    on the current device.") may not share any words with a query like "what
    commands list directory", even though its section heading ("## Listing
    Files (Directory Listing)") does. Prepending the heading to each chunk
    keeps that context attached without merging whole sections into one
    giant chunk.

    Returns a list of (filename, chunk_text) tuples.
    """
    chunks = []
    for fname, text in (manual_content or {}).items():
        heading = ""
        for para in (text or "").split("\n\n"):
            para_clean = para.strip()
            if not para_clean:
                continue
            first_line = para_clean.splitlines()[0].strip()
            if first_line.startswith("#"):
                heading = first_line.lstrip("#").strip()
                chunks.append((fname, para_clean))
                continue
            if heading:
                chunks.append((fname, f"{heading}\n{para_clean}"))
            else:
                chunks.append((fname, para_clean))
    return chunks


def _content_key(model_name: str, text: str) -> str:
    """Cache key: sha256 of the embedding model name + paragraph text.

    Including the model name means switching embedding models naturally
    invalidates old cache entries instead of mixing incompatible vectors.
    """
    digest = hashlib.sha256()
    digest.update((model_name or "").encode("utf-8"))
    digest.update(b"\x00")
    digest.update(text.encode("utf-8"))
    return digest.hexdigest()


# ── Disk cache ───────────────────────────────────────────────────────────────


def _load_cache(cache_path: str) -> dict:
    """Load the pickled {key: embedding} cache. Never raises.

    Any read/parse failure (missing file, corrupt pickle, wrong type, etc.)
    results in an empty cache rather than a crash.
    """
    if not os.path.exists(cache_path):
        return {}
    try:
        with open(cache_path, "rb") as fh:
            data = pickle.load(fh)
        if not isinstance(data, dict):
            logger.warning(
                "Embeddings cache at %s is not a dict, starting fresh", cache_path
            )
            return {}
        return data
    except Exception as e:
        logger.warning(
            "Could not read embeddings cache at %s (%s), starting fresh",
            cache_path,
            e,
        )
        return {}


def _save_cache(cache_path: str, cache: dict) -> None:
    """Persist the cache dict to disk. Never raises."""
    try:
        os.makedirs(os.path.dirname(cache_path), exist_ok=True)
        tmp_path = cache_path + ".tmp"
        with open(tmp_path, "wb") as fh:
            pickle.dump(cache, fh, protocol=pickle.HIGHEST_PROTOCOL)
        os.replace(tmp_path, cache_path)
    except Exception as e:
        logger.warning("Could not write embeddings cache at %s: %s", cache_path, e)


# ── Embeddings provider ──────────────────────────────────────────────────────


def _create_embedder():
    """Create a LangChain embeddings object from the 'chat' LLM role config.

    Reuses sdk.config_manager.get_llm_config('chat') the same way llm_factory
    builds chat models, since embeddings need the same provider/credentials.
    Only openai_compatible and azure_openai expose an embeddings API here;
    other providers (anthropic, gemini, gemini_vertexai) don't have an
    embeddings client wired up in this project, so they return None.

    Returns an object with `.embed_documents(list[str])` and an
    `embedding_model_name` attribute, or None if unavailable (missing
    package, missing credentials, unsupported provider).
    """
    try:
        from sdk.config_manager import get_llm_config
    except ImportError:
        return None

    try:
        cfg = get_llm_config("chat")
    except Exception as e:
        logger.info("Could not read chat LLM config for embeddings: %s", e)
        return None

    provider = cfg.get("provider", "")
    api_key = cfg.get("api_key", "")

    if provider == "openai_compatible":
        if not api_key:
            logger.info("No API key configured for embeddings (openai_compatible)")
            return None
        try:
            from langchain_openai import OpenAIEmbeddings
        except ImportError as e:
            logger.info("langchain_openai not installed, semantic search disabled: %s", e)
            return None

        model_name = os.environ.get("HDNSH_EMBEDDING_MODEL", "text-embedding-3-small")
        kwargs = {"model": model_name, "api_key": api_key}
        endpoint = cfg.get("endpoint", "")
        if endpoint:
            kwargs["base_url"] = endpoint
        try:
            embedder = OpenAIEmbeddings(**kwargs)
        except Exception as e:
            logger.info("Could not create OpenAIEmbeddings: %s", e)
            return None
        return embedder

    if provider == "azure_openai":
        endpoint = cfg.get("endpoint", "")
        if not api_key or not endpoint:
            logger.info("Azure embeddings requires api_key and endpoint")
            return None
        try:
            from langchain_openai import AzureOpenAIEmbeddings
        except ImportError as e:
            logger.info("langchain_openai not installed, semantic search disabled: %s", e)
            return None

        model_name = os.environ.get(
            "HDNSH_EMBEDDING_DEPLOYMENT", "text-embedding-3-small"
        )
        api_version = cfg.get("api_version", "") or "2024-02-15-preview"
        try:
            embedder = AzureOpenAIEmbeddings(
                azure_deployment=model_name,
                api_version=api_version,
                azure_endpoint=endpoint,
                api_key=api_key,
            )
        except Exception as e:
            logger.info("Could not create AzureOpenAIEmbeddings: %s", e)
            return None
        return embedder

    logger.info(
        "No embeddings support for provider '%s', semantic search disabled", provider
    )
    return None


# ── Embedding + cache orchestration ─────────────────────────────────────────


def _resolve_embedding_model_name(embedder) -> str:
    """Best-effort model/deployment name for the cache key.

    Real langchain_openai embedder instances are pydantic models with
    extra='forbid', so we can't stash a custom `embedding_model_name`
    attribute on them (that used to raise "object has no field
    'embedding_model_name'" for AzureOpenAIEmbeddings/OpenAIEmbeddings).
    Instead read whichever real field is populated: `embedding_model_name`
    for test doubles, `model` for OpenAIEmbeddings, `deployment` for
    AzureOpenAIEmbeddings (its `azure_deployment` constructor kwarg is an
    alias for the `deployment` field).
    """
    for attr in ("embedding_model_name", "model", "deployment"):
        value = getattr(embedder, attr, None)
        if value:
            return value
    return ""


def _embed_chunks(embedder, chunks: list[tuple[str, str]], cache_path: str):
    """Return {paragraph_text: np.ndarray} for all chunks, using/updating the cache.

    Only chunks missing from the cache are sent to the embedder. Returns None
    if embedding fails outright (e.g. network error on the first call).
    """
    model_name = _resolve_embedding_model_name(embedder)

    with _CACHE_LOCK:
        cache = _load_cache(cache_path)

        texts_by_key = {}
        for _, para in chunks:
            key = _content_key(model_name, para)
            texts_by_key.setdefault(key, para)

        missing_keys = [key for key in texts_by_key if key not in cache]

        if missing_keys:
            missing_texts = [texts_by_key[key] for key in missing_keys]
            try:
                vectors = embedder.embed_documents(missing_texts)
            except Exception as e:
                logger.info("Embedding call failed: %s", e)
                return None

            if not vectors or len(vectors) != len(missing_keys):
                logger.warning("Embedding provider returned unexpected result shape")
                return None

            for key, vec in zip(missing_keys, vectors):
                cache[key] = np.asarray(vec, dtype=np.float32)

            _save_cache(cache_path, cache)

        # Build paragraph -> vector map for the requested chunks only.
        result = {}
        for key, para in texts_by_key.items():
            vec = cache.get(key)
            if vec is not None:
                result[para] = vec
        return result


# ── Public API ───────────────────────────────────────────────────────────────


def _cosine_similarity(query_vec: np.ndarray, matrix: np.ndarray) -> np.ndarray:
    """Cosine similarity between a single query vector and a matrix of rows."""
    query_norm = np.linalg.norm(query_vec)
    if query_norm == 0:
        return np.zeros(matrix.shape[0], dtype=np.float32)
    row_norms = np.linalg.norm(matrix, axis=1)
    row_norms[row_norms == 0] = 1e-12
    return (matrix @ query_vec) / (row_norms * query_norm)


def semantic_search(
    query: str,
    manual_content: dict,
    top_k: int = 8,
    cache_path: str = None,
    embedder=None,
) -> list:
    """Rank manual paragraphs against *query* using embedding cosine similarity.

    Returns a list of (score, filename, paragraph) tuples sorted by descending
    score, or None if semantic search is unavailable for any reason (no
    provider/credentials, missing packages, network error, empty manual, ...).
    An empty manual or empty query also returns None so callers fall back to
    the existing keyword search path.

    Args:
        query: natural-language search text.
        manual_content: {filename: full_text} dict.
        top_k: max number of ranked results to return.
        cache_path: override for the pickle cache location (mainly for tests).
        embedder: override embeddings provider (mainly for tests); must expose
            `.embed_documents(list[str]) -> list[vector]` and, ideally, an
            `embedding_model_name` attribute used in the cache key.
    """
    query = (query or "").strip()
    if not query or not manual_content:
        return None

    chunks = chunk_manual(manual_content)
    if not chunks:
        return None

    try:
        if embedder is None:
            embedder = _create_embedder()
        if embedder is None:
            return None

        if cache_path is None:
            cache_path = get_embeddings_cache_path()

        para_to_vec = _embed_chunks(embedder, chunks, cache_path)
        if not para_to_vec:
            return None

        # Embed the query itself (not cached — queries are one-off).
        try:
            query_vecs = embedder.embed_documents([query])
        except Exception as e:
            logger.info("Embedding query failed: %s", e)
            return None
        if not query_vecs:
            return None
        query_vec = np.asarray(query_vecs[0], dtype=np.float32)

        # Preserve (filename, paragraph) order while only scoring paragraphs
        # that were successfully embedded.
        scored_chunks = [(fname, para) for fname, para in chunks if para in para_to_vec]
        if not scored_chunks:
            return None

        matrix = np.vstack([para_to_vec[para] for _, para in scored_chunks])
        scores = _cosine_similarity(query_vec, matrix)

        ranked = [
            (float(scores[i]), fname, para)
            for i, (fname, para) in enumerate(scored_chunks)
        ]
        ranked.sort(key=lambda item: item[0], reverse=True)
        return ranked[:top_k]
    except Exception as e:
        # Belt-and-braces: nothing from this module should ever propagate to
        # the caller as an exception.
        logger.info("Semantic search unavailable: %s", e)
        return None
