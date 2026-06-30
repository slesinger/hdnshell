import queue
import sys
import threading
import types
from pathlib import Path


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