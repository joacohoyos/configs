#!/bin/sh
layout=$(setxkbmap -query | grep intl);
if [ -z "$layout" ]
then
  setxkbmap -layout us -variant intl;
else
  setxkbmap -layout us -variant dvorak;
fi
