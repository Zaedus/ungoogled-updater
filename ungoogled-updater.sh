#!/bin/bash

# Colors

YELLOW=$'\e[1;33m'
RESET=$'\e[0m'
RED=$'\e[1;31m'


# Error Handling

set -e # Yes yes, I know this isn't a best practice


onexit() {
  echo ":: $RED""Installaton Failed!$RESET"
}

trap onexit EXIT

# Constants

BASEURL="https://ungoogled-software.github.io"
SOURCEURL="$BASEURL/ungoogled-chromium-binaries/"
DOWNLOADPATH="/tmp/ungoogled-chromium.pkg.tar.zst"

# Running

echo "$YELLOW::$RESET Getting latest download for Arch Linux..."

URLS=$(curl -s $SOURCEURL | hxwls | grep archlinux)
echo " Found $(echo $URLS | wc -w) matching URLs on page."
LATESTPAGE=$(echo $URLS | awk '{print $2}')
echo " Selected '$LATESTPAGE'."

echo "$YELLOW::$RESET Downloading latest version to '$DOWNLOADPATH'..."

DL_URL=$(curl -s "$BASEURL$LATESTPAGE" | hxwls | grep download)
echo " Found latest download URL."
rm -f $DOWNLOADPATH
echo " Removed old package."
curl -Lo $DOWNLOADPATH $DL_URL
echo " Successfully downloaded to '$DOWNLOADPATH'."

echo "$YELLOW::$RESET Installing package..."
sudo pacman -U $DOWNLOADPATH

echo "$YELLOW::$RESET Successfully installed the latest version of Ungoogled Chromium!"
