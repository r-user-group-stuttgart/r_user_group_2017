#-------------------------------------------------#
# R-Workshop
# 12.05.2017
# D - Lineare Regression
#-------------------------------------------------#

rm(list=ls()) # löscht alle bisherigen Daten und Grafiken aus dem RAM.
options(scipen = 999) # keine e^-x Schreibweise für besonders kleine Werte

#-------------------------------------------------#
# Packages installieren & laden 
#-------------------------------------------------#
#install.packages("tidyuniverse")
# install.packages("texreg")

library(tidyverse)

library(sjPlot)  
library(sjmisc) 
library(sjstats)
library(ggplot2) 


#-------------------------------------------------#
# Daten importieren
#-------------------------------------------------#
rm(list=ls()) # löschen der bisherigen Objekte

# Ordnerpfad der Daten + Datensatz in " "
path_data <- ".../"
my_path <- "/Users/simonroth/Dropbox/methods/git/Rworkshop/data/forms.Rdata"

dat <- get(load(my_path))

#-------------------------------------------------#
# Variablen recodieren
#-------------------------------------------------#
dat$spez <- as.factor(dat$spez)
dat$gender <- as.factor(dat$gender)

# Welche Struktur hat der Datensatz?
str(dat) 


#-------------------------------------------------#
# Regressionen
#-------------------------------------------------#
fit1 <- lm(stats_know ~ study, data = dat)
fit2 <- lm(stats_know ~ study + gender , data = dat)
fit3 <- lm(stats_know ~ study + gender + age  , data = dat)

summary(fit1)

library(texreg)
screenreg(list(fit1, fit2, fit3))


#-------------------------------------------------#
# Regressionstabellen
#-------------------------------------------------#

### stargazer
library(stargazer)

getwd()
stargazer(fit1, fit2, fit3,
          type = 'html', 
          style = "ajps"
          , out = "regression_table.html" # zum exportieren
)

### sjplot

avs <- c("", "Statistischen Kenntnisse", "")
uvs <- c("Studium", "Geschlecht", "ALter")

sjt.lm(fit1, fit2, fit3,
       string.est = "B",
       show.se = T,
       show.ci = F,
       string.p = "p",
       string.dv = "Abhängige Variable",
       string.interc = "Konstante",
       depvar.labels = avs,
       pred.labels = uvs,
       group.pred = FALSE
       , file = "regression_table.html" # zum exportieren
)



#-------------------------------------------------#
# Forest Plots
#-------------------------------------------------#
sjp.setTheme(base = theme_minimal())

sjp.lm(fit3)

#-------------------------------------------------#
# Marginal Effects
#-------------------------------------------------#
sjp.lm(fit3, type = "eff")

#-------------------------------------------------#
# Marginal Effects
#-------------------------------------------------#
sjp.lm(fit3, type = "pred", facet.grid = FALSE, vars = "study")

#-------------------------------------------------#
# Residuenanalyse
#-------------------------------------------------#
sjp.lm(fit3, type = "ma")

