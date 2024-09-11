# Modulo 6 - Caso Práctico en "R"

Análisis de la Tripulación del accidente del "Titanic"

## Objetivo del Análisis

Se requiere analizar el conjunto de datos de un archivo CSV que contiene información sobre los sobrevivientes
y decesos de la tripulación del accidente del “Titanic”, a través de un análisis exploratorio en lenguaje de 
programación R, para comprender mejor la información y poder realizar una serie de hallazgos y reportes 
visuales del contenido

## Resultados del Análisis

Se logró comprender el objetivo que se pretendía. Después de la importación de los datos del archivo, se observó 
que contenía algunos datos nulos, que podrían alterar la correcta visualización de los resultados por lo que se 
procedió a eliminarlos del universo de datos. Después se procedió a la realización de un análisis exploratorio 
para determinar que tipo de análisis más específico sobre los datos nos ayudarían a comprender mejor la información,
 utilizando selección de columnas más significativas, filtros y agrupamiento de las mismas a criterio propio en 
 la cual se llegó a la siguiente determinación:


	1.- De un total de 418 registros, se eliminaron 81 que contenían datos nulos, quedando un universo 
	     de datos de 331 registros confiables
	2.- Realizando una serie de análisis a través de gráficos se observó lo siguiente:
		* Se observa un grupo grande de Tripulantes jóvenes entre 20 y 30 años
		* Los decesos fueron superiores a los sobrevivientes
		* Todos los sobrevivientes fueron mujeres
		* Todos los decesos fueron hombres
		* Realizando análisis en gráficos de cajas, se observa que la mediana y promedio de edad de la
		Clase Alta para sobrevivientes y decesos es muy similar o aproximada
		* Realizando análisis en gráficos de distribución, se observa una mayor distribución en los 
		decesos de la Clase baja.

3.- Resumen: Todos los sobrevivientes del suceso fueron mujeres con las siguientes estadísticas de edad
![Resumen_Sobrevivientes](https://github.com/user-attachments/assets/83c5fe4c-11ad-4592-8767-8c884e8d81cb)

4.- Resumen: Todos los decesos del suceso fueron hombres con las siguientes estadísticas de edad
![Resumen_Decesos](https://github.com/user-attachments/assets/55bf1e43-d53f-486d-835c-85306bd984a4)



