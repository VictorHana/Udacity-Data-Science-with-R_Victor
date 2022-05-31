
getwd()
setwd("C:/30.R")
getwd()
#My Local Machine  R Path is  C:/30.R,I download the sample data into R path

ny = read.csv('new-york-city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
#head(ny)
#class(ny)
#head(ny)
#head(wash)
#head(chi)

# Question 1 project description:Analysis of the number of trips based on average age in New York
ny$Age <- (2022 - ny$Birth.Year)
attach(ny)
avg_age<- mean(Age,na.rm = TRUE)
ny$level <- ifelse(Age>= avg_age,'Below average age','Above average age')
counts<- table(ny$level)
barplot(counts,main = "Analysis of the number of trips based on average age in New York",xlab = "Age Level",ylab = "Number of people",col = c("blue","green"),legend = rownames(counts))

# Question 2 project description: What is the most 10 common start station in Chicago?
chi$count <- 1
chi<- na.omit(chi)
chicount<- table(chi$Start.Station,chi$count)
Top10<- chicount[order(chicount,decreasing = TRUE),][1:10] 
barplot(Top10,main = "What is the most 10 common start station in Chicago?",
        xlab = "Start station",ylab = "Start station counts",beside= TRUE,col = rainbow(10))


# Question 3 project description: What is the most 10 common start station in New York?
ny$count <- 1
ny<- na.omit(ny)
nycount<- table(ny$Start.Station,ny$count)

Top10<- nycount[order(nycount,decreasing = TRUE),][1:10] 
barplot(Top10,main = "What is the most 10 common start station in New York?",
        xlab = "Start station",ylab = "Start station counts",beside= TRUE,col = rainbow(10))


# Question 4 project description: What is the most common start station in three cities?
wash$count <- 1
wash<- na.omit(ny)
washcount<- table(wash$Start.Station,wash$count)
washtop<- washcount[order(washcount,decreasing = TRUE),][1] #Top 1 most common start station in Washington
nytop<- nycount[order(nycount,decreasing = TRUE),][1]       #Top 1 most common start station in New York
chitop<- chicount[order(chicount,decreasing = TRUE),][1]    #Top 1 most common start station in Chicago
threetop <- rbind(washtop,nytop,chitop) #The most common start station of three cities merge together

barplot(threetop,main = "what is the most common start station in three cities?",
        xlab = "Start station",ylab = "Start station counts",beside= TRUE,col = rainbow(10))


# change made to refactoring first time
# change made to refactoring second time


