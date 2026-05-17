#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 2 ]]; then
    echo "usage: notify <time> <message>"
    echo "example: notify 10m 'take a break'"
    exit 1
fi

TIME="$1"
shift
MSG="$*"

systemd-run --user \
    --on-active="$TIME" \
    --unit="notify-$(date +%s)" \
    /usr/bin/notify-send "$MSG"
