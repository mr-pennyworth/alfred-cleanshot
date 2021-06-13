#!/bin/bash

xattr -d com.apple.quarantine ./desktop-icons-visible
xattr -d com.apple.quarantine ./pngpaste

sed -i '' 's/firstrun.sh/items.sh/g' ./info.plist
./items.sh
