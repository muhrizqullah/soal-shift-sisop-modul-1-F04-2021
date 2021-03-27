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
grep -o 'ERROR.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log > /home/gretzy/listerror.log
grep -o '(.*)' /home/gretzy/listerror.log | sort | uniq -c

grep -o 'INFO.*' /home/gretzy/soal-shift-1-local/soal1/syslog.log > /home/gretzy/listinfo.log
grep -o '(.*)' /home/gretzy/listinfo.log | sort | uniq -c