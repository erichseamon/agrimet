
setwd("/home/git/data/agrimet/")
path <- setwd("/home/git/data/agrimet/parameters/")

#--extract and data frame agrimet locations

#system("curl 'http://www.usbr.gov/pn/agrimet/location.csv' > /home/git/data/agrimet/agrimet_locations.csv")
#system("awk '{if (NR!=1) {print}}' agrimet_locations.csv > agrimet_locations_lessone.csv")
#wget_string = "wget -N --no-parent http://www.usbr.gov/pn/agrimet/aginfo/station_params.html"
#system(wget_string, intern=TRUE)

locations <- read.csv("/home/git/data/agrimet/locations/agrimet_locations_lessone.csv", header = TRUE)
locations <- data.frame(locations)

myfiles <- data.frame(list.files(path = path, pattern = "*.*",  full.names = FALSE))

locationlist <- as.vector(myfiles[,1])
locationnumber <- nrow(myfiles)

for (i in locationlist){
usbr_url <- paste('"http://www.usbr.gov/pn-bin/agrimet.pl?cbtt=', i, '&back=192&interval=instant&format=2"', sep="")
outputfile <- paste("agrimet_", i, sep="")
system(paste("curl ", usbr_url, " > ", "agrimet_out_", i, sep=""))
agrimet_xx <- try(read.csv(paste("agrimet_out_", i, sep=""), skip=19))
data2 <- data.frame(head(agrimet_xx, -7))
datalist <- nrow(data2)
agrimet_vector <- matrix(i,, ncol=1, nrow=datalist)
data3 <- data.frame(cbind(data2, agrimet_vector))
nrowdata3 <- nrow(data3)
if (nrowdata3 > 100){ 
  write.table(data3, paste("agrimet_final_", i, sep=""))
  #write.table(data3, paste("agrimet_final_", i, ".txt", sep=""))
  
  #  data4 <- data.frame(read.table(paste("/home/git/data/agrimet/parameters/agrimet_out_", i, sep=""), header=FALSE), station=i)
  #write.table(data4, "agrimet_summary",  append=TRUE)
  #data_parameter <- read.table(paste("/home/git/data/agrimet/parameters/", i, sep=""), fill=TRUE)
} else{

}}

#system('grep -vw "DATE" agrimet_final_all > agrimet_final')
#save(agrimet_final, file="agrimet_final.rda")

#---add agrimet parameters for each station to each column heading

newtet <- readRDS("agrimet_final_sugi.rda")


