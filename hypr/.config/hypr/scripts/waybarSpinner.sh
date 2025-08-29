#!/usr/bin/env bash
# Waybar custom module용 초간단 ASCII 스피너
# 환경변수:
#   SPINNER_INTERVAL : 프레임 간격(초). 기본 0.12
#   SPINNER_PREFIX   : 앞에 붙일 문자열(옵션)
#   SPINNER_SUFFIX   : 뒤에 붙일 문자열(옵션)

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
