#!/bin/sh

log () {
  echo 1>&2 "$(date '+%Y-%m-%d %H:%M:%S'): $(basename $0): $@"
}

log "starting."

cd $(dirname "$0")/..

log "working in $(pwd)/."

log "cloning to blocks.new/."
rm -rf blocks.new
mkdir blocks.new
if ! git clone -q https://github.com/alanwatsonforster/coatlioan-blocks.git blocks.new/
then
  echo 1>&2 "$0: clone failed."
  exit 1
fi

log "moving blocks/ to blocks.old/."
rm -rf blocks.old
mv blocks blocks.old


log "moving blocks.new/ to blocks/."
mv blocks.new blocks

log "finished."

exit 0
