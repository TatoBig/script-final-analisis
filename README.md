# Examen final - Análisis de Datos

### Como ejecutar el script

- Clonar el repositorio
- Uitlizando yarn
  - `yarn start`
- Uitlizando npm
  - `npm start`

### Archivos para la entrega

- Capturas de pantalla de las 2 gráficas: `Gráficas en R.pdf`
- El script o programa utilizado para exportar a CSV `index.js`
- Un archivo, con todas las instrucciones usadas en R, para la realización del ejercicio `historial_R.txt`

### Gráficas realizadas

- Gráfico de pie - Artículos por categoría - Obtenido del CSV generado a través del script

![LogoBlank](https://raw.githubusercontent.com/TatoBig/script-final-analisis/main/pie.png)

- Código

  ```
   articulos <- read.csv(file = 'table.csv')
   View(articulos)
   library(dplyr)
   articulos %>% count(Categoria)
   categorias_por_articulo <- articulos %>% count(Categoria)
   View(categorias_por_articulo)
   pie(categorias_por_articulo$n, categorias_por_articulo$Categoria)
  ```

- Gráfico de barras - Cuántos artículos tiene cada usuario - Obtenido de MySQL directamente.

![LogoBlank](https://raw.githubusercontent.com/TatoBig/script-final-analisis/main/barplot.png)

- Codigo

```
   install.packages("RMySQL")
   library(RMySQL)
   conexion = dbConnect(RMySQL::MySQL(),
                        dbname='bdblog',
                        host='localhost',
                        port=3306,
                        user='root',
                        password='root')
   result = dbSendQuery(conexion, "SELECT a.id, a.Titulo, c.Categoria, u.usuario FROM articulo a INNER JOIN categoria c ON a.Categoria_id=c.id INNER JOIN usuario u ON a.Usuario_id=u.id;")
   articulos_mysql = fetch(result, n = 18)
   View(articulos_mysql)
   usuarios_por_articulo <- articulos_mysql %>% count(usuario)
   usuarios_por_articulo
   barplot(height = usuarios_por_articulo$n, names= usuarios_por_articulo$usuario)
```
