const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const dbConfig = require('../../models/mysqlConnection');
const connection = mysql.createConnection(dbConfig);

router.get('/', function (req, res) {
    console.log("welcome helloC_API");
    res.json({
        message: "welcome helloC_API"
    });
});

router.get('/questions/:question_id', function (req, res) {
    connection.connect();
    const statement = "select * from questions where question_id=" + req.params.question_id;
    connection.query(statement, function (err, result, fields) {
        if (err) throw err;
        res.json(
            result
        );
    });
});

router.get('/logs_result/:question_id', function (req, res) {
    connection.connect();
    const statement = "select result_id from logs_result where question_id=" + req.params.question_id;
    connection.query(statement, function (err, result, fields) {
        if (err) throw err;
        res.json(
            result
        );
    });
});

router.get('/logs_process/:result_id', function (req, res) {
    connection.connect();
    const statement = "select * from logs_process where result_id=" + req.params.result_id + " and result=1";
    connection.query(statement, function (err, result, fields) {
        if (err){
            res.json(err);
        }else{
            res.json(
                result
            );
        }
    });
});

router.get('/ranking/:question_id', function (req, res) {
    connection.connect();
    // const statement = "select * from logs_result inner join logs_process on logs_result.result_id = logs_process.result_id where question_id =" + req.params.question_id +" and result=1";
    const statement = "select user_id from logs_result inner join logs_process on logs_result.result_id = logs_process.result_id where question_id =" + req.params.question_id +" and result=1";
    connection.query(statement, function (err, result, fields) {
        if (err){
            res.json(err);
        }else{
            res.json(
                result
            );
        }
    });
});

module.exports = router;

// ルーティングする場合
// const router = express.Router();
// router.use('/ルート名', require('./ファイル名'));
