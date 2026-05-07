#!/bin/bash

set -euo pipefail

die() {
  echo $@
  exit 1
}

BINDIR=$HOME/Projects/pburkholder/dotfiles/bin/
LOGFILE=$BINDIR/checkin.log

[ -r $LOGFILE ] || die "No logfile $LOGFILE"

midnight=$(gdate -d "today 00:00" +%s)
tstamp=$(stat -f %Sm -t %s $LOGFILE)

echo midnight: $midnight tstamp: $tstamp

if [ $tstamp -lt $midnight ]; then
  echo "LogFile hasnt been updated, running checking"
  osascript $BINDIR/checkin.scpt
  now=$(gdate | tr -d '/n')
  echo "$now: Ran Checkin" >> $LOGFILE
else
   echo "LogFile up to date"
fi

exit 0
