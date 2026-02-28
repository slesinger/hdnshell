# Makefile for Hondani Shell project - Server Side


.PHONY: run-server run-client test-server test-client


run-server:
	python3 cloud.py

run-client:
	python3 cloud_test_client.py


# Tests
test-server:
	PYTHONWARNINGS="ignore::DeprecationWarning:.*site-packages.*" pytest

test-client:
	PYTHONWARNINGS="ignore::DeprecationWarning:.*site-packages.*" pytest test_cloud_test_client.py

