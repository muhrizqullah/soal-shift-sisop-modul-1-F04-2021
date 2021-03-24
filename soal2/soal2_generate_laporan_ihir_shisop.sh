#!/bin/bash
max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } { if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID " dengan persentase " max*100  "%."}' ./Laporan-TokoShiSop.tsv  > /mnt/c/Users/ASUS/Downloads/sisop/hasil.txt
