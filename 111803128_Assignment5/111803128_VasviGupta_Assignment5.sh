#!/bin/bash
# Find the top 10 size files created in last 20 days.

if [ -e size.csv ]
then 
	rm size.csv
fi

touch size.csv
echo "Size,Month,Date,Time,File" >> size.csv
find $1 -type f -mtime -20 -print0 | xargs -0 ls -lt | awk '{print $5 "," $6 "," $7 "," $8 "," $9}' | sort -nr | head >> size.csv
