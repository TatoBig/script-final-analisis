"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mysql2_1 = __importDefault(require("mysql2"));
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const connection = mysql2_1.default.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'bdblog',
    password: 'root'
});
connection.connect();
const main = () => __awaiter(void 0, void 0, void 0, function* () {
    connection.query('SELECT * FROM articulo', function (err, rows, fields) {
        if (err)
            throw err;
        const jsonData = JSON.parse(JSON.stringify(rows));
        console.log(jsonData);
        const createCsvWriter = require('csv-writer').createObjectCsvWriter;
        const csvWriter = createCsvWriter({
            path: 'table.csv',
            header: fields.map((field) => {
                return {
                    id: field.name,
                    title: field.name,
                };
            }),
        });
        csvWriter
            .writeRecords(jsonData)
            .then(() => console.log('Exportado a table.csv exitosamente'));
    });
});
main();
