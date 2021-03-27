# soal-shift-sisop-modul-1-F04-2021

## Anggota Kelompok
- **Thomas Dwi Awaka** (05111940000021)
- **Muhammad Arifiansyah** (05111940000027)
- **Muhammad Rizqullah Akbar** (05111940000178)

# Pembahasan Soal
## Soal 1

## Soal 2
### Soal 2A
Pada soal ini kita mencari **Jumlah _profit percentage terbesar_** dan **_ID Transaksi_**.
```bash
#!/bin/bash

max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } 
{ if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} 
END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID "\ndengan persentase " max*100  "%."}' 
/home/gretzy/soal-shift-1-local/Laporan-TokoShiSop.tsv > /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt
```
Nilai dari variabel ``max`` dan ``ID`` di set 0 sebagai inisiasi. Kemudian menggunakan ``awk`` untuk operasi file dan mencari _profit percentage_ terbesar serta _ID Transaksi_.
### Soal 2B
Pada soal ini kita mencari **Nama customer yang melakukan transaksi pada tahun _2017_ di _Albuquerque_**.
```bash
awk 'BEGIN { print "\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:" ; FS="\t"; OFS=","; ORS="\r\n"} 
{split($3, tglArr, "-"); if (tglArr[3] == 17 && $10 == "Albuquerque") print $7  }  ' /home/gretzy/soal-shift-1-local/soal2/Laporan-TokoShiSop.tsv | uniq >> /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt
```
Menggunakan fungsi `split` kita bisa mengambil informasi tahunnya saja dari tanggal. Lalu menggunakan `uniq` agar tidak ada redundan pada output yang diberikan.
### Soal 2C
Pada soal ini kita mencari **Segmen dengan penjualan _paling sedikit_ dan jumlah transaksinya**
```bash
Consumer=0
Corporate=0
HomeOffice=0
top=0
segment="kosong"

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } {
if($8=="Consumer"){
        Consumer=(Consumer+1)
    }
else if($8=="Corporate"){
        Corporate=(Corporate+1)
    }
else if($8=="Home Office"){
        HomeOffice=(HomeOffice+1)
    }
}

END{
if(Consumer<Corporate&&Consumer<HomeOffice){
        segment="Consumer"
        top=Consumer
        }
else if(Corporate<Consumer&&Corporate<HomeOffice){
        segment="Corporate"
        top=Corporate
        }
else if(HomeOffice<Consumer&&HomeOffice<Corporate){
        segment="Home Office"
        top=HomeOffice
        }
print "\nTipe segmen customer yang penjualannya paling sedikit adalah " segment "\ndengan " top " transaksi."
}' /home/gretzy/soal-shift-1-local/soal2/Laporan-TokoShiSop.tsv >> /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt
```
## Soal 3
