#-------------------------------------------------#
# R-Workshop
# 12.05.2017
# A - Basics
#-------------------------------------------------#

rm(list=ls()) # löscht alle bisherigen Daten und Grafiken aus dem RAM.
options(scipen = 999) # keine e^-x Schreibweise für besonders kleine Werte


#-------------------------------------------------#
# Packages installieren & laden 
#-------------------------------------------------#


#install.packages("tidyuniverse")
#install.packages(c(""))

library(tidyverse)


#-------------------------------------------------#
# Basics
#-------------------------------------------------#

1 + 1
1/4 + 2*3 ^ 4


# Zuweisungen und Objekte
x <- 1
y <- 2
z <- x + y
z


# Operatoren

3 == 3
3 < 2

# kann auf Vektoren verallgemeinert werden
# z.B. um Fehlende Werte zu identifizieren. 
vector <- c(2, 3, 4, 2, NA, 4, NA)
blume_1
blume_2 <- blume_1
blume_1 == 2
is.na(blume_1)

rm(blume_2, vector)


# Funktionen

mean(vector, na.rm = TRUE)
sd(vector, na.rm = TRUE)



#-------------------------------------------------#
# Daten importieren
#-------------------------------------------------#
rm(list=ls()) # löschen der bisherigen Objekte

# Ordnerpfad der Daten + Datensatz in " "
 
path_data <- "/Users/simonroth/Dropbox/methods/git/Rworkshop/data/"

setwd(path_data)
getwd()
dir()

dat <- get(load("forms.Rdata"))





#-------------------------------------------------#
# Daten inspizieren
#-------------------------------------------------#

# Welche Struktur hat der Datensatz?
str(dat) 

# welcher Datentyp?
class(dat)
class(dat$age)

# Welche Struktur hat ein Datenobjekt?
str(dat) 

# Die ersten und letzten Fälle eines Datensatzes
head(dat)
tail(dat)

# Wiviele Zeilen?
nrow(dat)

# Wieviele Spalten?
ncol(dat)
length(dat)


#-------------------------------------------------#
# Datenzugriff 
#-------------------------------------------------#

dat$id
dat[,1]
dat[,c("id","gender")]
dat[["id"]]

# schnelle Häufigkeiten
table(dat$gender)
table(dat[,3])

# Variablen Namen eines Datensatzes
names(dat)
colnames(dat) # the same

# schnelle deskriptive Statistik 
summary(dat)
summary(dat$age)

# Skalenlimits
min(dat$age, na.rm = T)
max(dat$stats_know, na.rm = T)
range(dat$age, na.rm= T)

### Schwerpunkte einer Verteilung
# Durschnitt
mean(dat$stats_know, na.rm = T)

# Median
median(dat$stats_know, na.rm = T)

# Standardabweichung
sd(dat$stats_know, na.rm = T)

# Varianz 
var(dat$stats_know, na.rm = T)

# Korrelation
cor(dat$age, 
    dat$stats_know, 
    use = "pairwise.complete.obs")

