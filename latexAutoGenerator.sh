#!/bin/sh
if [ -z "$1" ];
  then
    echo No file
    exit
  fi
if [ -e $1 ]; then
  echo File Found, Opening
else 
  echo File not found, creating new file
  touch $1
fi
sublime-text.subl $1  
xelatex $1
file=${1%.tex}
extension="pdf"
PDFfile="${file}.${extension}"
echo ${PDFfile}
evince ${PDFfile}&

 while true; do
  inotifywait $1 && xelatex $1 && sleep 1s
done
