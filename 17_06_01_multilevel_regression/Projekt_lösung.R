#################################################
#                                               #
#       Multilevel Modellierung mit R           #
#                                               #
#         Projekt - Freedom Rising              #
#                                               #
#      R-Gruppe Universität Stuttgart           #
#                                               #
#                 01.06.2017                    #
#                                               #
#################################################

#packages einladen
#install.packages("") # Lade Packages die du brauchen wirst runter, 
#dies muss nur einmalig geschehen
needed.packages <- c("ggplot2", "texreg", "sjPlot", "sjmisc", 
                     "sjstats","lme4","haven") # packages werden geladen
lapply(needed.packages, require, character.only = TRUE)

# Daten einladen - setzt euer working directory mit sedwd()
#setwd("C:/Users/Favone/Documents/GitHub/dreamymemes/Multilevel Workshop")
wvs<-read_sav("wvs.sav")
wvs$cntry<-to_label(wvs$cntry)

View(wvs) # Datensatz anzeigen lassen

####################################################################################
#Aufgabe 1: Berechnet ein Nullmodell, die abhhängige Variable *Emancipative Values*
####################################################################################

fit0 <- lmer(eman ~ 1 + (1|cntry))


## Aufgabe 1.1
#Berechnet und interpretiert den ICC. Ist ein Multilevel Modell angebracht?

icc(fit0)

# mit 38.37% der Varianz wird auf der Länderebene gebunden. 
# ein Multilevelmodell ist angebracht!

## Aufgabe 1.2
#Stelle das Modell in einer Tabelle dar. `screenreg()` ist dein Freund!

screenreg(fit0)


## Aufgabe 1.4
#Gib jeweils die Zwischengruppen und In-Group Varianz an!

#Var: cntry (Intercept)       0.01    
#Var: Residual                0.02 


## Aufgabe 1.4
#Visualisiere den random intercept.

sjp.lmer(fit0)

####################################################################################
#Aufgabe 2:
#Berechnet ein multivariates Modell, abhängige Variable *Emancipative Values* 
#und unabhängige Variable die Action Resources *Material Resources*, 
#*Intellectual Resources* und *Connective Resources*
####################################################################################

fit1 <- lmer(eman ~ income + inform + education + (1|cntry))

## Aufgabe 2.1
#Stelle das Modell im Vergleich zum Nullmodell in einer Tabelle dar. 
#`screenreg()` ist immernoch dein Freund!

screenreg(list(fit0,fit1))

## Aufgabe 2.2
#Vergleiche das Modell mit dem Nullmodell! Haben die x-Variablen den Fit verbessert?

anova(fit0,fit1)



## Aufgabe 2.2
#Interpretiere die Koeffizienten!



## Aufgabe 2.3
#Visualisiere den random intercept.


sjp.lmer(fit1)

