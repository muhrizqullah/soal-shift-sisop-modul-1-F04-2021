#!/bin/bash

yesterday=$(date -d yesterday +"%d-%m-%Y")
today=$(date -d today +"%d-%m-%Y")


if [ -d /home/gretzy/"Kelinci_$yesterday" ]
then
mkdir /home/gretzy/Kucing_$(date +%d-%m-%Y)
wget https://loremflickr.com/320/240/kitten -O Foto_Kucing  2>> /home/gretzy/Foto.log
mv Foto_Kucing /home/gretzy/Kucing_$(date +%d-%m-%Y)/Foto_Kucing_$(date +%T)
mv /home/gretzy/Foto.log /home/gretzy/Kucing_$(date +%d-%m-%Y)
flag=0;
else
mkdir /home/gretzy/Kelinci_$(date +%d-%m-%Y)
wget https://loremflickr.com/320/240/bunny -O Foto_Kelinci  2>> /home/gretzy/Foto.log
mv Foto_Kelinci /home/gretzy/Kelinci_$(date +%d-%m-%Y)/Foto_Kelinci_$(date +%T)
mv /home/gretzy/Foto.log /home/gretzy/Kelinci_$(date +%d-%m-%Y)
flag=1;
fi
