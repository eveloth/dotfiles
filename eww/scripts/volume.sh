#!/bin/sh

echo "`wpctl get-volume @DEFAULT_SINK@ | sed 's/.* //'`" '* 100' | bc | sed 's/\..*//'
