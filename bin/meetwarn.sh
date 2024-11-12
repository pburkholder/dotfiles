#!/bin/sh 

warn() {
#  ps -e -o command | grep -q "[Z]oom/Meet Warning" && return  # Already running
  message="Zoom/Meet Warning, $1 has been running for over an hour"
  osascript -e "tell app \"System Events\" to display dialog \"$message\""
}

alias g="awk '{print $1}' | grep -q '0[12]:[03]\d:\d\d'"

ps -e -o etime,command | grep "Google Meet\.app" | g  && warn "Meet"
ps -e -o etime,command | grep "MacOS/zoom\.us"   | g  && warn "Zoom"

