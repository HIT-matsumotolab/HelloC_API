
import {initModels} from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Book = models.books;
// const Co = models.membership;

exports.getBookList = async (req, res) => {
    Book.findAll()
        .then(books => {
            return res.send(books);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.getBook = async (req, res) => {
    Book.findOne({
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
