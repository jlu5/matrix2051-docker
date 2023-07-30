#!/bin/sh

cd /opt/matrix2051/matrix2051 || exit 1
_build/prod/rel/matrix2051/bin/matrix2051 start "$@"
