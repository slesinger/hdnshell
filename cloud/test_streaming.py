import queue
import struct
import sys
import threading
import time
import types
from pathlib import Path

import pytest


def _load_cloud_module():
    cloud_dir = Path(__file__).resolve().parent

    flask_sock_stub = types.ModuleType("flask_sock")

    class Sock:
        def __init__(self, _app):
            pass

        def route(self, _path):
            def decorator(func):
                return func

            return decorator

    flask_sock_stub.Sock = Sock

    sys.modules.setdefault(
        "feedparser", types.SimpleNamespace(parse=lambda *args, **kwargs: None)
    )
    sys.modules.setdefault("flask_sock", flask_sock_stub)
    if str(cloud_dir) not in sys.path:
        sys.path.insert(0, str(cloud_dir))

    import cloud

    return cloud


def test_udp_receiver_keeps_client_when_queue_is_full(monkeypatch):
    cloud = _load_cloud_module()

    payload = b"frame"
    client_q = queue.Queue(maxsize=1)
    client_q.put_nowait(b"old")
    clients = [client_q]
    lock = threading.Lock()
    stop_event = threading.Event()

    class FakeSocket:
        def setsockopt(self, *args):
            pass

        def bind(self, *args):
            pass

        def settimeout(self, *args):
            pass

        def recvfrom(self, _size):
            stop_event.set()
            return payload, ("127.0.0.1", cloud.U64_VIDEO_UDP_PORT)

        def close(self):
            pass

    monkeypatch.setattr(cloud.socket, "socket", lambda *args, **kwargs: FakeSocket())

    cloud._udp_receiver(cloud.U64_VIDEO_UDP_PORT, lambda: True, clients, lock, stop_event)

    assert clients == [client_q]
    assert client_q.qsize() == 1
    assert client_q.get_nowait() == b"old"


def _reset_video_state(cloud):
    cloud._video_active = False
    cloud._video_stop_event = None
    with cloud._video_lock:
        cloud._video_clients.clear()


def _last_packet_marker() -> bytes:
    """A minimal 12-byte packet that only carries the frame-complete flag
    (pkt_width=0 short-circuits pixel decoding in decode_vic_packet)."""
    return struct.pack("<4xHHBB2x", 0x8000, 0, 0, 4)


def _feed_consumer_queue_once_registered(cloud, packets, ready_timeout=2.0):
    """Wait for capture_video_frame() to register its consumer queue in
    _video_clients, then push synthetic packets into it. Runs in a thread
    since capture_video_frame() blocks reading from that same queue."""
    deadline = time.monotonic() + ready_timeout
    while time.monotonic() < deadline:
        with cloud._video_lock:
            clients = list(cloud._video_clients)
        if clients:
            for packet in packets:
                clients[-1].put(packet)
            return
        time.sleep(0.01)
    raise TimeoutError("capture_video_frame never registered its consumer queue")


def test_capture_video_frame_reuses_already_active_stream(monkeypatch):
    cloud = _load_cloud_module()
    _reset_video_state(cloud)
    cloud._video_active = True  # simulate a browser already watching

    def _fail_if_called(*args, **kwargs):
        raise AssertionError("should not (re)start an already-active stream")

    monkeypatch.setattr(cloud, "_ensure_video_stream_active", _fail_if_called)
    monkeypatch.setattr(cloud, "_stop_video_stream_internal", _fail_if_called)

    feeder = threading.Thread(
        target=_feed_consumer_queue_once_registered,
        args=(cloud, [_last_packet_marker(), _last_packet_marker()]),
        daemon=True,
    )
    feeder.start()
    try:
        png = cloud.capture_video_frame(timeout_seconds=3.0)
    finally:
        feeder.join(timeout=2.0)

    assert png.startswith(b"\x89PNG\r\n\x1a\n")
    # The consumer queue must be unregistered again after capture.
    assert cloud._video_clients == []


def test_capture_video_frame_starts_and_stops_stream_when_idle(monkeypatch):
    cloud = _load_cloud_module()
    _reset_video_state(cloud)

    calls = {"start": 0, "stop": 0}

    def _fake_start():
        calls["start"] += 1
        cloud._video_active = True
        return "127.0.0.1"

    def _fake_stop():
        calls["stop"] += 1
        cloud._video_active = False

    monkeypatch.setattr(cloud, "_ensure_video_stream_active", _fake_start)
    monkeypatch.setattr(cloud, "_stop_video_stream_internal", _fake_stop)

    feeder = threading.Thread(
        target=_feed_consumer_queue_once_registered,
        args=(cloud, [_last_packet_marker(), _last_packet_marker()]),
        daemon=True,
    )
    feeder.start()
    try:
        png = cloud.capture_video_frame(timeout_seconds=3.0)
    finally:
        feeder.join(timeout=2.0)

    assert png.startswith(b"\x89PNG\r\n\x1a\n")
    assert calls == {"start": 1, "stop": 1}


def test_capture_video_frame_times_out_with_no_packets(monkeypatch):
    cloud = _load_cloud_module()
    _reset_video_state(cloud)
    cloud._video_active = True  # avoid touching the real start/stop machinery

    monkeypatch.setattr(
        cloud, "_ensure_video_stream_active", lambda: (_ for _ in ()).throw(AssertionError())
    )

    with pytest.raises(RuntimeError):
        cloud.capture_video_frame(timeout_seconds=0.3)