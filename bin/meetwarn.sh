#!/bin/sh 

warn() {
  echo Warning, $1 has been running for over an hour | wall
}

ps -e -o etime,command | grep "Google Meet\.app" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Meet"

ps -e -o etime,command | grep "Macos/zoom\.us" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Zoom"
