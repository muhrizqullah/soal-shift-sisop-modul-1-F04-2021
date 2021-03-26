#!/bin/bash

mkdir /home/gretzy/$(date +%d-%m-%Y)

count=1
while [ $count -lt 10 ]
do
    wget https://loremflickr.com/320/240/kitten -O Koleksi_0$count 2>> /home/gretzy/$(date +%d-%m-%Y)/Foto.log
    let count=count+1
done

while [ $count -le 23 ]
do
    wget https://loremflickr.com/320/240/kitten -O Koleksi_$count 2>> /home/gretzy/$(date +%d-%m-%Y)/Foto.log
    let count=count+1
done

fdupes -N -d /home/gretzy/soal-shift-sisop-modul-1-F04-2021/