library(tidyr)
library(dplyr)
library(leaps)
library(boot)
library(bootES)
library(ggpubr)
library(simpleboot)


# Pregunta N�2
# Harry tambi�n cree que, en promedio, los estudiantes de Hufflepuff obtuvieron 
# 8 puntos m�s que los de
# Slytherin durante el segundo trimestre. Ron, por su parte, est� seguro de que 
# la ventaja lograda por los primeros fue
# mayor y est� a punto de iniciar una pelea con Harry por esta raz�n. Para 
# evitar el conflicto entre sus amigos, Hermione
# ha decidido verificar qui�n tiene la raz�n mediante una simulaci�n de 
# MonteCarlo con 2.000 repeticiones, usando el
# valor 847 como semilla y nivel de significaci�n ??=0,05.

# Se establece una semilla
set.seed(847)

# Se lee el archivo de entrada.
datos <- read.csv2(file.choose(),head=TRUE ,sep=";", stringsAsFactors = TRUE)


# Se selecciona la casa Hufflepuff
muestra_hufflepuff <- datos %>% filter(casa == "Hufflepuff")
# Se selecciona la casa Slytherin
muestra_slytherin <- datos %>% filter(casa == "Slytherin")

# repeticiones
repeticiones <- 2000
# alfa
alfa <- 0.05