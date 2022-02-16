#!/bin/sh

echo 1>&2 "$0: starting."

cd $(dirname "$0")/..

echo 1>&2 "$0: cloning to blocks.new."
rm -rf blocks.new
mkdir blocks.new
if ! git clone -q https://github.com/alanwatsonforster/coatlioan-blocks.git blocks.new/
then
  echo 1>&2 "$0: clone failed."
  exit 1
fi

echo 1>&2 "$0: moving blocks to blocks.old."
rm -rf blocks.old
mv blocks blocks.old


echo 1>&2 "$0: moving blocks.new to blocks."
mv blocks.new blocks

echo 1>&2 "$0: finished."

exit 0
