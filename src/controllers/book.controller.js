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
        console.log(books);
        return res.send(books);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    });
};

exports.getBook = async (req, res) => {
    Book.findOne({
        where: { book_id: req.params.id },
        raw: true
    })
    .then(book => {
        return res.send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    });
};

exports.getQuestions = async (req, res) => {
    Record.findOne({
        where: { book_id: req.params.id },
        include: [{
            model: Questions,
            as: 'question'
        }]
    })
    .then(result => {
        return res.send(result.question);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
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
        return res.send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    });
};


exports.deleteBook = async (req, res) => {
    Book.findOne({
        where: { book_id: req.params.id }
    })
    .then(book => {
        book.destroy();
        return res.send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
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
        return res.send(book);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    });
};

exports.addRecord = async (req, res) => {
    Record.create({
        book_id: req.body.book_id,
        question_id: req.body.question_id,
    })
    .then(record => {
        return res.send(record);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
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
        record.destroy();
        return res.send('削除');
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    });
};