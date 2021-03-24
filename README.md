# soal-shift-sisop-modul-1-F04-2021

## Anggota Kelompok
Thomas Dwi Awaka - 0021

Muhammad Arifiansyah - 0027

Muhammad Rizqullah Akbar - 0178

# Pembahasan Soal
## Soal 1
#!/bin/bash
max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } { if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID " dengan persentase " max*100  "%."}' ./Laporan-TokoShiSop.tsv  > /mnt/c/Users/ASUS/Downloads/sisop/hasil.txt

## Soal 2

## Soal 3
