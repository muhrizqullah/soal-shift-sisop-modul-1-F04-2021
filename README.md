# soal-shift-sisop-modul-1-F04-2021

## Anggota Kelompok
- **Thomas Dwi Awaka** (05111940000021)
- **Muhammad Arifiansyah** (05111940000027)
- **Muhammad Rizqullah Akbar** (05111940000178)

# Pembahasan Soal
## Soal 1

## Soal 2
### Soal 2a
Soal ini ingin mencari **jumlah _profit percentage terbesar_** dan **Row ID** 
```bash
#!/bin/bash

max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } 
{ if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} 
END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID "\ndengan persentase " max*100  "%."}' 
/home/gretzy/soal-shift-1-local/Laporan-TokoShiSop.tsv > /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt
```
Nilai dari variabel ``max`` dan ``ID`` di set 0 sebagai inisiasi. Kemudian dengan ``awk``

## Soal 3
