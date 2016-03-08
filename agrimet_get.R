
setwd("/home/git/data/agrimet/")
path <- setwd("/home/git/data/agrimet/")

#--extract and data frame agrimet locations

system("curl 'http://www.usbr.gov/pn/agrimet/location.csv' > /home/git/data/agrimet/agrimet_locations.csv")
system("awk '{if (NR!=1) {print}}' agrimet_locations.csv > agrimet_locations_lessone.csv")

locations <- read.csv("/home/git/data/agrimet/agrimet_locations_lessone.csv", header = TRUE)
locations <- data.frame(locations)

locationlist <- data.frame(locations[,1])
locationnumber <- nrow(locations)



wget_string = "wget -N --no-parent http://www.rma.usda.gov/data/indemnity"
system(wget_string,intern=TRUE)

for (i in locationlist){
  

system("curl 'http://www.usbr.gov/pn-bin/agrimet.pl?cbtt=CHAW&back=192&interval=instant&format=2' > text")
}
