#!/bin/sh

amixer set "PCM" playback 0% mute &
amixer set "Headphone" playback 100% unmute &
