#!/bin/sh

################################################################################

sudo -v

################################################################################

log () {
  echo 1>&2 "$(date -u '+%F %T'): $(basename $0): $@"
}

################################################################################

log "starting."

################################################################################

cd $(dirname "$0")
log "working in $(pwd)/."

################################################################################

queuedir=/usr/local/var/tcs/blocks
sudo mkdir -p "$queuedir"

################################################################################

case $1 in
"")
  targetdate=$(date +%Y%m%d)
  ;;
[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  targetdate="$1"
  ;;
*)
  targetdate=$(date +%Y%m%d -d "$1")
  ;;
esac

log "target date $targetdate."

targetdayofyear="$(date +%j -d $targetdate | sed 's/^0*//')"
log "target day of year is $targetdayofyear."

################################################################################

log "generating blocks."

sh blocks-focus.sh
sh blocks-donut.sh
sh blocks-pointing-map.sh

################################################################################

log "installing blocks."

expand BLOCKS |
awk \
 -v queuedir="$queuedir" \
 -v targetdate="$targetdate" \
 -v targetdayofyear="$targetdayofyear" \
'
/^ *#/ {
  # Skip comment lines.
  next;
}
/^ *$/ {
  # Skip empty lines.
  next;
}
NF >= 3 {
  priority   = $1
  duplicates = $2
  blockfile  = $3
}
NF == 6 && $4 == "day" {
  phase = $5
  period = $6
  if (phase != targetdayofyear % period)
    next;
}
NF == 5 && $4 == "on" {
  date = $5
  if (date != targetdate)
    next;
}
{
  if (duplicates > 999) {
    duplicates = 999
  }
}
{
  for (i = 0; i < duplicates; ++i)
    printf("for blockfile in %s.json; do cp $blockfile %s/%s-%03d-$blockfile; done\n", blockfile, queuedir, priority, i)
}
' | sudo sh -x

log "finished installing blocks."

################################################################################

log "cleaning generated blocks."

rm -f 0004-initial-focus-*.json
rm -f 0004-focus-*.json
rm -f 0007-donut-*.json
rm -f 0008-pointing-map-*.json
rm -f 0012-focus-offsets-*.json

################################################################################

log "finished."

exit 0

################################################################################
