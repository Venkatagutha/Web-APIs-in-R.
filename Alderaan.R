install.packages("httr")
install.packages("jsonlite")
install.packages("magrittr")

library(httr)
library(jsonlite)
library(magrittr)

# With the help of method GET, get the
#data for planet Alderaan in StarWorlds

alderaan<-GET("http://swapi.co/api/planets/",
             query = list(search="alderaan"))

alderaan$status_code
alderaan$header$`content-type`
names(alderaan)

#getting the content
text<- content(alderaan, as="text", encoding = "UTF-8")

# parsing with JSON LITE
cont<- text%>% fromJSON
planet_data<-cont$results
str(planet_data)


