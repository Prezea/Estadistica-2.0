
#1.- Se exporta la matriz de datos con extención .csv 
textos<-read_delim("texto1.csv")
head(textos)

#2.- Se exporta la matriz con el diccionario de palabras que
# se va a utilizar para filtrar las palabras de forma manual.

stop_words<-read_delim("stop_words.csv")
View(stop_words)

#3.- Instalar paqueterias y abrir librerias
library(tidytext)
library(wordcloud)
library(dplyr)

#4.- limpieza y generacion de nuevo texto

word_freq <- textos %>%
  unnest_tokens(output = word,
                input = texto,
                token = "words",
                format = "text") %>%
  anti_join(stop_words, by = c("word" = "texto")) %>%
  count(word) # devuelve la frecuencia de palabras

View(word_freq)
# en este paso se tendra que modificar el archivo de
# stop_word para eliminar las palabras que no tienen
# significado de forma manual y se tiene que volver a
# activar todo el scrip desde el paso no.2

#5.- Creacion de nube de palabras
wordcloud(words = word_freq$word,
          freq = word_freq$n,
          min.freq = 1,
          max.words = 20,
          colors =  c("Green","blue", "pink"),
          random.order = F,
          random.color = F,
          scale = c(2 ,0.2),
          rot.per = 0.2)
