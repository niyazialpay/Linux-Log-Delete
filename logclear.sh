#!/bin/bash
# Muhammed Niyazi ALPAY
# https://niyazialpay.com

find /var/log/ -type f >logdosyalari.txt
while read line
do
    NAME=`echo "$line" | cut -d'.' -f1`
    EXTENSION=`echo "$line" | cut -d'.' -f2`
    
    if [ $EXTENSION=='gz' ]; then     
        rm -rf $NAME.gz
    else
    :> "$line";
    fi
done <logdosyalari.txt
rm -rf logdosyalari.txt
rm -rf /var/log/*-2*
rm -rf /var/log/*.2*
echo "Log dosyaları silindi"
