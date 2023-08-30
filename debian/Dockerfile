# Copyright (c) 2020, Moritz E. Beber.
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

ARG UID=998
ARG GID=998

RUN set -eux \
    && addgroup --system --gid ${GID} "${APP_USER}" \
    && adduser --system --no-create-home \
        --uid ${UID} \
        --gecos '' \
        --ingroup "${APP_USER}" \
        --disabled-password \
        "${APP_USER}"

RUN set -eux \
    && apt-get update \
    && apt-get install --yes --only-upgrade openssl ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/requirements

COPY requirements ./

RUN set -eux \
    && pip install --no-deps --require-hashes --requirement fastapi-requirements.txt \
    && rm -rf /root/.cache
