#!/usr/bin/env bash

set -euo pipefail

directory="${1}"
tag="${2}"
requirements="$(realpath --canonicalize-existing --logical "$(dirname "${BASH_SOURCE[0]}")/../${directory}/requirements")"

docker run --rm \
    --mount "source=${requirements},target=/opt/requirements,type=bind" \
    midnighter/pip-compile:${tag} \
    --allow-unsafe --upgrade --verbose fastapi-requirements.in
