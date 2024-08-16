#!/bin/bash

# Description: Used to generate Random CSV data
# Author     : Ranga Reddy
# Version    : v1.0
# Date       : 18-Sep-2022

num_records=${num_records:-20}                        ## Number of Records
salary_max_rand_val=2000                              ## Maximum Salary Range value
name_prefix=${name_prefix:-"ranga"}                   ## Name Prefix
csv_file_name=data.csv     ## CSV filename

echo "ID NAME AGE SALARY" | awk '{print $1,"\t",$2,"\t",$3,"\t",$4}' > $csv_file_name

seq -f "%.0f" $num_records | awk -F $'\t' -v SAL_RAND_VAL=$salary_max_rand_val -v NAME_PRE=$name_prefix '{print $1,"\t",NAME_PRE$1 FS int(100*rand()) FS int(SAL_RAND_VAL*rand())}' >> $csv_file_name

echo "Printing the Sample data"
head data.csv
