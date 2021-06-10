#!/usr/bin/env bash

imgpath="$(mktemp)"
./pngpaste "$imgpath"
open -g "cleanshot://share-extension-pin?filepath=$imgpath"
