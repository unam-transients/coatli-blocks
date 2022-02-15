#!/bin/sh

cd $(dirname "$0")/..

rm -rf blocks.new
mkdir blocks.new
git clone https://github.com/alanwatsonforster/coatlioan-blocks.git blocks.new/

rm -rf blocks.old
mv blocks blocks.old
mv blocks.new blocks
