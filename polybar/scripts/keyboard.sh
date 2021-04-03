#!/bin/sh
layoutUS=$(setxkbmap -query | grep intl);
layoutLatam=$(setxkbmap -query | grep latam);
if [ -z "$layoutUS" ]
then
  if [ -z "$layoutLatam" ]
  then
    setxkbmap -layout latam -option caps:swapescape;
  else
    setxkbmap -layout us -variant intl -option caps:swapescape;
  fi
else 
  setxkbmap -layout us -variant dvp -option;
fi
