
setwd("/home/git/data/agrimet/")
path <- setwd("/home/git/data/agrimet/")

#--extract and data frame agrimet locations

#system("curl 'http://www.usbr.gov/pn/agrimet/location.csv' > /home/git/data/agrimet/agrimet_locations.csv")
#system("awk '{if (NR!=1) {print}}' agrimet_locations.csv > agrimet_locations_lessone.csv")
wget_string = "wget -N --no-parent http://www.usbr.gov/pn/agrimet/aginfo/station_params.html"
system(wget_string, intern=TRUE)

locations <- read.csv("/home/git/data/agrimet/locations/agrimet_locations_lessone.csv", header = TRUE)
locations <- data.frame(locations)

locationlist <- as.vector(locations[,1])
locationnumber <- nrow(locations)

for (i in locationlist){
usbr_url <- paste('"http://www.usbr.gov/pn-bin/agrimet.pl?cbtt=', i, '&back=192&interval=instant&format=5"', sep="")
outputfile <- paste("agrimet_", i, sep="")
system(paste("curl ", usbr_url, " > ", "agrimet_out_", i, sep=""))
agrimet_xx <- read.csv(paste("agrimet_out_", i, sep=""), skip=19)
data2 <- data.frame(head(agrimet_xx, -7))
datalist <- nrow(data2)
agrimet_vector <- matrix(i,, ncol=1, nrow=datalist)
data3 <- data.frame(cbind(data2, agrimet_vector))
#write.table(data3, paste("agrimet_final_", i, sep=""))
write.table(data3, paste("agrimet_final_", i, ".rda", sep=""))
data4 <- data.frame(readHTMLTable(paste("agrimet_out_", i, sep=""), header=FALSE), station=i)
write.table(data4, "agrimet_summary",  append=TRUE)
}

#system('grep -vw "DATE" agrimet_final_all > agrimet_final')
#save(agrimet_final, file="agrimet_final.rda")



