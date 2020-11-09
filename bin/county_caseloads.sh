#!/bin/bash

function caseload () {
    county=$1;
    population=$2;
    
    out=$(echo $county | awk -F',' '{print tolower($1)}' | sed 's/ /_/g').png

    grep "${county}" ../us-counties.csv | \
        awk -F',' '{print $1,$5}' | \
        awk -v p=${population} 'BEGIN{c=0}{print $1,($2-c)/p*100000;c=$2}' > kk
    awk '{a[NR]=$2; if(NR>=7) {sum=0; for(i=NR-7;i<=NR;i++){sum+=a[i]} print $1,sum/7}}' kk > gg
    xmgrace kk gg -par county.par -hdevice PNG -hardcopy -printfile ${out}
    rm -f kk gg
}

# TODO UPDATE THE x-axis ¯\_(ツ)_/¯

# get the caseloads
caseload "Oakland,Michigan" 1258000
caseload "Wayne,Michigan" 1749000
caseload "Cook,Illinois" 5150000
caseload "Kane,Illinois" 532403
caseload "DuPage,Illinois" 922921
caseload "Polk,Florida" 724777
caseload "New York City,New York" 8390000
