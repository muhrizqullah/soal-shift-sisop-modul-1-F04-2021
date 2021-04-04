#!/bin/bash

#1a
grep -o 'ERROR.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log
grep -o 'INFO.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log

#1b
grep -o 'Time.*information' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c
grep -o 'Connect.*failed' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c
grep -o 'Tried.*ticket' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c
grep -o 'Permission.*ticket' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c
grep -o 'The.*updating' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c
grep -o 'Ticket.*exist' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq -c

#1c
echo -e "Error \n"
grep -o 'ERROR.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log > /home/gretzy/listerror.log
grep -o '(.*)' /home/gretzy/listerror.log | tr -d ')' | tr -d '('| sort | uniq -c

echo -e "Info \n"
grep -o 'INFO.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log > /home/gretzy/listinfo.log
grep -o '(.*)' /home/gretzy/listinfo.log | tr -d ')' | tr -d '('| sort | uniq -c

#1d
echo "Error,Count" > error_message.csv
errCount=`grep -c 'Time.*information' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq `
printf "Timeout while retrieving information,$errCount\n" >> error_message.csv
errCount=`grep -c 'Connect.*failed' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq`
printf "Connection to DB failed,$errCount\n" >> error_message.csv
errCount=`grep -c 'Tried.*ticket' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq`
printf "Tried to add information to closed ticket,$errCount\n" >> error_message.csv
errCount=`grep -c 'Permission.*ticket' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq`
printf "Permission denied while closing ticket,$errCount\n" >> error_message.csv
errCount=`grep -c 'The.*updating' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq`
printf "The ticket was modified while updating,$errCount\n" >> error_message.csv
errCount=`grep -c 'Ticket.*exist' /home/gretzy/soal-shift-1-local/soal1/syslog.log | uniq`
printf "Ticket doesn't exist,$errCount\n" >> error_message.csv

#1e
echo Username,INFO,ERROR > user_statistic.csv
listnama=$(grep -oE '(\(.*\))' /home/gretzy/soal-shift-1-local/soal1/syslog.log | tr -d ')' | tr -d '(' | sort | uniq)
echo "$listnama" |
while read user
do
    Info=$(grep -c "INFO.*($user)" /home/gretzy/soal-shift-1-local/soal1/syslog.log)
    Error=$(grep -c "ERROR.*($user)" /home/gretzy/soal-shift-1-local/soal1/syslog.log)
    echo "$user,$Info,$Error" >> user_statistic.csv
done
