#!/bin/bash

# 13,28,43,58 6-16 * * 1-5 /Users/peterdburkholder/Projects/pburkholder/dotfiles/bin/checkin.sh

set -euo pipefail

# Path for GnuDate 
export PATH=/opt/homebrew/bin:$PATH

die() {
  echo $@
  exit 1
}

now() {
  gdate -Iseconds | tr -d '/n'
}

BINDIR=$HOME/Projects/pburkholder/dotfiles/bin/
LOGFILE=$BINDIR/checkin.log

[ -r $LOGFILE ] || die "No logfile $LOGFILE"

midnight=$(gdate -d "today 00:00" +%s)
tstamp=$(stat -f %Sm -t %s $LOGFILE)

if [ $tstamp -lt $midnight ]; then
  echo "$(now): LogFile hasnt been updated, running checkin.scpt"
  osascript $BINDIR/checkin.scpt
  echo "$(now): Ran Checkin" >> $LOGFILE
fi

# exit silently if no update

exit 0
