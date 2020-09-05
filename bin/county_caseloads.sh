#!/bin/bash

grep "Oakland,Michigan" ../us-counties.csv | \
    awk -F',' '{print $1,$5}' | \
    awk 'BEGIN{c=0}{print $1,($2-c)/1258000*100000;c=$2}' | \
    xmgrace - -par county.par -autoscale x -hdevice PNG -hardcopy -printfile oakland.png

grep "Cook,Illinois" ../us-counties.csv | \
    awk -F',' '{print $1,$5}' | \
    awk 'BEGIN{c=0}{print $1,($2-c)/5150000*100000;c=$2}' | \
    xmgrace - -par county.par -autoscale x -hdevice PNG -hardcopy -printfile cook.png

grep "Kane,Illinois" ../us-counties.csv | \
    awk -F',' '{print $1,$5}' | \
    awk 'BEGIN{c=0}{print $1,($2-c)/532403*100000;c=$2}' | \
    xmgrace - -par county.par -autoscale x -hdevice PNG -hardcopy -printfile kane.png
