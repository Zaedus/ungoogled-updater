#!/bin/bash

# Error Handling

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG

trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# Colors

YELLOW=$'\e[1;33m'
RESET=$'\e[0m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'

# Constants

LOCAL="$HOME/.local"
BIN="$LOCAL/bin"
SCRIPTURL="https://raw.githubusercontent.com/Zaedus/ungoogled-updater/master/ungoogled-updater.sh"
DEFAULTSCRIPTNAME="update-ungoogled"

# Check if the local bin exists

if [ ! -d "$HOME/.local/bin" ]; then
  if [ ! -d "$HOME/.local" ]; then
    mkdir "$HOME/.local"
  fi
  mkdir "$HOME/.local/bin"
fi

# Ask for custom script name

read -p "What do you want the script name to be? [$DEFAULTSCRIPTNAME] " NAME

# If the user didn't input anything, then 
if [ -z "$NAME" ]; then
  echo "default"
  NAME="$DEFAULTSCRIPTNAME"
fi

echo "$YELLOW::$RESET Downloading the update script..."
curl -Lo "$BIN/$NAME" $SCRIPTURL
echo " Making the script executable..."
chmod +x "$BIN/$NAME"
echo "$YELLOW::$RESET" $GREEN"Done!$RESET"
