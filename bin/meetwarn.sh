#!/bin/sh 

warn() {
  message="Warning, $1 has been running for over an hour"
  osascript -e "tell app \"System Events\" to display dialog \"$message\""
#  echo $message | wall
}

ps -e -o etime,command | grep "Google Meet\.app" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Meet"
ps -e -o etime,command | grep "MacOS/zoom\.us" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Zoom"

