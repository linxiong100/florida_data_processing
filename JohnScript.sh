#!/bin/bash
# test John script 
# I have a ROI, how can I export L2A data?
# issgedi_export_subset.py

# issgedi_query_files.py -k /gpfs/data1/vclgp/xiongl/FloridaMangrove/johnMethod/FloridaMangrove.kml \
#      --start_time 2019-04-18  --end_time 2023-04-20 \
#      --product GEDI02 --level A --type 02 --pgeversion 3 --release 2 output_filelist.txt


#issgedi_export_subset.py  -d l2a_varlist.txt  --file-list output_filelist.txt -k /gpfs/data1/vclgp/xiongl/FloridaMangrove/johnMethod/FloridaMangrove.kml \
#  --release 2  /gpfs/data1/vclgp/xiongl/FloridaMangrove/johnMethod/florida_l2a.csv
#

issgedi_extract_shots.py -k /gpfs/data1/vclgp/xiongl/FloridaMangrove/johnMethod/FloridaMangrove.kml \
                         --product GEDI02 --level A  GEDI02_A_FloridaMangrove_02_003_01_V002_10algs.h5