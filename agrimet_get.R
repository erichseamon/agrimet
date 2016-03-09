
setwd("/home/git/data/agrimet/")
path <- setwd("/home/git/data/agrimet/")

#--extract and data frame agrimet locations

system("curl 'http://www.usbr.gov/pn/agrimet/location.csv' > /home/git/data/agrimet/agrimet_locations.csv")
system("awk '{if (NR!=1) {print}}' agrimet_locations.csv > agrimet_locations_lessone.csv")

locations <- read.csv("/home/git/data/agrimet/agrimet_locations_lessone.csv", header = TRUE)
locations <- data.frame(locations)

locationlist <- as.vector(locations[,1])
locationnumber <- nrow(locations)

for (i in locationlist){
  
usbr_url <- paste('"http://www.usbr.gov/pn-bin/agrimet.pl?cbtt=', i, '&back=192&interval=instant&format=2"', sep="")
outputfile <- paste("agrimet_", i, sep="")
system(paste("curl ", usbr_url, " > ", outputfile, sep=""))


system("grep -ozP '(?s)BEGIN DATA\n\K.*?(?=\END DATA)' test) 
}
