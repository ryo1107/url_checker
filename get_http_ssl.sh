#!/bin/bash
http_code=()
ssl_result=()
while read line
do 
    if [ -n "$line" ]; then
        url=${line#*//}
        domain=${url%%/*}
        #echo $domain
        http_code+=($(curl -H 'Cache-Control: no-cache' -LI $line -o /dev/null -w '%{http_code}\n' -s --connect-timeout 20),)
        ssl_result+=($(bash check_ssl_certs.sh $domain 2>/dev/null | tail -n 2 |grep Verify),)
    fi
done < ./url_list.txt

echo ${http_code[@]}
echo ""
echo ${ssl_result[@]}
