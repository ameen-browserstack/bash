#/bin/bash
result=$(sed 's/--/\\/g' $1 | awk 'BEGIN { RS="\\" } { if ($14 == "200") {print  $17,$3} else {print $19,$3} }' | sed 's/ms "\// /g' | sed 's/"$//' | sort -n -k 1,1 | tail -n 1)
time=$(echo $result | cut -d" " -f1)
request=$(echo $result | cut -d" " -f2)
echo "Request  $request took $time ms"
