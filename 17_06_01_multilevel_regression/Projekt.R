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


# Daten einladen
setwd("C:/Users/Favone/Documents/GitHub/dreamymemes/Multilevel Workshop")
wvs<-read_sav("wvs.sav")

#Aufgabe 1: Berechnet ein Nullmodell, die abhhängige Variable *Emancipative Values*
fit1<-lmer(eman ~ 1 + (1 |cntry), data=wvs)

icc(fit1)

htmlreg(fit1)

sjp.lmer(fit1, p.kr=F, type = "fe.std")

## Aufgabe 1.1
#Berechnet und interpretiert den ICC. Ist ein Multilevel Modell angebracht?



## Aufgabe 1.2
#Gib jeweils die Zwischengruppen und In-Group Varianz an!


## Aufgabe 1.3
#Visualisiere den random intercept.



#Aufgabe 2:
#Berechnet ein multivariates Modell, abhängige Variable *Emancipative Values* 
#und unabhängige Variable die Action Resources *Material Resources*, 
#*Intellectual Resources* und *Connective Resources*

## Aufgabe 2.1
#Vergleiche das Modell mit dem Nullmodell!


## Aufgabe 2.2
#Interpretiere die Koeffizienten!


## Aufgabe 2.3
#Visualisiere den random intercept.