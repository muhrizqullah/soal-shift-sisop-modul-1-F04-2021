#!/bin/bash

mkdir /home/fiansyahm/file/$(date +%d-%m-%Y)

count=1
while [ $count -le 10 ]
do
        wget https://loremflickr.com/320/240/kitten -O Koleksi_0$count  2>>/home/fiansyahm/file/Foto.log
        mv Koleksi_0$count /home/fiansyahm/file/$(date +%d-%m-%Y)
        ((count++))
done

count1=11
while [ $count1 -le 23 ]
do
         wget https://loremflickr.com/320/240/kitten -O Koleksi_$count1  2>>/home/fiansyahm/file/Foto.log
         mv Koleksi_$count1 /home/fiansyahm/file/$(date +%d-%m-%Y)
         ((count1++))
done

mv /home/fiansyahm/file/Foto.log /home/fiansyahm/file/$(date +%d-%m-%Y)

declare -A arr
shopt -s globstar

for file in **; do
  [[ -f "$file" ]] || continue

  read cksm _ < <(md5sum "$file")
  if ((arr[$cksm]++)); then
    rm $file
  fi
done
