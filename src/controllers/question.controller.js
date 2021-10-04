import {initModels} from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Question = models.questions;
// const Membership = models.membership;
// const Collection = models.collection;

exports.getQuestionList = async (req, res) => {
    Question.findAll()
        .then(questions => {
            return res.send(questions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.getQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            return res.send(question);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.createQuestion = async (req, res) => {
    Question.create({
        format: req.body.format,
        user_id: req.body.user_id,
        mode: req.body.mode,
        time_limit: req.body.time_limit,
        number_limit: req.body.number_limit
    })
        .then(question => {
            return res.send(question);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.deleteQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            question.destroy();
            return res.send(question);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.updateQuestion = async (req, res) => {
    Question.update({
        format: req.body.format,
        user_id: req.body.user_id,
        mode: req.body.mode,
        time_limit: req.body.time_limit,
        number_limit: req.body.number_limit
    }, {
        where: { question_id: req.params.id }
    })
        .then(question => {
            return res.send(question);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

// exports.addUser = async (req, res) => {
//     Membership.create({
//         user_id: req.body.user_id,
//         question_id: req.body.question_id
//     })
//         .then(membership => {
//             return res.send(membership);
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
// };

// exports.removeUser = async (req, res) => {
//     Membership.findOne({
//         where: {
//             user_id: req.body.user_id,
//             question_id: req.body.question_id
//         }
//     })
//         .then(membership => {
//             membership.destroy();
//             return res.send('削除');
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
// };

// exports.addBook = async (req, res) => {
//     Collection.create({
//         question_id: req.body.question_id,
//         book_id: req.body.book_id
//     })
//         .then(collection => {
//             return res.send(collection);
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
// };

// exports.removeBook = async (req, res) => {
//     Collection.findOne({
//         where: {
//             question_id: req.body.question_id,
//             book_id: req.body.book_id
//         }
//     })
//         .then(collection => {
//             collection.destroy();
//             return res.send('削除');
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
// };
