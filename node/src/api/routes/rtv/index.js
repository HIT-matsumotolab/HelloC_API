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

router.get('/input/:question_id', function (req, res) {
    connection.connect();
    const statement = "select input from questions where question_id=" + req.params.question_id;
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
    const statement = "select users.user_id, name, answer_code,process_id from logs_result inner join logs_process inner join users on logs_result.result_id = logs_process.result_id and logs_result.user_id = users.user_id where question_id =" + req.params.question_id +" and result=1";
    connection.query(statement, function (err, result, fields) {
        console.log(result);
        if (err){
            res.json(err);
        }else{
            res.json(
                result
            );
        }
    });
});

router.get('/code/:question_id', function (req, res) {
    connection.connect();
    // const statement = "select * from logs_result inner join logs_process on logs_result.result_id = logs_process.result_id where question_id =" + req.params.question_id +" and result=1";

    //______________________SQL______________________
    // select 	lp.process_id, 
    // u.user_id, 
    // u.name, 
    // lp.answer_code
    // from logs_process lp
    // inner join logs_result lr
    // inner join users u
    // inner join tests t
    // on lp.result_id = lr.result_id
    // and lr.user_id = u.user_id 
    // and lr.test_id = t.test_id
    // where t.test_id =85 
    // and result=1
    // and lp.process_id =(select max(tmplp.process_id)
    //            from logs_process tmplp
    //            inner join logs_result tmplr
    //            inner join users tmpu
    //            inner join tests tmpt
    //            on tmplp.result_id = tmplr.result_id
    //            and tmplr.user_id = tmpu.user_id 
    //            and tmplr.test_id = tmpt.test_id
    //            where	tmplr.user_id = lr.user_id
    //            and tmpt.test_id =85 
    //            and result=1
    //            group by tmplr.user_id)
    //_________________________________________________________

    const statement = ` select 	
                            t.test_id,
                            lr.question_id,
                            u.name, 
                            lp.answer_code 
                        from logs_process lp 
                            inner join logs_result lr 
                            inner join users u 
                            inner join tests t 
                        on lp.result_id = lr.result_id 
                            and lr.user_id = u.user_id 
                            and lr.test_id = t.test_id 
                        where lr.question_id = 
                            `+ req.params.question_id +`
                            and result=1 
                        and lp.process_id =(select max(tmplp.process_id) 
                            from logs_process tmplp 
                            inner join logs_result tmplr 
                            inner join users tmpu 
                            inner join tests tmpt 
                            on tmplp.result_id = tmplr.result_id 
                            and tmplr.user_id = tmpu.user_id 
                            and tmplr.test_id = tmpt.test_id 
                            where	tmplr.user_id = lr.user_id 
                            and tmplr.question_id = 
                            `+ req.params.question_id +` 
                            and result=1 
                            group by tmplr.user_id)`;
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
