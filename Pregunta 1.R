library(tidyr)
library(dplyr)
library(leaps)
library(boot)
library(bootES)
library(ggpubr)
library(simpleboot)


# PREGUNTA N°1
# Harry cree que, en promedio, los estudiantes de Hufflepuff obtuvieron 12 
# puntos menos durante el primer trimestre que durante el segundo. Aunque 
# Hermione no está de acuerdo con que su amigo participe de apuestas, ha
# decidido corroborar este hecho usando bootstrapping con 5.000 repeticiones 
# con el valor 531 como semilla y nivel de significación ??=0,05.

# Se establece una semilla
set.seed(531)

# Se lee el archivo de entrada.
datos <- read.csv2(file.choose(),head=TRUE ,sep=";", stringsAsFactors = TRUE)


# Se selecciona la casa Hufflepuff
muestra <- datos %>% filter(casa == "Hufflepuff")

# Hipotesis:
# Hipotesis nula    (H0): Los estudaintes de Hufflepuff tuvieron 12 puntos menos durante
#                         el primer trimestre que en el segundo trimestre
# Hipotesis Alterna (H1): Los estudiantes de Hufflepuff no obtuvieron 12 puntos menos
#                         durante el primer trimestre que en el segundo trimestre

# Se selecciona el primer trimestre
trimestre1 <- muestra$trim1
# Se selecciona el segundo trimestre  
trimestre2 <- muestra$trim2

# Se calcula la media de ambas muestras

media_trim1 <- mean(trimestre1)
media_trim2 <- mean(trimestre2)

# Diferencia entre medias muestrales
diferencia <- media_trim1 - media_trim2

# Se utiliza el alfa a = 0,05
alfa <- 0.05

# Se crea la distribucion bootstrap
bootstrap <- 5000
distribucion_boot<-two.boot(trimestre1,trimestre2, FUN = mean, R = bootstrap)

valores <- data.frame (distribucion_boot$t)
colnames(valores) <- " valores "




# Se establece un valor nulo igual a 12.
valor_nulo <- 12
desplazamiento <- mean(distribucion_boot[["t"]]-valor_nulo)
distribucion_nula <-(distribucion_boot[["t"]]-desplazamiento)

# Determina el valor P.
p <- (sum(abs(distribucion_nula)>abs(diferencia))+1)/(bootstrap +1)
cat("El valor p es:",p)

intervalo_bca <- boot.ci(distribucion_boot, conf = 1 - alfa,type="bca")
# Conclusion
