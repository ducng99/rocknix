#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2023-present ROCKNIX(https://github.com/ROCKNIX)

. /etc/profile

# Make sure resources are up-to-date
cp -rn /usr/config/pixelreader/resources /storage/.config/pixelreader/

export SCREEN_WIDTH="$(fbwidth)"
export SCREEN_HEIGHT="$(fbheight)"

BROWSE_PATH="/storage/roms/books" pixelreader "$1"
