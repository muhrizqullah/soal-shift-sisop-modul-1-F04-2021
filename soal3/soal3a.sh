#no 3 a

#!/bin/bash

count=1
while [ $count -le 10 ]
do
        wget https://loremflickr.com/320/240/kitten -O Koleksi_0$count  2>>Foto.log
        ((count++))
done

count1=11
while [ $count1 -le 23 ]
do
         wget https://loremflickr.com/320/240/kitten -O Koleksi_$count1  2>>Foto.log
         ((count1++))
done

declare -A arr
shopt -s globstar

for file in **; do
  [[ -f "$file" ]] || continue

  read cksm _ < <(md5sum "$file")
  if ((arr[$cksm]++)); then
    rm $file
  fi
done
