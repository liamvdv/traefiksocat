#!/bin/sh
set -e

SOCKET="${DD_DOGSTATSD_SOCKET:-/var/run/datadog/dsd.socket}"

# Run socat in the background
socat -s -u UDP-RECV:8125 UNIX-SENDTO:${SOCKET} &

/entrypoint.sh "$@"
