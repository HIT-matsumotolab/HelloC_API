import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Question = models.questions;
const BlankSelectQuestions = models.blank_select_questions;
const CodingQuestions = models.coding_questions;
const CardQuestion = models.card_questions;

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

exports.getQuestionInfo = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if (question.format === "blank_select") {
                BlankSelectQuestions.findOne({
                    where: { question_id: req.params.id }
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    console.error(error);
                });
            } else if (question.format === "coding") {
                CodingQuestions.findOne({
                    where: { question_id: req.params.id }
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    console.error(error);
                });
            } else {
                CardQuestion.findOne({
                    where: { question_id: req.params.id }
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    console.error(error);
                })
            }
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.createQuestion = async (req, res) => {
    try {
        await sequelize.transaction(async (t) => {
            const question = await Question.create({
                name: req.body.name,
                format: req.body.format,
                user_id: req.body.user_id,
                mode: req.body.mode,
                time_limit: req.body.time_limit,
                number_limit: req.body.number_limit
            }, { transaction: t })

            // if (question.format === "blank_select") {
            //     await BlankSelectQuestions.create({
            //         question_id: question.question_id,
            //         explain: req.body.explain,
            //         language: req.body.language,
            //         base_code: req.body.base_code,
            //         stdinout: req.body.stdinout,
            //         max_exec_time: req.body.max_exec_time,
            //         select_blank: req.body.select_blank,
            //         correct_blank: req.body.correct_blank,
            //         hint_type: req.body.hint_type,
            //     }, { transaction: t })
            // } else if (question.format === "card_question") {
            //     await CardQuestion.create({
            //         question_id: question.question_id,
            //         explain: req.body.explain,
            //         language: req.body.language,
            //         base_code: req.body.base_code,
            //         stdinout: req.body.stdinout,
            //         max_exec_time: req.body.max_exec_time,
            //         hint_type: req.body.hint_type,
            //     }, { transaction: t })
            //     .then(card => {
            //         return Card
            //         .create({
            //             question_id: card.question_id,
            //             question_code: req.body.question_code,
            //             card: req.body.card
            //         },  { transaction: t })
            //     })
            // } else {
            //     await CodingQuestions.create({
            //     })
            // }
            return res.send(
                { "question_id": question.question_id }
            );
        });
    }
    catch (error) {
        console.log("ERROR処理");
        console.error(error);
        return res.send(error);
    }
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
        name: req.body.name,
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

//blank_select_questions
exports.getBlankSelectQuestionList = async (req, res) => {
    BlankSelectQuestions.findAll()
        .then(blankselectquestions => {
            return res.send(blankselectquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.getBlankSelectQuestion = async (req, res) => {
    BlankSelectQuestions.findOne({
        where: { question_id: req.params.id }
    })
        .then(blankselectquestions => {
            return res.send(blankselectquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};
//card_question
exports.getCardQuestionList = async (req, res) => {
    CardQuestion.findAll()
        .then(cardquestion => {
            return res.send(cardquestion);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.getCardQuestion = async (req, res) => {
    CardQuestion.findOne({
        where: { question_id: req.params.id }
    })
    .then(cardquestions => {
        return res.send(cardquestions);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.error(error);
    })
}


exports.createBlankSelectQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if (question.format === "blank_select") {
                return BlankSelectQuestions
                    .create({
                        question_id: question.question_id,
                        explain: req.body.explain,
                        language: req.body.language,
                        base_code: req.body.base_code,
                        select_blank: req.body.select_blank,
                        correct_blank: req.body.correct_blank,
                        stdinout: req.body.stdinout,
                        hint_type: req.body.hint_type,
                        max_exec_time: req.body.max_exec_time
                    })
                    .then(blankselectquestion => {
                        return res.send(blankselectquestion);
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        console.log(error);
                    })
            }
        })
};
//作問による空欄補填学習
exports.createCardQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id },
        raw: true
    })
        .then(question => {
            if (question.format === "card_question") {
                return CardQuestion
                    .create({
                        question_id: question.question_id,
                        explain: req.body.explain,
                        language: req.body.language,
                        base_code: req.body.base_code,
                        card: req.body.card,
                        correct_blank: req.body.correct_blank,
                        stdinout: req.body.stdinout,
                        hint_type: req.body.hint_type,
                        max_exec_time: req.body.max_exec_time
                    })
                    .then(cardquestion => {
                        return res.send(cardquestion);
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        console.log(error);
                    })
            }
        })
};

exports.deleteBlankSelectQuestion = async (req, res) => {
    BlankSelectQuestions.findOne({
        where: { question_id: req.params.id }
    })
        .then(blankselectquestions => {
            blankselectquestions.destroy();
            return res.send(blankselectquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.deleteCardQuestion = async (req, res) => {
    CardQuestion.findOne({
        where: { question_id: req.params.id }
    })
    .then(card => {
        card.destroy();
        return res.send(card);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.log(error);
    })
}


exports.updateBlankSelectQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if (question.format === "blank_select") {
                return BlankSelectQuestions
                    .update({
                        question_id: question.question_id,
                        explain: req.body.explain,
                        language: req.body.language,
                        base_code: req.body.base_code,
                        select_blank: req.body.select_blank,
                        correct_blank: req.body.correct_blank,
                        stdinout: req.body.stdinout,
                        hint_type: req.body.hint_type,
                        max_exec_time: req.body.max_exec_time
                    }, {
                        where: { question_id: question.question_id }
                    })
                    .then(result => {
                        return res.send('updated!');
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        console.error(error);
                    });
            }
        })
};
