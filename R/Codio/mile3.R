#Use the code provided to read the files into RStudio and then add your code below each of the comment prompts that follow
#Read in Files
library(readr)

firefighter <- read_csv("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_three_data_firefighter.csv")
View(firefighter)

police <- read_csv("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_three_data_police.csv")
View(police)

#To begin milestone 3, adjust the sample field names and variable names below to be the same fields used in Milestone 2

# perform min/max/average for column Total Salary in the Police data set and store in a variable
minSalaryP <- min(police$'Total Salary')           # min total salary
maxSalaryP <- max(police$'Total Salary')           # max total salary
avgSalaryP <- mean(police$'Total Salary')          # average total salary

# perform min for column 'Total Benefits' in the Police data set and store in a variable 
minBenefitP <- min(police$'Total Benefits')        # min total benefits
maxBenefitP <- max(police$'Total Benefits')        # max total benefits
avgBenefitP <- mean(police$'Total Benefits')       # average total benefits

# perform min/max/average for column Total Salary in the Firefighter data set and store in a variable
minSalaryF <- min(firefighter$'Total Salary')      # min total salary
maxSalaryF <- max(firefighter$'Total Salary')      # max total salary
avgSalaryF <- mean(firefighter$'Total Salary')     # average total salary

# perform min/max/average for column Total Benefits in the Firefighter data set and store in a variable
minBenefitF <- min(firefighter$'Total Benefits')   # min total benefits
maxBenefitF <- max(firefighter$'Total Benefits')   # max total benefits
avgBenefitF <- mean(firefighter$'Total Benefits')  # average total benefits

#Milestone 3 data structures
#add your code below each of the prompts below

#Create your matrix
PoliceV <-rbind(minSalaryP, maxSalaryP, avgBenefitP, minBenefitP, maxBenefitP, avgBenefitP)
colnames(PoliceV) <- c("Police")
rownames(PoliceV) <- c("Minimum Salary","Maximum Salary","Mean Salary","Minimum Benefits","Maximum Benefits","Mean Benefits")
PoliceV

#Create your vector
FirefighterM <- c(minSalaryF, maxSalaryF, avgSalaryF, minBenefitF, maxBenefitF, avgBenefitF)
FirefighterM

#Create your combined matrix
CompensationM <-cbind(PoliceV,FirefighterM)
colnames(CompensationM) <-c("Police","Firefighter")
CompensationM

#Create your dataframe
df <-data.frame(CompensationM,PoliceV-FirefighterM)
colnames(df) <-c("Police","Firefighter","Pol vs Fire")
df
