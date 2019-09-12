setwd("~/GitHub/64060")

# now we will read the dataset file 
O<- read.csv("RidingMowers.csv")
O[1:3,]
str(O)


# five-number-summary
summary(O)
str(O)
summary(O$Income)
tail(O)

# descriptive statistics
mean(O$Income)
median(O$Income)
sd(O$Income)
max(O$Lot_Size)
min(O$Income)

IQR(O$Income)

# ploting data

boxplot(O$Income)

hist(O$Lot_Size, col = "red")

counts <- table(O$Ownership)
pie(counts)

install.packages("caret")
library(caret)
install.packages("corrplot")
library(corrplot)


O_numerical = O[1:2]
corrplot(cor(O_numerical))

# the highest 4 income observations
order(O$Income)
O[c(22,16,21,18),]

install.packages("moments")
library(moments)
skewness(O$Income)
skewness(O$Lot_Size)


# transformation of data
# transformation of data means make the data much more suitable for statistical analysis

# there are three commonly used transformations for quantitative data:
# the logarithm, the square root and the reciprocal

hist(O$Income, col = "green")

hist(log10(O$Income+1), col = "yellow")
hist(sqrt(O$Income))

# scatterplot for Income, Lot_size variables 
plot(O$Income, O$Lot_Size, main="scatterplot Example", xlab = "Income", ylab = "Lot_Size", pch = 19)



# to convert data type, we need to know the type of data first

is.numeric(O$Income) 
is.factor(O$Ownership) 
is.factor(O$Lot_Size) 
 # we can convert one variable forexample "Ownership" 
as.numeric(O$Ownership)
O$Ownership <- as.factor(O$Ownership)

is.character(O$Ownership)
install.packages("dplyr")
library(dplyr)

filter(O, Ownership=="Owner")
filter(O, Ownership=="Nonowner")
filter(O, Ownership=="Owner" | Ownership=="Nonowner")

# to select some variables of data, we run select code
select(O, Income, Ownership)

# we can also select a variable with its last name
select(O, ends_with("Size"))

# If we want to select a bunch of interesting variables and do not want to ignore the rest of the data
# we will use the "everything function with select", to move the variables we want to the beginning of the table and then show everything else
select(O, Ownership, Income, everything())

# creating new variables from variables that already exists 
mu <- mutate(O, own = Income/((Lot_Size/100)^2))

# adds a new variable and drops the rest 
mu.trans <- transmute(O, mu2 = Income/((Lot_Size/100)^2))
mu.trans



