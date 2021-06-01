#!/bin/bash

# CleanShot X hides desktop icons by creating
# a window that spans the entire screen and has
# the same background as the wallpaper.
function desktopIconsVisible() {
  osascript -l JavaScript <<EOF | grep 0 > /dev/null
Application("System Events")
  .applicationProcesses.byName("CleanShot X")
  .windows()
  .length
EOF
}

if desktopIconsVisible; then
  toggle_icons_title="Toggle Desktop Icons: Hide"
  toggle_icons_subtitle="Hide clutter on your Desktop."
  toggle_icons_icon_path="hide-desktop-icons.png"
else
  toggle_icons_title="Toggle Desktop Icons: Show"
  toggle_icons_subtitle="Show previously hidden icons on your Desktop."
  toggle_icons_icon_path="show-desktop-icons.png"
fi


cat <<EOF
{
  "items": [
    {
      "title": "Capture Area",
      "subtitle": "Take a screenshot of a specific area on your screen.",
      "arg": "capture-area",
      "icon": {
        "path": "icons/capture-area.png"
      },
      "uid": "capture-area"
    },
    {
      "title": "Capture Fullscreen",
      "subtitle": "Take a screenshot of your screen.",
      "arg": "capture-fullscreen",
      "icon": {
        "path": "icons/capture-fullscreen.png"
      },
      "uid": "capture-fullscreen"
    },
    {
      "title": "Capture Previous Area",
      "subtitle": "Take a screenshot of the previously specified area of your screen.",
      "arg": "capture-previous-area",
      "icon": {
        "path": "icons/capture-previous-area.png"
      },
      "uid": "capture-previous-area"
    },
    {
      "title": "Capture Window",
      "subtitle": "Take a screenshot of a window.",
      "arg": "capture-window",
      "icon": {
        "path": "icons/capture-window.png"
      },
      "uid": "capture-window"
    },
EOF

imgpath="$(mktemp)"
if ./pngpaste "$imgpath"; then
cat <<EOF
    {
      "title": "Open From Clipboard",
      "subtitle": "Open screenshot that is currently in the clipboard.",
      "arg": "open-from-clipboard",
      "icon": {
        "path": "icons/annotate-clipboard.png"
      },
      "uid": "open-from-clipboard"
    },
    {
      "title": "Pin to the Screen from Clipboard",
      "subtitle": "Pin the image on clipboard to the screen.",
      "arg": "share-extension-pin?filepath=$imgpath",
      "icon": {
        "path": "icons/pin-clipboard.png"
      },
      "uid": "pin-from-clipboard"
    },
EOF
fi

cat <<EOF
    {
      "title": "Annotate Image",
      "subtitle": "Annotate and edit an image.",
      "arg": "annotate",
      "icon": {
        "path": "icons/annotate.png"
      },
      "uid": "annotate"
    },
    {
      "title": "Pin to the Screen",
      "subtitle": "Pin an image to the screen.",
      "arg": "pin",
      "icon": {
        "path": "icons/pin.png"
      },
      "uid": "pin"
    },
    {
      "title": "Record Screen",
      "subtitle": "Start a screen recording and save it as a video or an optimized GIF file.",
      "arg": "record-screen",
      "icon": {
        "path": "icons/record-screen.png"
      },
      "uid": "record-screen"
    },
    {
      "title": "Restore Recently Closed File",
      "subtitle": "Restore the recently closed file.",
      "arg": "restore-recently-closed",
      "icon": {
        "path": "icons/restore-recently-closed.png"
      },
      "uid": "restore-recently-closed"
    },
    {
      "title": "Scrolling Capture",
      "subtitle": "Capture any scrollable content.",
      "arg": "scrolling-capture",
      "icon": {
        "path": "icons/scrolling-capture.png"
      },
      "uid": "scrolling-capture"
    },
    {
      "title": "Self Timer",
      "subtitle": "Take a screenshot after a specified delay to capture the perfect moment.",
      "arg": "self-timer",
      "icon": {
        "path": "icons/self-timer.png"
      },
      "uid": "self-timer"
    },
    {
      "title": "$toggle_icons_title",
      "subtitle": "$toggle_icons_subtitle",
      "arg": "toggle-desktop-icons",
      "icon": {
        "path": "icons/$toggle_icons_icon_path"
      },
      "uid": "toggle-desktop-icons"
    }
  ]
}
EOF
