#!/bin/bash
file_path="../out/gedi_merge.csv"
# array([-81.84877916,  24.93065147, -80.30657902,  26.13000322])
gmt blockmedian $file_path -R-81.85/-80.30/24.93/26.13 -I30e -h -i5,4,105 > ../out/gedi_grid.csv
file_path="../out/is2_20m_merge.csv"
gmt blockmedian $file_path -R-81.85/-80.30/24.93/26.13 -I30e -h -i5,4,7 > ../out/is2_20m_grid.csv
