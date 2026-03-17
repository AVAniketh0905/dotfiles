#!/usr/bin/env bash

# Returns current fcitx5 input: EN / JP
im=$(fcitx5-remote)
case "$im" in
    1) echo "A" ;;   # English
    2) echo "あ" ;;  # Japanese
    *) echo "?" ;;
esac
