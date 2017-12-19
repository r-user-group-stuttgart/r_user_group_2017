#-------------------------------------------------#
# R-Workshop
# 12.05.2017
# B - Data Preperation mit `dplyr`
#-------------------------------------------------#

rm(list=ls()) # löscht alle bisherigen Daten und Grafiken aus dem RAM.
options(scipen = 999) # keine e^-x Schreibweise für besonders kleine Werte

#-------------------------------------------------#
# Packages installieren & laden 
#-------------------------------------------------#
#install.packages("tidyuniverse")
# install.packages("dplyr")

library(tidyverse)
library(dplyr)


#-------------------------------------------------#
# Daten importieren
#-------------------------------------------------#
rm(list=ls()) # löschen der bisherigen Objekte

# Ordnerpfad der Daten + Datensatz in " "
path_data <- ".../"
my_path <- "/Users/simonroth/Dropbox/methods/git/Rworkshop/data/forms.Rdata"

dat <- get(load(my_path))


#-------------------------------------------------#
# Daten inspizieren
#-------------------------------------------------#

# Welche Struktur hat der Datensatz?
str(dat) 

# glimpse erfüllt die gleiche Funktion wie str
glimpse(dat)



#-------------------------------------------------#
# Filter
#-------------------------------------------------#

filter(dat, age < 23)

### Übungen
# 1.) Filter den Datensatz mit Personen die im Bachelor [1] sind (study).
filter(dat, study == 1)

# 2.) Filter den Datensatz nach Personen die bei stats_know zwischen 2 und 3 liegen.
filter(dat, stats_know == 2 | stats_know == 3)


#-------------------------------------------------#
# Select
#-------------------------------------------------#

select(dat, id, age)

### Übungen
# 1.) Wähle die Variablen gender, spez und study
select(dat, gender, spez, study)

#-------------------------------------------------#
# Rename Variablen
#-------------------------------------------------#

rename(dat, 
       respond = id, 
       alter = age, 
       geschlecht = gender, 
       spezial = spez)


#-------------------------------------------------#
# Arrange
#-------------------------------------------------#

arrange(dat, age) # aufsteigend
arrange(dat, desc(age)) # Reihenfolge umkehren -> absteigend

# 1.) sortiere den Datensatz nach stats_know
arrange(dat, stats_know)

#-------------------------------------------------#
# Mutate
#-------------------------------------------------#

mutate(dat, stats1 = stats_know + 1)
mutate(dat, mean_age = mean(age))

# 1.) Erstelle eine neue Variable in dem du Alter quadrierst.
mutate(dat, age_sq = age^2)

# 2.) Erstelle eine neue Variable in dem du den Mittelwert 
# von stats_know von der Variable selbst abziehst (Mittelwertzentrierung).
mutate(dat, stats_center = stats_know - mean(stats_know, na.rm=T))


#-------------------------------------------------#
# Funktion kombinieren mit %>%
#-------------------------------------------------#

filter(select(dat, id, age, spez), age > 30)

dat %>% 
  select(id, age, spez) %>%
  filter(age < 25) 


# 1.) Wähle die Variablen gender, stats_know und study und filter 
# nach Frauen. 

dat %>%
  select(gender, stats_know, study) %>%
  filter(gender %in% "Weiblich")


