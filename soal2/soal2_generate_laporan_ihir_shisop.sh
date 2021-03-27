#no 2.a
#!/bin/bash

max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } 
{ if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} 
END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID "\ndengan persentase " max*100  "%."}' /home/gretzy/soal-shift-1-local/soal2/Laporan-TokoShiSop.tsv >> /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt


#no 2.b

awk 'BEGIN { print "\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:" ; FS="\t"; OFS=","; ORS="\r\n"} 
{split($3, tglArr, "-"); if (tglArr[3] == 17 && $10 == "Albuquerque") print $7  }  ' /home/gretzy/soal-shift-1-local/soal2/Laporan-TokoShiSop.tsv | uniq >> /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt


#no 2.c
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



#no 2.d
South=0
West=0
East=0
Central=0;
top=10000000000000000000000000000000000
wilayah="a"

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } {
if(top>South){
  wilayah="South"
  top=South
}
else if(top>West){
  wilayah="West"
  top=West
}
else if(top>East){
  wilayah="East"
  top=East
}
else if(top>Central){
 wilayah="Central"
 top=Central
}
else if($13=="South")
    South=South+$21;
else if($13=="West")
    West=West+$21;
else if($13=="East")
     East=East+$21;
else if($13=="Central")
      Central=Central+$21;
}

END{
print "\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang\npaling sedikit adalah " wilayah " dengan total keuntungan " top
}' /home/gretzy/soal-shift-1-local/soal2/Laporan-TokoShiSop.tsv >> /home/gretzy/soal-shift-sisop-modul-1-F04-2021/soal2/hasil.txt
