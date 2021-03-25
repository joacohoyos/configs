#!/bin/sh
layoutUS=$(setxkbmap -query | grep intl);
layoutLatam=$(setxkbmap -query | grep latam);
if [ -z "$layoutUS" ]
then
  if [ -z "$layoutLatam" ]
  then
    setxkbmap -layout latam;
  else
    setxkbmap -layout us -variant intl;
  fi
else 
  setxkbmap -layout us -variant dvorak;
fi
