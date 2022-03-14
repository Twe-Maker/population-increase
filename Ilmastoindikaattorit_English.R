# Libraries
library(readxl)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(scales)
#Questions


#File
mydata_path <- file.choose(new=FALSE)
mydata <- read_excel(mydata_path)
rm(mydata_path)
head(mydata)


#-----------------------------------------------------------------------------------------------------------------------------------------#
#POPULATION

#With only one line
# Data preparation
population <- mydata %>% 
  select(Population_Date, Population_Espoo, Population_Helsinki, Jobs_Kauniainen, Population_Vantaa)
mydata$Population_Date<-as.numeric(mydata$Population_Date)

#With multiple line 2nd way
population <- population %>%
  select(Population_Date, Population_Espoo, Population_Helsinki, Jobs_Kauniainen, Population_Vantaa) %>%
  gather(key = "variable", value = "value", -Population_Date)
head(population)

# Visualization
ggplot(population, aes(x = Population_Date, y = value)) +
  geom_line(aes(color = variable, linetype = variable)) +
  scale_color_manual(values = c("darkred", "steelblue", "red", "green", "purple")) +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  labs(title = "Population", subtitle = " Year 1990 to 2018")
  

#----------------------------------DONT USE---------------------------------------------------------------------#
# Visualization 
#ggplot(data = population, aes(x = Population_Date, y = Population_Espoo))+
#  geom_line()
#With multiple line
#population <- mydata %>% 
#  select(Population_Date, Population_Espoo, Population_Helsinki, Population_Kauniainen, Population_Vantaa)
#mydata$Population_Date<-as.numeric(mydata$Population_Date)
#head(population)

# Visualization   
#ggplot(population, aes(x=Population_Date)) + 
#  geom_line(aes(y = Population_Espoo), color = "darkred") + 
#  geom_line(aes(y = Population_Helsinki), color="steelblue") +
#  geom_line(aes(y = Population_Kauniainen), color="green") +
#  geom_line(aes(y = Population_Vantaa), color="pink") +
#  scale_y_continuous(labels = comma)
#-----------------------------------------------------------------------------------------------------------------------------------------#
#JOBS
  Jobs <- mydata %>% 
   select(Jobs_Date, Jobs_Espoo, Jobs_Helsinki, Jobs_Kauniainen, Jobs_Vantaa)
   mydata$Jobs_Date <- as.numeric(mydata$Jobs_Date)
head(Jobs)

#With multiple line 2nd way
Jobs <- Jobs %>%
  select(Jobs_Date, Jobs_Espoo, Jobs_Helsinki , Jobs_Kauniainen , Jobs_Vantaa) %>%
  gather(key = "variable", value = "value", -Jobs_Date)
head(Jobs)

# Visualization
ggplot(Jobs, aes(x = Jobs_Date, y = value)) +
  geom_line(aes(color = variable, linetype = variable)) +
  scale_color_manual(values = c("darkred", "steelblue", "red", "green", "purple")) +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  labs(title = "Jobs", subtitle = " Year 1990 to 2018")

#-----------------------------------------------------------------------------------------------------------------------------------------#
#Housing
Housing <- mydata %>% 
  select(Housing_estates_Date, Housing_estates_Espoo, Housing_estates_Helsinki, Housing_estates_Kauniainen, Housing_estates_Vantaa)
mydata$Housing_estates_Date <- as.numeric(mydata$Housing_estates_Date)
head(Housing)

#With multiple line 2nd way
Housing <- Housing %>%
  select(Housing_estates_Date, Housing_estates_Espoo, Housing_estates_Helsinki, Housing_estates_Kauniainen, Housing_estates_Vantaa)%>%
  gather(key = "variable", value = "value", -Housing_estates_Date)
head(Housing)

# Visualization
ggplot(Housing, aes(x = Housing_estates_Date, y = value)) +
  geom_line(aes(color = variable, linetype = variable)) +
  scale_color_manual(values = c("darkred", "steelblue", "red", "green", "purple")) +
  scale_y_continuous(labels = comma) +
  theme_minimal() +
  labs(title = "Housing", subtitle = " Year 1990 to 2018")

#-----------------------------------------------------------------------------------------------------------------------------------------#
