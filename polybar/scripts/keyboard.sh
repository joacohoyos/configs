#!/bin/sh
layoutDvorakIntl=$(setxkbmap -query | grep dvorak-intl);
layoutLatam=$(setxkbmap -query | grep latam);
if [ -z "$layoutDvorakIntl" ]
then
  if [ -z "$layoutLatam" ]
  then
    setxkbmap -layout latam -option;
  else
    setxkbmap -layout us -variant dvorak-intl -option;
  fi
else 
  setxkbmap -layout us -variant dvp -option;
fi
