#!/bin/sh

amixer set "Headphone" playback 0% mute &
amixer set "Front" playback 100% unmute &
