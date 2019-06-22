#!/bin/bash
# (c) 2019 Karl Cronburg
# This code is licensed under the MIT license (see LICENSE.txt)

if [ -z "$1" ]; then
  echo "Usage: $0 [/mnt/music]"
  exit
fi

if ! command -v unix2dos &>/dev/null; then
  echo "Must install unix2dos."
fi

cd "$1/Music";

playlistMe() {
  shopt -s nocaseglob
  dir="$1"
  cd "$dir"
  if ls -1 | egrep -i "\.(aac|mp3|m4a|wma|wav|flac|ogg)" &>/dev/null; then
    m3u="$dir.m3u"
    rm -f *.m3u
    echo "#EXTM3U" > $m3u
    for audio_file in *.aac *.mp3 *.m4a *.wma *.wav *.flac *.ogg; do
      echo -n "#EXTINF:0," >> "$m3u"
      echo "$audio_file" >> "$m3u"
      echo "$audio_file" >> "$m3u"
      echo "" >> "$m3u"
    done
    unix2dos "$m3u"
  fi
  cd ..
}

export -f playlistMe
find . -type d -exec bash -c 'playlistMe "$0"' "{}" \;

