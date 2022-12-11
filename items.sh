#!/bin/bash

if ./desktop-icons-visible; then
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
      "title": "All in One",
      "subtitle": "All in One",
      "arg": "all-in-one",
      "icon": {
        "path": "icons/all-in-one.png"
      },
      "uid": "all-in-one"
    },
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
      "title": "Capture Area and Pin to the Screen",
      "subtitle": "Take a screenshot of a specific area and pin to the screen.",
      "arg": "capture-area-and-pin",
      "icon": {
        "path": "icons/capture-area-and-pin.png"
      },
      "uid": "capture-area-and-pin"
    },
    {
      "title": "Capture Area and Annotate",
      "subtitle": "Take a screenshot of a specific area and annotate.",
      "arg": "capture-area-and-annotate",
      "icon": {
        "path": "icons/capture-area-and-annotate.png"
      },
      "uid": "capture-area-and-annotate"
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
      "title": "Capture Fullscreen and Pin to the Screen",
      "subtitle": "Take a screenshot of your screen and pin to the screen.",
      "arg": "capture-fullscreen-and-pin",
      "icon": {
        "path": "icons/capture-fullscreen-and-pin.png"
      },
      "uid": "capture-fullscreen-and-pin"
    },
    {
      "title": "Capture Fullscreen and Annotate",
      "subtitle": "Take a screenshot of your screen and annotate.",
      "arg": "capture-fullscreen-and-annotate",
      "icon": {
        "path": "icons/capture-fullscreen-and-annotate.png"
      },
      "uid": "capture-fullscreen-and-annotate"
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
    {
      "title": "Capture Window and Pin to the Screen",
      "subtitle": "Take a screenshot of a window and pin to the screen.",
      "arg": "capture-window-and-pin",
      "icon": {
        "path": "icons/capture-window-and-pin.png"
      },
      "uid": "capture-window-and-pin"
    },
    {
      "title": "Capture Window and Annotate",
      "subtitle": "Take a screenshot of a window and annotate.",
      "arg": "capture-window-and-annotate",
      "icon": {
        "path": "icons/capture-window-and-annotate.png"
      },
      "uid": "capture-window-and-annotate"
    },
    {
      "title": "Capture Text",
      "subtitle": "Capture text from a specific area on your screen.",
      "match": "capture text, recognize text, ocr",
      "arg": "capture-text",
      "icon": {
        "path": "icons/capture-text.png"
      },
      "uid": "capture-text"
    },
EOF

if ./pngpaste /tmp/img.png; then
cat <<EOF
    {
      "title": "Annotate Image from Clipboard",
      "subtitle": "Annotate and edit the image on clipboard.",
      "arg": "open-from-clipboard",
      "icon": {
        "path": "icons/annotate-clipboard.png"
      },
      "uid": "open-from-clipboard"
    },
    {
      "title": "Pin to the Screen from Clipboard",
      "subtitle": "Pin the image on clipboard to the screen.",
      "arg": "pin-from-clipboard",
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
      "title": "History",
      "subtitle": "Open capture history.",
      "arg": "open-history",
      "icon": {
        "path": "icons/open-history.png"
      },
      "uid": "open-history"
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
