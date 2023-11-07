ARG PYTHON_VERSION=3.11
ARG DEBIAN_VERSION=bullseye
FROM python:${PYTHON_VERSION}-${DEBIAN_VERSION} as test

WORKDIR /app

COPY src/ src/


RUN python src/main.py && \
  tar -czf random_bytes.tar.gz random_bytes.json
# tar --compress --create --file random_bytes.tar.gz random_bytes.json
