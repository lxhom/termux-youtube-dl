#!/bin/bash
clear

set -x
if [[ "$1" =~ ^.*youtu.*$ ]] || [[ "$1" =~ ^.*youtube.*$ ]]; then
  echo -e "Downloading video...\\n>URL: ${1}\\n"
  youtube-dl -F "\"$1\""
  read -p "Choose your video quality (sd, hd or best): " video

  if [[ "$video" = "sd" ]]; then
    video="18"
  fi
  if [[ "$video" = "hd" ]]; then
    video="22"
  fi
  youtube-dl -f "$video" "\"$1\""
elif [[ "$1" =~ ^.*nourlselected.*$ ]]; then
  echo "There was an error"
else youtube-dl -f best "\"$1\""
fi

read -p "Press enter to continue"
