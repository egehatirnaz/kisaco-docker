#!/bin/bash
docker build -t app .
docker run -p 8080:8080 --rm -it app:latest