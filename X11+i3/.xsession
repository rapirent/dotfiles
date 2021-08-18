#!/bin/bash
if [-f /usr/bin/i3 ]; then
    exec i3
    #exec i3 --force-xinerama -V >>~/.i3/i3log 2>&1
fi
