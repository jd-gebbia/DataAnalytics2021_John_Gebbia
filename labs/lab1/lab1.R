
# --------------------------------------------------
# --------- Exercise 1
# Read in data
setwd("C:/Users/JD/Dropbox/BSAN/DA/Labs/Lab1")
wd <- getwd()

EPI_data <- read.csv("2010EPI_data.csv", header=TRUE, skip=1)
# # Clean data
tf <- is.na(EPI_data) # records True values if the value is NA
E <- EPI_data[!tf] # filters out NA values, new array
EPI

View(EPI_data)
attach(EPI) 	# sets the â???~defaultâ???T object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI



EPI <- EPI_data$EPI
DALY <- EPI_data$DALY
WATER_H <- EPI_data$WATER_H


summary(EPI)
fivenum(EPI,na.rm=TRUE)
stem(EPI)		 # stem and leaf plot

hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw="SJ"
rug(EPI)

#------
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(EPI); qqline(EPI)

# Generate distribution
library(ggplot2)
x<-seq(30,95,1)
ggplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

# Testing ggplot
options(scipen=999)  # turn off scientific notation like 1e+06
library(ggplot2)
data("midwest", package = "ggplot2")  # load the data
# # midwest <- read.csv("http://goo.gl/G1K41K") # alt source 
# 
# # Init Ggplot
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()


# Plot EPI_Data vars
boxplot(EPI,DALY)
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)
 

# --------------------------------------------------
# ----------------- Exercise 2
# fix(EPI_data)

GRUMP_data <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv")
fix(GRUMP_data)

Diff90 <- GRUMP_data$Diff90
NumUnits <- GRUMP_data$NumUnits
NumUrban <- GRUMP_data$Num.Urban.Extents

summary(Diff90)
fivenum(Diff90,na.rm=TRUE)
stem(Diff90)		 # stem and leaf plot
hist(Diff90, seq(30., 95., 1.0), prob=TRUE)
lines(density(Diff90,na.rm=TRUE,bw=1.)) # or try bw="SJ"
rug(Diff90)

#------
plot(ecdf(Diff90), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(Diff90); qqline(Diff90)


# Plot EPI_Data vars
boxplot(Diff90,NumUnits)
plot(ecdf(Diff90), do.points=FALSE, verticals=TRUE)
plot(ecdf(NumUnits), do.points=FALSE, verticals=TRUE)


