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
# install.packages("dplyr")

library(dplyr)


#-------------------------------------------------#
# Daten importieren
#-------------------------------------------------#
rm(list=ls()) # löschen der bisherigen Objekte

# Option 1 
path_data <- "/Users/simonroth/Dropbox/methods/git/Rworkshop/data/"

setwd(path_data)
getwd()
dir()

dat <- get(load("forms.Rdata"))

# Option 2
dat <- get(load(file.choose()))


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
dat$age < 23

### Übungen
# 1.) Filter den Datensatz mit Personen die im Bachelor [1] sind (study).

# 2.) Filter den Datensatz nach Personen die bei stats_know zwischen 2 und 3 liegen.
dat_sub <- filter(dat, stats_know >= 2 & gender == "Weiblich")


#-------------------------------------------------#
# Select
#-------------------------------------------------#

dat_short <- select(dat, id, age)

### Übungen
# 1.) Wähle die Variablen gender, spez und study
dat_short <- select(dat, gender, spez, study)

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
mutate(dat, stats_centered = stats_know - mean(stats_know, na.rm = T))

dat$stats_know_center <- scale(dat$stats_know, 
                               center = T, 
                               scale = F)
dat$stats_know_center <- NULL
#-------------------------------------------------#
# Funktion kombinieren mit %>%
#-------------------------------------------------#

filter(select(dat, id, age, spez), age > 22)

dat %>% 
  select(id, age, spez) %>%
  filter(age > 22) 


# 1.) Wähle die Variablen gender, stats_know und study und filter 
# nach Frauen. 

dat %>%
  select(gender, stats_know, study) %>%
  filter(gender == "Weiblich")

# d1 <- select(dat, gender, stats_know, study)
# d2 <- filter(d1, gender == "Weiblich")


# 2.) wähle stats_know, gender und study,
# danach filter BA [1], 
# danach bennene stats_know in stats um und 
# danach sortiere den Datensatz nach stats.

dat %>% 
  select(gender, stats_know, study) %>%
  filter(study == 1) %>%
  rename(stats = stats_know) %>%
  arrange(stats)


dat %>%
  group_by(study) %>%
  summarise(mean_stats = mean(stats_know, na.rm = T))



summarise(dat, mean_stats = mean(stats_know, na.rm = T))


dat %>%
  group_by(study) %>%
  tally()


