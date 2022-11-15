import mysql from 'mysql2'
const createCsvWriter = require('csv-writer').createObjectCsvWriter

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'bdblog',
  password: 'root',
})
connection.connect()

const main = async () => {
  connection.query(
    'SELECT a.id, a.Titulo, c.Categoria, u.usuario FROM articulo a INNER JOIN categoria c ON a.Categoria_id=c.id INNER JOIN usuario u ON a.Usuario_id=u.id;',
    function (err, rows, fields) {
      if (err) throw err

      const jsonData = JSON.parse(JSON.stringify(rows))
      const createCsvWriter = require('csv-writer').createObjectCsvWriter

      const csvWriter = createCsvWriter({
        path: 'table.csv',
        header: fields.map((field) => {
          return {
            id: field.name,
            title: field.name,
          }
        }),
      })

      csvWriter
        .writeRecords(jsonData)
        .then(() => console.log('Exportado a table.csv exitosamente'))
    }
  )
}

main()
