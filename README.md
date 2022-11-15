# Examen final - Análisis de Datos

### Como ejecutar el script

- Clonar el repositorio
- Uitlizando yarn
  - `yarn start`
- Uitlizando npm
  - `npm start`

### Gráficas realizadas

- Grafica realizada a través de un archivo .csv generado por este script extraído de la base de datos en MySQL

![LogoBlank](https://raw.githubusercontent.com/TatoBig/script-final-analisis/main/pie.png)

- Código
  ```
  articulos <- read.csv(file = 'table.csv')
  View(articulos)
  library(dplyr)
  articulos %>% count(Categoria)
  categorias_por_articulo <- articulos %>% count(Categoria)
  pie(categorias_por_articulo)
  View(categorias_por_articulo)
  pie(categorias_por_articulo$n, categorias_por_articulo$Categoria)
  ```
