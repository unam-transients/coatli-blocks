#!/bin/sh

################################################################################

sudo -v

################################################################################

log () {
  echo 1>&2 "$(date '+%Y-%m-%d %H:%M:%S'): $(basename $0): $@"
}

################################################################################

log "starting."

################################################################################

cd $(dirname "$0")
log "working in $(pwd)/."

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
if test "$date" = "default"
then
  log "installing default blocks."
  dir=/usr/local/etc/tcs/blocks
else
  log "installing blocks for $date."
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
  log "priority $priority: all $prefix-* blocks."
  for file in $prefix-*.json
  do
    echo cp $file $dir/$priority-$file
  done
}

oneblock () {
  if test $# != 2
  then
    echo 1>&2 "usage: oneblock priority prefix"
    exit 1
  fi
  priority=$1
  prefix=$2
  log "priority $priority: one $prefix block."
  echo cp $prefix.json $dir/$priority-$prefix.json
}

################################################################################

log "generating blocks."

sh blocks-focus.sh
sh blocks-donut.sh
sh blocks-pointing-map.sh

################################################################################

log "installing blocks."

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
    #allblocks o 0007-donut

  fi

  oneblock f 2022A-2001-costero-0
  oneblock g 2022A-2000-fast-guiding-0
  oneblock h 2022A-2002-pereyra-0

  allblocks m 0004-initial-focus
  allblocks n 0004-focus
  
  allblocks x 0001-twilight-flats-evening
  allblocks y 0002-biases
  #allblocks y 0013-readnoise
  #allblocks z 0003-darks


) | sudo sh

log "finished installing blocks."

################################################################################

log "cleaning generated blocks."

rm -f 0007-donut-*.json
rm -f 0004-initial-focus-*.json
rm -f 0004-focus-*.json
rm -f 0008-pointing-map-*.json
rm -f 0012-focus-offsets-*.json

################################################################################

log "finished."

exit 0

################################################################################
