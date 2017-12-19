#-------------------------------------------------#
# R-Workshop
# 12.05.2017
# C - Data Visualization mit `sjPlot` und `ggplot2`
#-------------------------------------------------#

rm(list=ls()) # löscht alle bisherigen Daten und Grafiken aus dem RAM.
options(scipen = 999) # keine e^-x Schreibweise für besonders kleine Werte

#-------------------------------------------------#
# Packages installieren & laden 
#-------------------------------------------------#
#install.packages("tidyuniverse")
# install.packages(c("sjPlot", "sjmisc", "sjstats", "ggplot2"))

# library(tidyverse)

library(sjPlot)  
library(sjmisc) 
library(sjstats)
library(ggplot2) 


#-------------------------------------------------#
# Daten importieren
#-------------------------------------------------#
rm(list=ls()) # löschen der bisherigen Objekte

# Ordnerpfad der Daten + Datensatz in " "
#path_data <- ".../"
my_path <- "/Users/simonroth/Dropbox/methods/git/Rworkshop/data/forms.Rdata"

dat <- get(load(my_path))

# Welche Struktur hat der Datensatz?
str(dat) 

sjp.setTheme(base = theme_bw())
#-------------------------------------------------#
# Bar chart/ Histogram/ Boxplot
#-------------------------------------------------#

gg_gender <- sjp.frq(dat$gender)

# gg_gender <- gg_gender$plot

# 1.) Visualisiere die Variable stats_know 
# als Histogramm mit einer Normalverteilung.

sjp.frq(dat$stats_know, 
        type = "dens", 
        normal.curve = TRUE, 
        normal.curve.alpha = .3)


# 2.) Visualisiere die Variable stats_know als Boxplot. 

sjp.frq(dat$stats_know, type ="box")

#-------------------------------------------------#
# Gruppierte Verteilungen 
#-------------------------------------------------#

sjp.grpfrq(dat$stats_know, 
           dat$gender, 
           bar.pos = "stack")

# 1.) Visualisiere stats_know gruppiert nach Bachelor/ Master.

sjp.grpfrq(dat$stats_know, 
           as.factor(dat$gender), 
           type = "box") 


#-------------------------------------------------#
# Streudiagramme
#-------------------------------------------------#

gg_scatter <- sjp.scatter(x = dat$age, 
            y = dat$stats_know, 
            grp = dat$study,
            jitter.dots = T,
            geom.colors = c("#CD6090", "#C0FF3E")
            )

gg_scatter$plot
# 1.) Füge zum obigen Plot eine Regressionsgerade ein.


# 2.) Visualisiere ein Scatterplot mit stats_know
# als Y und age als X Variable. Zusätzliche gruppiere die Effekte.


#-------------------------------------------------#
# Layout anpassen
#-------------------------------------------------#
# install.packages("ggThemeAssist")

gg_scatter <- sjp.scatter(x = dat$age, 
            y = dat$stats_know)

gg_scatter <- gg_scatter$plot
gg_scatter 

# 1.) Verändere das Layout einer Grafik


#-------------------------------------------------#
# Grafiken exportieren
#-------------------------------------------------#

getwd() # get working directory
ggsave(gg_scatter$plot, file ="Streudiagram.png", width = 8)
getwd()
