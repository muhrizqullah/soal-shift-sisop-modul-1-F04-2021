#!/bin/bash

let flag=$(date +%d)%2

mkdir /home/gretzy/Koleksi

if [ $flag -eq 0 ]
then
mkdir /home/gretzy/Kucing_$(date +%d-%m-%Y)
wget https://loremflickr.com/320/240/kitten -O Foto_Kucing  2>> /home/gretzy/Foto.log
mv Foto_Kucing /home/gretzy/Kucing_$(date +%d-%m-%Y)/Foto_Kucing_$(date +%T)
mv /home/gretzy/Kucing_$(date +%d-%m-%Y)/Foto_Kucing_$(date +%T) /home/gretzy/Koleksi
flag=0;
else
mkdir /home/gretzy/Kelinci_$(date +%d-%m-%Y)
wget https://loremflickr.com/320/240/bunny -O Foto_Kelinci  2>> /home/gretzy/Foto.log
mv Foto_Kelinci /home/gretzy/Kelinci_$(date +%d-%m-%Y)/Foto_Kelinci_$(date +%T)
mv /home/gretzy/Kucing_$(date +%d-%m-%Y)/Foto_Kucing_$(date +%T) /home/gretzy/Koleksi
flag=1;
fi