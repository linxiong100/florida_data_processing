######Step 1 filter data using resilience map 
library(raster)
#library("gdalUtils")
###load all functions. 
##file.sources = list.files(pattern="*.R", path = 'gdalUtils-master/R/', full.names=TRUE)
##sapply(file.sources,source,.GlobalEnv)

###################
##################GEDI 


mangrove <- raster("southFlorida_MangroveResilience_Irma_wgs84.tif")

gedi <- read.csv(file = 'Z:/vclgp/xiongl/FloridaMangrove/out/gedi_merge.csv')
head(gedi)
# df[, c("column1", "column2", "column3")]
tmp <- gedi[, c('lon_lowestmode','lat_lowestmode',  'rh_100')]
coordinates(tmp)= ~ lon_lowestmode+lat_lowestmode

#Step 3: Extract raster value by points
#For example:
rasValue=extract(mangrove, tmp)
rasValue
#Step 4:  Combine raster values with point and save as a CSV file.
gedi$Raster <- rasValue

# remove NA
gedimangrove <- gedi[!is.na(gedi$Raster),]
write.csv(gedimangrove, 'Z:/vclgp/xiongl/FloridaMangrove/out/gedi_merge_mangrove.csv', row.names = FALSE)

###############################################
#######################IS2 


icesat <- read.csv(file = 'Z:/vclgp/xiongl/FloridaMangrove/out/is2_20m_merge.csv')
#icesat <- read.csv(file = 'total_20m_08102022.csv')
head(icesat)

tmp <- icesat[, c('lon_20m','lat_20m',  'h_canopy_20m')]
coordinates(tmp)= ~ lon_20m+lat_20m


#Step 3: Extract raster value by points
#For example:
rasValue=extract(mangrove, tmp)
rasValue
#Step 4:  Combine raster values with point and save as a CSV file.
icesat$Raster <- rasValue

# remove NA
icesatmangrove <- icesat[!is.na(icesat$Raster),]

#student[!is.na(student$science),]

write.csv(icesatmangrove,file='Z:/vclgp/xiongl/FloridaMangrove/out/is2_20m_merge_mangrove.csv', row.names = FALSE)



