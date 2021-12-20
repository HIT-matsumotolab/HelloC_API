import {initModels} from "../models/init-models.js";
import questions from "../models/questions.js";
import record from "../models/record.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Book = models.books;
const Record = models.record;
const Questions =models.questions;

exports.getBookList = async (req, res) => {
    Book.findAll({raw: true})
    .then(books => {
        if(books[0] === undefined){
            return res.status(404).send('Not found');
        }
        return res.send(books);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.getBook = async (req, res) => {
    Book.findOne({
        where: { book_id: req.params.id },
        raw: true
    })
    .then(book => {
        if(book === null){
            return res.status(404).send('Not Found');
        }
        return res.send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.getQuestions = async (req, res) => {
    Record.findAll({
        where: { book_id: req.params.id },
        include: [{
            model: Questions,
            as: 'question'
        }]
    })
    .then(result => {
        if(result[0] === undefined){
            return res.status(404).send('Not Found');
        }
        return res.send(result);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.createBook = async (req, res) => {
    Book.create({
        name: req.body.name,
        summary: req.body.summary,
        access_key: req.body.access_key,
        user_id: req.body.user_id
    })
    .then(book => {
        return res.status(201).send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};


exports.deleteBook = async (req, res) => {
    Book.findOne({
        where: { book_id: req.params.id }
    })
    .then(book => {
        if(book === null){
            return res.status(404).send('Not Found');
        }
        book.destroy();
        return res.send('deleted!');
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.updateBook = async (req, res) => {
    Book.update({
        name: req.body.name,
        summary: req.body.summary,
        access_key: req.body.access_key,
        user_id: req.body.user_id
    }, {
        where: { book_id: req.params.id }
    })
    .then(book => {
        if(book[0] === 0){
            return res.status(404).send('Not Found');
        }
        return res.send('updated!');
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.addRecord = async (req, res) => {
    Record.create({
        book_id: req.body.book_id,
        question_id: req.body.question_id,
    })
    .then(record => {
        return res.status(201).send(record);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};

exports.removeRecord = async (req, res) => {
    Record.findOne({
        where: {
            book_id: req.body.book_id,
            question_id: req.body.question_id,
        }
    })
    .then(record => {
        if(record === null){
            return res.status(404).send('Not Found');
        }
        record.destroy();
        return res.send('deleted!');
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    });
};