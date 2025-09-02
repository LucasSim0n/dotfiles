#!/usr/bin/bash

killall automate_bg.sh

WALLPAPER_DIR="$HOME/Imágenes/Fondos/"

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"

$HOME/.config/hypr/resources/unify_bg.sh $WALLPAPER

$HOME/.config/hypr/resources/automate_bg.sh
