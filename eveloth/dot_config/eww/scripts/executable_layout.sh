#!/bin/sh

hyprctl devices -j | jq '.keyboards.[] | select(.name == '\"$1\"') | {layout: .active_keymap}'
