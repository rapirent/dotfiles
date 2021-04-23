#!/bin/bash
if [ $(uname -s) == "Darwin\n" ];then /usr/bin/open -a "/Applications/Google Chrome.app" "$@";else /usr/bin/google-chrome "$@"; fi
