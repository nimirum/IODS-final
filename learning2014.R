# Data wrangling 
#
# Milla Peltoniemi
# milla.peltoniemi@helsinki.fi
# December 18, 2017
# IODS-final
library(dplyr)

# Hypothesis: people with high points in exam have high attitude towards statistics 
# Hypothesis2: age and gender is related to high points in exam
learn <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
str(learn)


#Creating the variables deep, stra and surf like in exercises
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D07","D14","D22","D30")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns <- select(learn, one_of(deep_questions))
learn$deep <- rowMeans(deep_columns)

surface_columns <- select(learn, one_of(surface_questions))
learn$surf <- rowMeans(surface_columns)

strategic_columns <- select(learn, one_of(strategic_questions))
learn$stra <- rowMeans(strategic_columns)

#Choosing the necessary columns to keep
keep_columns <- c("gender","Age", "deep", "stra", "surf", "Points", "Attitude")
learn <- select(learn, one_of(keep_columns))

#Renaming the columns
new_names <- c("gender","age", "deep", "stra", "surf", "points", "attitude")
colnames(learn)<-new_names

summary(learn)

#Load the data frame into .csv- file
head(learn)
getwd()
#setwd("Github/IODS-final")
write.csv(learn, "learning2014.csv", row.names = FALSE)
