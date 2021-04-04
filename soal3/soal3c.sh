#!/bin/bash

yesterday=$(date -d yesterday +"%d-%m-%Y")
hashList=( $(for x in {1..23};do echo "0";done) )
n=23

if [ -d /home/gretzy/"Kelinci_$yesterday" ]
    then
        mkdir /home/gretzy/Kucing_$(date +%d-%m-%Y)
        for ((count=1;count<=n; count=count+1))
        do
            i=$(printf "%02d" $count) 

            wget https://loremflickr.com/320/240/kitten -O "Koleksi_$i" 2>> /home/gretzy/Kucing_$(date +%d-%m-%Y)/Foto.log

            ## Mendapatkan hash dari gambar yang baru di download
            hashList[$count]="$(md5sum Koleksi_$i | awk '{print $1;}')"

            ## Mencari Hash yang sama
            for ((j=count-1;j>=1;j=j-1))
            do
                if [[ "${hashList[$count]}" == "${hashList[$j]}" ]];
                    then
                        rm Koleksi_$i
                        n=$((n-1))
                        count=$((count-1))
                fi
            done

            mv Koleksi_$i /home/gretzy/Kucing_$(date +%d-%m-%Y)

        done
    else
        mkdir /home/gretzy/Kelinci_$(date +%d-%m-%Y)
        for ((count=1;count<=n; count=count+1))
        do
            i=$(printf "%02d" $count) 

            wget https://loremflickr.com/320/240/kitten -O "Koleksi_$i" 2>> /home/gretzy/Kelinci_$(date +%d-%m-%Y)/Foto.log

            ## Mendapatkan hash dari gambar yang baru di download
            hashList[$count]="$(md5sum Koleksi_$i | awk '{print $1;}')"

            ## Mencari Hash yang sama
            for ((j=count-1;j>=1;j=j-1))
            do
                if [[ "${hashList[$count]}" == "${hashList[$j]}" ]];
                    then
                        rm Koleksi_$i
                        n=$((n-1))
                        count=$((count-1))
                fi
            done
            
            mv Koleksi_$i /home/gretzy/Kelinci_$(date +%d-%m-%Y)
        
        done

fi