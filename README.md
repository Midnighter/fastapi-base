# FastAPI-Base

[![Docker Image CI](https://github.com/Midnighter/fastapi-base/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/Midnighter/fastapi-base/actions)
[![Docker image pulls](https://img.shields.io/docker/pulls/midnighter/fastapi-base)](https://hub.docker.com/r/midnighter/fastapi-base)
[![License](https://img.shields.io/badge/license-Apache--2.0-blueviolet)](https://opensource.org/licenses/Apache-2.0)

A base [Docker](https://www.docker.com/) image for microservices using
[FastAPI](https://fastapi.tiangolo.com/). The Docker image environment is based
on [Debian](https://www.debian.org/) and provides a Python environment with
FastAPI, [gunicorn](https://gunicorn.org/), and [uvicorn
workers](https://www.uvicorn.org/) acting as an [Asynchronous Server Gateway
Interface (ASGI)](https://asgi.readthedocs.io/en/latest/).

## Design

What is special about this Docker image? There are two key elements:

1. The image is completely deterministic in the sense that all Python
   dependencies are pinned exactly using the `pip-compile` command from the
   [pip-tools](https://pypi.org/project/pip-tools/) including package hashes so
   that you can recreate the image exactly.
2. Every week, a [cron job](.github/workflows/cron-upgrade.yml) re-compiles the
   dependencies and if they changed, commits them.
3. When the dependencies change, the image is
   [re-built](.github/workflows/docker-image-ci.yml) and tagged with the
   information shown below, with the date of creation, and the short version of
   the commit hash, for example, `midnighter/fastapi-base:3.8-slim-buster_2020-07-03_d517373` That means, if
   you use these tags, you know _exactly_ what you are getting.

## Usage

You can combine this deterministic base image with your own in the following
ways. A tool like tag-spy can be used to retrieve the latest tag for each image
when you build your own.

```
docker run --rm dddecaf/tag-spy:latest tag-spy midnighter/fastapi-base 3.8-slim-buster

3.8-slim-buster_2020-07-03_d517373
```

All actual implementations of such microservices should be based on this image
and include the fastapi-requirements in their own requirements. In practice,
their `Dockerfile` needs to specify:

```dockerfile
ARG TAG=3.8-slim-buster_2020-07-03_d517373

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

| Tag                | Python | Distribution                               |
| ------------------ | ------ | ------------------------------------------ |
| 3.8-slim-bookworm  | 3.8    | [Debian Bookworm](https://www.debian.org/) |
| 3.9-slim-bookworm  | 3.9    | [Debian Bookworm](https://www.debian.org/) |
| 3.10-slim-bookworm | 3.10   | [Debian Bookworm](https://www.debian.org/) |
| 3.11-slim-bookworm | 3.11   | [Debian Bookworm](https://www.debian.org/) |

## Copyright

-   Copyright © 2019-23, Moritz E. Beber.
-   Free software licensed under the [Apache License, Version 2.0](LICENSE).
