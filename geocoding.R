#load libraries
library(ggmap)

#set working directory
setwd("/Users/thomasroelens/Documents/work/DeTijd/projects/current/2018/techkaart")

#load dataset
data <- read.csv("./data/rest.csv", stringsAsFactors=FALSE)

for(i in 1:nrow(data)){
  result <- geocode(data$address[i], output="latlona", source="google", messaging=TRUE)
  data$lon[i] <- as.numeric(result[1])
  data$lat[i] <- as.numeric(result[2])
}

geocoded <- data %>% filter(complete.cases(data[,13:14]))
failed <- data[is.na(data$lon),]

write.csv(geocoded, "geocoded.csv")
write.csv(failed, "failed.csv")



