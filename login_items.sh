#!/bin/bash

echo Add /Application installed apps
for app in Flycut Spectacle Alfred\ 3;
do
  osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/'$app'.app", hidden:false}'
done


echo Add locally installed apps
for app in Caffeine; do
  osascript -e 'tell application "System Events" to make login item at end with properties {path:"'$HOME/'/Applications/'$app'.app", hidden:false}'

done


osascript -e 'tell application "System Events" to get the name of every login item'
