# FastAPI-Base

![master Branch](https://img.shields.io/badge/branch-master-blue.svg)
[![master Build Status](https://travis-ci.org/Midnighter/fastapi-base.svg?branch=master)](https://travis-ci.org/Midnighter/fastapi-base)

A base Docker image for asynchronous microservices using FastAPI. This
repository defines a minimal [Docker image](alpine/Dockerfile) based on Alpine
Linux 3.9 and Python 3.7 that provides [FastAPI](https://fastapi.tiangolo.com/)
with [gunicorn](https://gunicorn.org/) and [uvicorn
workers](https://www.uvicorn.org/) acting as an [Asynchronous Server Gateway
Interface (ASGI)](https://asgi.readthedocs.io/en/latest/).

## Usage

All actual implementations of such microservices should be based on this image
and include the fastapi-requirements in their own requirements. In practice,
their `Dockerfile` needs to specify:

```dockerfile
FROM midnighter/fastapi-base:master
```

and their `requirements.in` file:

```
-r /opt/requirements/fastapi-requirements.txt
```

such that pinned (deterministic) versions are guaranteed.

## Copyright

* Copyright © 2019, Moritz E. Beber. All rights reserved.
* Free software licensed under the [Apache License, Version 2.0](LICENSE).
