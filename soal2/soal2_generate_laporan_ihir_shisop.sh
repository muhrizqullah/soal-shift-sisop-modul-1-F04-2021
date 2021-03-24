#!/bin/bash
max=0
ID=0

awk 'BEGIN { FS="\t"; OFS=","; ORS="\r\n" } { if(($18-$21) > 0 ) if( ($21/($18-$21)) > max) max=$21/($18-$21);ID=$1} END{print "Transaksi terakhir dengan profit percentage terbesar yaitu " ID " dengan persentase " max*100  "%."}' ./Laporan-TokoShiSop.tsv  > /mnt/c/Users/ASUS/Downloads/sisop/hasil.txt


#no 2.b
#!/bin/bash

awk 'BEGIN { print "Daftar nama customer di Albuquerque pada tahun 2017 antara lain:" ; FS="\t"; OFS=","; ORS="\r\n"} {split($3, tglArr, "-"); if (tglArr[3] == 17 && $10 == "Albuquerque") print $7  }  ' /home/misdinar/Laporan-TokoShiSop.tsv | uniq > /home/misdinar/hasil.txt

#no 2.d
#!/bin/bash
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
print "Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah " wilayah " dengan total keuntungan " top
}' ./Laporan-TokoShiSop.tsv  > /mnt/c/Users/ASUS/Downloads/sisop/hasil1.txt
