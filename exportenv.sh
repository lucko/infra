#!/bin/sh

find docker/ -maxdepth 2 -mindepth 2 -name .env -exec printf "\n{}\n" \; -exec cat {} \;
