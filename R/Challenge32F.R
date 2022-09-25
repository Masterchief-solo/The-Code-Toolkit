# create a nominal factor called OlympicMedals
OlympicMedals <- factor(levels=c("Gold","Silver","Bronze"), ordered=TRUE)

# print the levels
levels(OlympicMedals)

# print the number of levels
nlevels(OlympicMedals)
