import mysql from 'mysql2'
const createCsvWriter = require('csv-writer').createObjectCsvWriter
import express from 'express'
import cors from 'cors'
const R = require('r-integration')
const ERRE = 'F:\\Programas\\R'

const app = express()
app.use(  
  cors({
    origin: '*',
  })
)
const port = 3000

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'stock-app-dwh',
  password: 'root',
})
connection.connect()


app.get('/', (req, res) => {
  res.send({
    status: 'success',
  })
})

app.get('/generate-csv', (req, res) => {
  connection.query('SELECT * FROM tablahechos;', function (err, rows, fields) {
    if (err) throw err
    const jsonData = JSON.parse(JSON.stringify(rows))
    const createCsvWriter = require('csv-writer').createObjectCsvWriter
    const csvWriter = createCsvWriter({
      path: 'tabla.csv',
      header: fields.map((field) => {
        return {
          id: field.name,
          title: field.name,
        }
      }),
    })
    csvWriter
      .writeRecords(jsonData)
      .then(() => console.log('Exportado a tabla.csv exitosamente'))
  })
  res.send({
    status: 'success',
  })
})

app.get('/get-r-data', (req, res) => {
  let result: string[] = R.executeRCommand("read.csv(file = 'table.csv')", ERRE)
  const structuredData = []
  for (let i = 7; i < result.length; i += 7) {
    const obj = {
      index: result[i],
      id: result[i + 1],
      year: result[i + 2],
      sector: result[i + 3],
      locationId: result[i + 4],
      riskId: result[i + 5],
      open: result[i + 6],
    }
    console.log(obj)
    structuredData.push(obj)
  }
  res.send({
    status: 'success',
    result: structuredData,
  })
})

app.get('/mean', (req, res) => {
  let result = R.executeRScript('./scripts/test.R', ERRE)
  console.log(result)
  const structuredData = []
  for (let i = 11; i < result.length; i += 3) {
    const obj = {
      id: result[i],
      mean: result[i + 1],
    }
    console.log(obj)
    structuredData.push(obj)
  }
  res.send({
    status: 'success',
    result: structuredData,
  })
})

app.get('/sector', (req, res) => {
  let result = R.executeRScript('./scripts/test2.R', ERRE)
  console.log(result)
  const structuredData = []
  for (let i = 4; i < result.length; i += 3) {
    const obj = {
      sector: result[i],
      quantity: result[i + 1],
    }
    console.log(obj)
    structuredData.push(obj)
  }

  res.send({
    status: 'success',
    result: structuredData,
  })
})

app.listen(port, () => {
  console.log(`Escuchando en el puerto ${port}`)
})
