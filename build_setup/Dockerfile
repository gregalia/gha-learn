ARG PYTHON_VERSION=3.11
ARG DEBIAN_VERSION=bullseye
FROM python:${PYTHON_VERSION}-${DEBIAN_VERSION} as test

WORKDIR /app

COPY src/ src/

RUN python src/main.py && \
  mkdir -p artifacts && \
  tar -czf artifacts/random_bytes.tgz random_bytes.json
