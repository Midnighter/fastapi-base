# Copyright (c) 2018-2019 Novo Nordisk Foundation Center for Biosustainability,
# Technical University of Denmark.
# Copyright (c) 2019, Moritz E. Beber.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG TAG

FROM python:${TAG}

ENV PYTHONUNBUFFERED=1
ENV APP_USER=mini

ARG UID=1000
ARG GID=1000

RUN addgroup -S -g "${GID}" "${APP_USER}" && \
    adduser -S -H -u "${UID}" -G "${APP_USER}" "${APP_USER}"

WORKDIR /opt/requirements

COPY requirements ./

# `g++` is required for building `gevent` but all build dependencies are
# later removed again to reduce the layer size.
RUN set -eux \
    && apk add --update openssl ca-certificates \
    && apk add --virtual .build-deps build-base openssl-dev libffi-dev yaml-dev \
    && pip install --upgrade pip setuptools wheel pip-tools \
    && pip-sync fastapi-requirements.txt \
    && rm -rf /root/.cache \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*
