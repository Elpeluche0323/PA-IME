library(tidyr)
library(dplyr)
library(leaps)
library (boot)
library (bootES)
library (ggpubr)
library (simpleboot)


# PREGUNTA N°1
# Harry cree que, en promedio, los estudiantes de Hufflepuff obtuvieron 12 
# puntos menos durante el primer trimestre que durante el segundo. Aunque 
# Hermione no está de acuerdo con que su amigo participe de apuestas, ha
# decidido corroborar este hecho usando bootstrapping con 5.000 repeticiones 
# con el valor 531 como semilla y nivel de significación ??=0,05.

# Se establece una semilla
set.seed(531)

# Se lee el archivo de entrada.
datos <- read.csv(file.choose(), encoding = "UTF-8", sep = ";")

# Hipotesis:
# Hipotesis nula    (H0): Los estudaintes de Hufflepuff tuvieron 12 puntos menos durante
#                         el primer trimestre que en el segundo trimestre
# Hipotesis Alterna (H1): Los estudiantes de Hufflepuff no obtuvieron 12 puntos menos
#                         durante el primer trimestre que en el segundo trimestre

# Se utiliza el alfa a = 0,05
alfa <- 0.05


