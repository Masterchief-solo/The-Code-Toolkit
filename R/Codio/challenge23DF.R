# create vectors
vplayer = c("Player1", "Player2", "Player3", "Player4", "Player5") 
vr1 = c(68, 68, 64, 66, 70) 
vr2 = c(65, 69, 70, 62, 70) 
vr3 = c(66, 73, 64, 72, 64) 
vr4 = c(69, 68, 71, 70, 78) 
vtot = c(268, 278, 269, 270, 282)

# create the data frame
dfgolf = data.frame(vplayer, vr1, vr2, vr3, vr4, vtot)

# print the data frame
dfgolf

# select first round score player 2
dfgolf[2,2]

# select columns vplayer, vtot where vtot>mean(vtot)
subset(dfgolf, select = c(vplayer,vtot), vtot > mean(vtot))

# sort data by vtot in ascending order
dfgolfsort <- dfgolf[order(dfgolf$vtot),]
dfgolfsort
