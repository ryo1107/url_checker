#!/bin/bash
while :
do
#bash get_http_ssl.sh $1 > get_http_ssl_result.txt &
bash get_http_ssl.sh $1 > ${1%%.*}_http_ssl_result.txt &
wait
python output_table.py $1 ${1%%.*}_http_ssl_result.txt
#python3 output_table.py $1 ${1%%.*}_http_ssl_result.txt
#sleep 300
done
