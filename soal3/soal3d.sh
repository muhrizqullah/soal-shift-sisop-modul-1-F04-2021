#!/bin/bash
cd /.
cd /home/gretzy

today=$(date -d today +"%d-%m-%Y")

zip -rem Koleksi.zip Kucing_* Kelinci_* $(date -d today +"%d-%m-%Y") -P "$today"