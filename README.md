# FastAPI-Base

[![master Build Status](https://travis-ci.org/Midnighter/fastapi-base.svg?branch=master)](https://travis-ci.org/Midnighter/fastapi-base)
[![Docker image pulls](https://img.shields.io/docker/pulls/midnighter/fastapi-base?style=plastic)](https://cloud.docker.com/repository/docker/midnighter/fastapi-base/)
[![License](https://img.shields.io/badge/license-Apache--2.0-blueviolet)](https://opensource.org/licenses/Apache-2.0)

A base Docker image for asynchronous microservices using FastAPI. The [Docker
image](alpine/Dockerfile) environment is based on Alpine Linux and Python that
provides [FastAPI](https://fastapi.tiangolo.com/) with
[gunicorn](https://gunicorn.org/) and [uvicorn
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
| 3.6-alpine3.10 | 3.6 | [Alpine Linux 3.10](https://www.alpinelinux.org/) |
| 3.7-alpine3.10 | 3.7 | [Alpine Linux 3.10](https://www.alpinelinux.org/) |

## Copyright

* Copyright © 2019, Moritz E. Beber. All rights reserved.
* Free software licensed under the [Apache License, Version 2.0](LICENSE).
