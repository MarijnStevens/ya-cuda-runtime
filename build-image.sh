#!/bin/bash
docker build -t ya-cuda-test-img .
docker run ya-cuda-test-img
gvmkit-build ya-cuda-test-img
