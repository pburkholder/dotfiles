#!/bin/sh 

warn() {
  ps -e -o command | grep -q "[Z]oom/Meet Warning" && return  # Already running
  message="Zoom/Meet Warning, $1 has been running for over an hour"
  osascript -e "tell app \"System Events\" to display dialog \"$message\""
}

ps -e -o etime,command | grep "Google Meet\.app" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Meet"
ps -e -o etime,command | grep "MacOS/zoom\.us" | awk '{print $1}' | grep -q '\d:\d\d:\d\d' && warn "Zoom"

