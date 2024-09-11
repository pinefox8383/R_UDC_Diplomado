#Caso Práctico - Módulo 6 "R"
#Objetivo: Realizar un Análisis exploratorio del conjunto de datos
#de la tripulación del titanic, para después reportar a través de 
#un Resumen los hallazgos encontrados
library(tidyverse)
library(dplyr)

#Análisis Exploratorio / Descriptivo de los Datos............................................................
df<-read.csv("Titanicv2.csv") #Importando archivo csv en un dataframe
head(df) #Explorando los primeros Datos
View(df) #visualizando el data frame para comprender mejor los datos
colSums(is.na(df)) #Visualizando nulos que puede afectar nuestro análisis
df<-drop_na(df)##limpiando nulos en dataset 
str(df) #visualizando estructura
summary(df)#visualizando estadísticas generales


#Histograma - Explorar tripulantes:  por Edad  
#Se observan un grupo grande de Tripulantes jóvenes entre 20 y 30 años
df %>%drop_na() %>%  ggplot(aes(x=Age)) + geom_histogram()

#Histograma - Explorar tripulantes: Sobrevivientes/Decesos  por Edad  
#Se observa visualmente que los decesos fueron superiores a los sobrevivientes
#En su mayoría en un rango de 20 a 30 años
df %>%drop_na() %>%   ggplot(aes(x=Age,fill=Survived)) + geom_histogram()

#Diagramas de caja por Clase,Edad y Tipo de Sobreviviente/Deceso
#Se Oberva que la mediana de la Clase Alta para Sobreviviente y Decesos es muy aproximada
df %>%drop_na() %>%   ggplot(aes(x=Pclass, y=Age,fill=Survived)) + geom_boxplot(alpha=0.5) 


#Análisis visual preeliminar - visualizando gráfico de barras de Sobrevivientes del Titanic
##Visualmente se puede apreciar que Hubo aproximadamente
#48 sobrevivientes de la Clase Alta
#29 sobrevivientes de la Clase Media
#50 sobrevivientes de la Clase Baja
df %>% 
  filter(Survived=="Yes") %>%   
  drop_na() %>% #quitando nulos  
  ggplot(aes(x=Pclass,fill=Pclass)) + 
  geom_bar()

#Explorar Sobrevientes por Edad
#Hallazgos encontrados:  La Mayoría de sobrevivientes fue de un Rango de edad
#                       de 20 a 30 años aproximadamente en su mayoría de clase baja,     
df %>%
  filter(Survived=="Yes") %>%   
  drop_na() %>% #quitando nulos    
  ggplot(aes(x=Age,fill=Pclass)) + 
  geom_histogram(alpha=0.5)  

#Análisis visual preeliminar - visualizando gráfico de barras de decesos del Titanic
##Visualmente se puede apreciar que Hubo aproximadamente
#50 Decesos de la Clase Alta
#59 Decesos de la Clase Media
#96 Decesos de la Clase Baja
df %>% 
  filter(Survived=="No") %>%   
  drop_na() %>% #quitando nulos  
  ggplot(aes(x=Pclass,fill=Pclass)) + 
  geom_bar()

#Explorar Decesos por Edad
#Hallazgos encontrados:  La Mayoría de Decesos fue de un Rango de edad
#                       de 20 a 30 años aproximadamente en su mayoría de clase baja,     
df %>%
  filter(Survived=="No") %>%   
  drop_na() %>% #quitando nulos    
  ggplot(aes(x=Age,fill=Pclass)) + 
  geom_histogram(alpha=0.5)  



#diagrama de dispersión de los datos por Edad,Clase  coloreados por Género
df %>%
  drop_na() %>% #quitando nulos      
  ggplot(aes(x=Pclass, 
             y=Age,
             size=Age,
             color=Sex)) + 
  geom_point(position = "jitter") 

#Distribución por categorías   Sobrevivientes/Decesos y Clases
#Observando una mayor distribución en los Decesos, de la Clase Baja
df %>%
  drop_na() %>% #quitando nulos      
  ggplot(aes(x=Pclass, 
             y=Survived,
             color=Sex)) + 
  geom_point(position = "jitter") 


#Obervando Distribución en Matriz (Grid) con otras variables 
#Observando que: Todos los sobrevivientes fueron totalmente Mujeres
#                y todos los decesos fueron Hombres
                        
df %>%
  drop_na() %>% #quitando nulos      
  ggplot(aes(x=Sex, 
             y=Age,
             size=Age,
             color=Sex)) + 
  geom_point(alpha=0.5)+
  facet_grid(Pclass ~ Survived)  





#RESUMENTES DE DATOS........................................................................ 
#Resumen de Sobrevivientes por Género y Clase
#calculando la Edad:   mediana, promedio, máxima, mínima y cant. total de sobrevivientes
##Encontrando que no hubo sobrevivientes hombres

Resumen_Sobrevivientes<-
df %>% 
  select(Sex,Pclass,Age,Survived) %>% 
  filter(Survived=="Yes") %>% 
  drop_na() %>% #quitando nulos
  group_by(Pclass,Sex) %>% 
  summarise( Edad.mediana=median(Age),
             Edad.promedio=mean(Age),  
             Edad.maxima=max(Age),              
             Edad.minima=min(Age),
             Total=n()
  ) %>%
  ungroup()
view(Resumen_Sobrevivientes)#visualizando Resumen de Sobrevivientes
write.csv(Resumen_Sobrevivientes,"Resumen_Sobrevivientes.csv") #EXportando Resumen de Sobrevivientes a archivo csv


Resumen_Decesos<-
  df %>% 
  select(Sex,Pclass,Age,Survived) %>% 
  filter(Survived=="No") %>% 
  drop_na() %>% #quitando nulos
  group_by(Pclass,Sex) %>% 
  summarise( Edad.mediana=median(Age),
             Edad.promedio=mean(Age),  
             Edad.maxima=max(Age),              
             Edad.minima=min(Age),
             Total=n()
  ) %>%
  ungroup()

view(Resumen_Decesos)#visualizando Resumen de Decesos
write.csv(Resumen_Decesos,"Resumen_Decesos.csv") #EXportando Resumen de Decesos a archivo csv






