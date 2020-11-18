const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const dbConfig = require('../../models/mysqlConnection');
const connection = mysql.createConnection(dbConfig);

router.get('/', function (req, res) {
    connection.connect();
    const statement = "select * from tests";
    connection.query(statement, function (err, result, fields) {
        if (err) throw err;
        res.json(
            result
        );
    });
});

module.exports = router;
