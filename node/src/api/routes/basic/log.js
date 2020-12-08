const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const dbConfig = require('../../models/mysqlConnection');
const connection = mysql.createConnection(dbConfig);

router.get('/result/:question_id', function (req, res) {
    connection.connect();
    const statement = "select * from logs_result where question_id=" + req.params.question_id;
    connection.query(statement, function (err, result, fields) {
        if (err) throw err;
        res.json(
            result
        );
    });
});

router.get('/process/:result_id', function (req, res) {
    connection.connect();
    const statement = "select * from logs_process where result_id=" + req.params.result_id;
    connection.query(statement, function (err, result, fields) {
        if (err) throw err;
        res.json(
            result
        );
    });
});

module.exports = router;
