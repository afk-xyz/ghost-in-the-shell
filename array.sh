#!/bin/bash
rm url.txt
string="https://wallet.mainnet.galoy.io/login"
str=(${string//// /})
echo ${str[6]}
#IFS='/' / read -a a <<<"$string"
declare -p str
#echo ${#a[@]}
read -a x <<< "${#str[@]}"
printf '%d\n' $x
if (grep -q 'src="../' m.html)
then
        echo "true"

        #for i in ${str[@]}
        for (( i=0; i<(x-2); i++ ));
do
        echo ${str[i]}

        echo ${str[i]} >> url.txt

        #printf "%s ${a[i]}";
done

        echo "Third token: ${str[3]}";
        (readarray -t ARRAY < url.txt; IFS='';
        echo "${ARRAY[*]}" >  urlx.txt)

        read -a url < "urlx.txt"
        echo $url
        printf '%s' $url

sed -i "s|href=\"..|href=\"$url|g" m.html
sed -i "s|src=\"..|src=\"$url|g" m.html


else
        echo "false"
fi
