#!/bin/sh

cd "$(dirname "$0")"

################################################################################

case $1 in
default|[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  date="$1"
  ;;
"")
  date=$(date +%Y%m%d -d tomorrow)
  ;;
*)
  date=$(date +%Y%m%d -d "$1")
  ;;
esac
echo "$date"
if test "$date" = "default"
then
  dir=/usr/local/etc/tcs/blocks
else
  dir=/usr/local/var/tcs/$date/blocks
fi

################################################################################

allblocks () {
  if test $# != 2
  then
    echo 1>&2 "usage: allblocks priority prefix"
    exit 1
  fi
  priority=$1
  prefix=$2
  for file in $prefix-*.json
  do
    echo cp $file $dir/$priority-$file
  done
}

singleblock () {
  if test $# != 2
  then
    echo 1>&2 "usage: singleblock priority prefix"
    exit 1
  fi
  priority=$1
  prefix=$2
  echo cp $prefix.json $dir/$priority-$prefix.json
}

################################################################################

sh focus.sh
sh donut.sh
sh pointing-map.sh

################################################################################

(
  echo mkdir -p $dir
  
  if test "$date" = "default"  
  then
    echo rm -rf $dir
  fi

  echo mkdir -p $dir

  if test "$date" != "default"  
  then
    
    :
    
    #allblocks v 0012-focus-offsets
    #allblocks w 0008-pointing-map
    allblocks o 0007-donut

  fi

  singleblock f 2022A-2001-costero-0
  singleblock g 2022A-2000-fast-guiding-0
  singleblock h 2022A-2002-pereyra-0

  allblocks m 0004-initial-focus
  allblocks n 0004-focus
  
  allblocks x 0001-twilight-flats-evening
  allblocks y 0002-biases
  #allblocks y 0013-readnoise
  #allblocks z 0003-darks


) | sudo sh

################################################################################

rm -f 0007-donut-*.json
rm -f 0004-initial-focus-*.json
rm -f 0004-focus-*.json
rm -f 0008-pointing-map-*.json
rm -f 0012-focus-offsets-*.json

################################################################################
