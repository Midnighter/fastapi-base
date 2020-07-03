# FastAPI-Base

[![Docker Image CI](https://github.com/Midnighter/fastapi-base/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/Midnighter/fastapi-base/actions)
[![Docker image pulls](https://img.shields.io/docker/pulls/midnighter/fastapi-base)](https://hub.docker.com/r/midnighter/fastapi-base)
[![License](https://img.shields.io/badge/license-Apache--2.0-blueviolet)](https://opensource.org/licenses/Apache-2.0)

A base Docker image for microservices using FastAPI. The Docker image
environment is based on either Alpine Linux or Debian and provides a Python
environment with [FastAPI](https://fastapi.tiangolo.com/),
[gunicorn](https://gunicorn.org/), and [uvicorn
workers](https://www.uvicorn.org/) acting as an [Asynchronous Server Gateway
Interface (ASGI)](https://asgi.readthedocs.io/en/latest/).

## Usage

All actual implementations of such microservices should be based on this image
and include the fastapi-requirements in their own requirements. In practice,
their `Dockerfile` needs to specify:

```dockerfile
FROM midnighter/fastapi-base:${TAG}
```

and their `requirements.in` file:

```
-r /opt/requirements/fastapi-requirements.txt
```

such that pinned (deterministic) versions are guaranteed.

## Python Environments

Images are generated for the following environments. Please [open an
issue](https://github.com/Midnighter/fastapi-base/issues/new) if you require
others.

| Tag | Python | Distribution |
| --- | ------ | ------------ |
| 3.8-alpine3.12 | 3.8 | [Alpine Linux 3.12](https://www.alpinelinux.org/) |
| 3.8-slim-buster | 3.8 | [Debian Buster](https://www.debian.org/) |

## Copyright

* Copyright © 2019, Moritz E. Beber.
* Free software licensed under the [Apache License, Version 2.0](LICENSE).
