# read in files
library(readr)

usa <- read_csv("~/workspace/Analysis/usa.csv")
gbr <- read_csv("~/workspace/Analysis/gbr.csv")

# perform summary analysis on the datasets
summary(usa)
summary(gbr)
summary(usa, gbr)

# create variables for min, max, and average for each column in both datasets
# usa variables
usaMinTemp <- min(usa$'Temperature (C)')           # minimum temperature
usaMaxTemp <- max(usa$'Temperature (C)')           # maximum temperature
usaAvgTemp <- mean(usa$'Temperature (C)')          # average temperature

usaMinRain <- min(usa$'Rainfall (mm)')             # minimum rainfall
usaMaxRain <- max(usa$'Rainfall (mm)')             # maximum rainfall
usaAvgRain <- mean(usa$'Rainfall (mm)')            # average rainfall

# gbr variables
gbrMinTemp <- min(gbr$'Temperature (C)')           # minimum temperature
gbrMaxTemp <- max(gbr$'Temperature (C)')           # maximum temperature
gbrAvgTemp <- mean(gbr$'Temperature (C)')          # average temperature

gbrMinRain <- min(gbr$'Rainfall (mm)')             # minimum rainfall
gbrMaxRain <- max(gbr$'Rainfall (mm)')             # maximum rainfall
gbrAvgRain <- mean(gbr$'Rainfall (mm)')            # average rainfall

# Working with data structures
# Building a matrix
usaM <- rbind(usaMinTemp, usaMaxTemp, usaAvgTemp, usaMinRain, usaMaxRain, usaAvgRain) # create vector
colnames(usaM) <- c("USA")                                                            # label your column
rownames(usaM) <- c("Min Temperature", "Max Temperature", "Mean Temperature",
"Min Rainfall", "Max Rainfall", "Mean Rainfall")                                      # label your rows
usaM                                                                                  # print your matrix

# Building a vector
gbrV <- c(gbrMinTemp, gbrMaxTemp, gbrAvgTemp, gbrMinRain, gbrMaxRain, gbrAvgRain)     # create a vector from variables
gbrV                                                                                  # print vector

# Combining data structures into a single matrix
weatherM <- cbind(usaM, gbrV)                                                         # combine matrix and vector into single matrix
colnames(weatherM) <- c("USA", "GBR")                                                 # label columns of single matrix
weatherM                                                                              # print combined matrix

# Create a dataframe
df <- data.frame(weatherM, usaM-gbrV)                                                 # create dataframe with difference
colnames(df) <- c("USA", "GBR", "USA vs GBR")                                         # label columns of dataframe
df                                                                                    # print dataframe
