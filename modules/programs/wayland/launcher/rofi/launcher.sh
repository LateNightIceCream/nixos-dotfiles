#!/usr/bin/env bash
theme="themes/launcher_theme.rasi"
dir="$HOME/.config/rofi"

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
