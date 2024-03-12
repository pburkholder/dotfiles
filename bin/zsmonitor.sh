#!/bin/bash 

TIMEOUT=5
recent_files=$(find "/Library/Application Support/Zscaler" -name 'ZSA*' -mmin -$TIMEOUT | wc -l | sed -e 's/ //g')

if [ "$recent_files" = "0" ]; then
  echo "ZScaler: no recent activity" | wall
  exit 1
else
  exit 0
fi
