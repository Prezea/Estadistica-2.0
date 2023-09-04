
#_____________________ MEDIDAS ___________________

# Se trabajará con la matriz de datos "penguins.xlsx"
# Obtenida de https://allisonhorst.github.io/palmerpenguins/

#----------------------------------------------
# Descargar la matriz y 
# subirla a la nube de trabajo
#----------------------------------------------

# 1.- Descargar la matriz desde classroom o github 
# Nota: El archivo se encontrará en la carpeta de descargas

# 2.- En la ventana de visualizacion (ventana 4) seleccionar:
# Upload / Seleccionar archivo / abrir la carpeta en donde se encuentra
# descargado el archivo (carpeta de descargas)/ aceptar.


#----------------------------------------
# Exportacion de la matriz
#----------------------------------------

# Environment /Import dataset/from excel/ Browser/ seleccionar el 
# archivo/ aceptar/ (visualizar)/ import

#----------------------------------------
#  Exploracion de la matriz
#----------------------------------------

dim()
str()
colnames()
anyNA()


#-----------------------------------------------
#      Tendencia central
#-----------------------------------------------

# 1.- Media y mediana
summary()


# 2.- Moda

# 2.1.- Se descarga el paquete "modeest"
install.packages("modeest")

# 2.2.- Se abre la librería
library(modeest)

# 2.3.- Cálculo de la moda para la variable isla y largo del pico
mfv(penguins$isla) # categorica
mfv(penguins$largo_pico_mm) # numerica


#-----------------------------------------------
#    Medidas de posición
#------------------------------------------------

# 1.- Cuartiles (cuantiles)
summary()

# Selección de una variable de la matriz de datos
largo_aleta_mm<-penguins$largo_aleta_mm

table(largo_aleta_mm)

# 2.- Quintil
quintil<-quantile(penguins[["largo_aleta_mm"]], 
                  p=c(.20, .40, .60, .80))

#2.1.- Visualizacion de la variable
quintil

# 3.- Decil
decil<-quantile(penguins[["largo_aleta_mm"]], 
                p=c(.10, .20, .30, .40, .50, .60,
                    .70, .80, .90))

#3.1.- Visualizacion de la variable
decil


# 4.- Percentil
percentil<-quantile(penguins[["largo_aleta_mm"]], 
                    p=c(.33, .66))
percentil

# Interpretacion:
# <192 = Bajo
# 192-209 = Intermedio
# > 209 = Alto

table(largo_aleta_mm)

#-----------------------------------------------
#      Medidas de dispersión
#-----------------------------------------------

# 1.- Cálculo de la varianza (sólo para variables cuantitativas)
var(penguins$grosor_pico_mm)

# 2.- Cálculo de la desviación estándar
sd(penguins$grosor_pico_mm)

# 3.- Error
media_pico<-mean(penguins$largo_pico_mm)
error<-(penguins$largo_pico_mm-(media_pico))
error


#4.- Coeficiente de variacion
CV<-sd(penguins$largo_pico_mm)/mean(penguins$largo_pico_mm)*100
CV

# 5.- Rango intercuartilico (IQR)
IQR(penguins$largo_pico_mm)

# 6.- Rango
pico<-penguins$largo_pico_mm
rango<-max(pico)-min(pico)
rango

