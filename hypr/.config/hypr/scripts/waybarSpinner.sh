#!/usr/bin/env bash

set -Eeuo pipefail
export PATH="/usr/bin:/usr/local/bin:$PATH"

INTERVAL="${SPINNER_INTERVAL:-0.12}"
PREFIX="${SPINNER_PREFIX:-}"
SUFFIX="${SPINNER_SUFFIX:-}"

# 프레임 배열
frames=("-" "\\" "|" "/")

# 무한 루프: 각 프레임을 한 줄씩 출력 (Waybar는 개행마다 갱신)
while :; do
    for f in "${frames[@]}"; do
        printf '%s%s%s\n' "$PREFIX" "$f" "$SUFFIX"
        sleep "$INTERVAL"
    done
done
