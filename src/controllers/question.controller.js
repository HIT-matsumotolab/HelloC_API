import { initModels } from "../models/init-models.js";
import { Op } from "sequelize";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Question = models.questions;
const BlankSelectQuestions = models.blank_select_questions;
const CodingQuestions = models.coding_questions;
const CardQuestion = models.card_questions;

exports.getQuestionList = async (req, res) => {
    Question.findAll({raw:true})
        .then(questions => {
            if(questions[0] === undefined){
                return res.status(404).send('Not found');
            }
            return res.send(questions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.getQuestion = async (req, res) => {
    Question.findOne({
        where: {
            question_id: req.params.id
        }
    })
        .then(question => {
            if (question.format === "blank_select") {
                Question.findOne({
                    where: { question_id: req.params.id },
                    include: [{
                        model: BlankSelectQuestions,
                        as: 'blank_select_question'
                    }]
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                });
            } else if (question.format === "coding") {
                Question.findOne({
                    where: { question_id: req.params.id },
                    include: [{
                        model: CodingQuestions,
                        as: 'coding_question'
                    }]
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                });
            } else {
                Question.findOne({
                    where: { question_id: req.params.id },
                    include: [{
                        model: CardQuestion,
                        as: 'card_question'
                    }]
                }).then(info => {
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                })
            }
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
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
                    if(info === null){
                        return res.status(404).json({
                            "errors": [
                                {
                                    "message": "Not Found"
                                }
                            ]
                        })
                    }
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                });
            } else if (question.format === "coding") {
                CodingQuestions.findOne({
                    where: { question_id: req.params.id }
                }).then(info => {
                    if(info === null){
                        return res.status(404).json({
                            "errors": [
                                {
                                    "message": "Not Found"
                                }
                            ]
                        })
                    }
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                });
            } else {
                CardQuestion.findOne({
                    where: { question_id: req.params.id }
                }).then(info => {
                    if(info === null){
                        return res.status(404).json({
                            "errors": [
                                {
                                    "message": "Not Found"
                                }
                            ]
                        })
                    }
                    return res.send(info);
                }).catch((error) => {
                    console.log("ERROR処理");
                    return res.status(400).send(error);
                })
            }
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.createQuestion = async (req, res) => {
    Question.findOrCreate({
        where: {
            [Op.and]: {
                name: req.body.name,
                format: req.body.format,
                user_id: req.body.user_id,
                mode: req.body.mode
            }
        },
        defaults: {
            name: req.body.name,
            format: req.body.format,
            user_id: req.body.user_id,
            mode: req.body.mode,
            time_limit: req.body.time_limit,
            number_limit: req.body.number_limit
        }
    }).then(([question, created]) => {
        if(created) {
            return res.status(201).send(
                { "question_id": question.question_id }
            );
        } else {
            return res.status(400).json({
                "errors": [
                    {
                        "message": "既にその問題は存在します"
                    }
                ]
              });
        }
    }).catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    })
};




exports.deleteQuestion = async (req, res) => {
    Question.destroy({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if(question === 1){
                return res.status(200).send('deleted!');
            } else {
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
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
            if(question[0] === 0){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            return res.send('updated!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

//blank_select_questions
exports.getBlankSelectQuestionList = async (req, res) => {
    BlankSelectQuestions.findAll()
        .then(blankselectquestions => {
            if(blankselectquestions[0] === undefined){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            return res.send(blankselectquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.getBlankSelectQuestion = async (req, res) => {
    BlankSelectQuestions.findOne({
        where: { question_id: req.params.id }
    })
        .then(blankselectquestions => {
            if(blankselectquestions === null){
                return res.status(404).send(error);
            }
            return res.send(blankselectquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};
//card_question
exports.getCardQuestionList = async (req, res) => {
    CardQuestion.findAll()
        .then(cardquestions => {
            if(cardquestions[0] === undefined){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            return res.send(cardquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.getCardQuestion = async (req, res) => {
    CardQuestion.findOne({
        where: { question_id: req.params.id }
    })
    .then(cardquestion => {
        if(cardquestion === null){
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
        }
        return res.send(cardquestion);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
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
                        return res.status(201).send(blankselectquestion);
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        return res.status(400).send(error);
                    })
            } else {
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
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
                        return res.status(201).send(cardquestion);
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        return res.status(400).send(error);
                    })
            }
        })
};

exports.deleteBlankSelectQuestion = async (req, res) => {
    BlankSelectQuestions.findOne({
        where: { question_id: req.params.id }
    })
        .then(blankselectquestions => {
            if(blankselectquestions === null){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            blankselectquestions.destroy();
            return res.send('deleted!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.deleteCardQuestion = async (req, res) => {
    CardQuestion.findOne({
        where: { question_id: req.params.id }
    })
    .then(card => {
        if(card === null){
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
        }
        card.destroy();
        return res.send('deleted!');
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    })
}


exports.updateBlankSelectQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
    .then(question => {
        if (question.format === "blank_select") {
            return BlankSelectQuestions
            .findOne({
                where: { question_id: req.params.id }
            })
            .then(blank => {
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
                        where: { question_id: blank.question_id }
                    })
                    .then(result => {
                        return res.send('updated!');
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        return res.status(400).send(error);
                    });
            })
            .catch((error) => {
                return res.status(404).send('更新する問題がありません');
            })
        } else {
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
        }
    })
    .catch((error) => {
        console.log('ERROR処理');
        return res.status(400).send(error);
    })
};

exports.updateCardQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if (question.format === "card_question") {
                return CardQuestion
                .findOne({
                    where: { question_id: req.params.id }
                })
                .then(card => {
                    return CardQuestion
                        .update({
                            question_id: card.question_id,
                            explain: req.body.explain,
                            language: req.body.language,
                            base_code: req.body.base_code,
                            card: req.body.card,
                            correct_blank: req.body.correct_blank,
                            stdinout: req.body.stdinout,
                            hint_type: req.body.hint_type,
                            max_exec_time: req.body.max_exec_time
                        }, {
                            where: { question_id: card.question_id }
                        })
                        .then(result => {
                            return res.send('updated!');
                        })
                        .catch((error) => {
                            console.log("ERROR処理");
                            return res.status(400).send(error);
                        });
                })
                .catch((error) => {
                    return res.status(404).send('更新する問題がありません');
                })
            } else {
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
        })
        .catch((error) => {
            console.log('ERROR処理');
            return res.status(400).send(error);
        })
};


//coding
exports.getCodingQuestionList = async (req, res) => {
    CodingQuestions.findAll()
        .then(codingquestions => {
            if(codingquestions[0] === undefined){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            return res.send(codingquestions);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.getCodingQuestion = async (req, res) => {
    CodingQuestions.findOne({
        where: { question_id: req.params.id }
    })
    .then(codingquestion => {
        if(codingquestion === null){
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
        }
        return res.send(codingquestion);
    })
    .catch((error) => {
        console.log("ERROR処理");
        return res.status(400).send(error);
    })
}

exports.createCodingQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
        .then(question => {
            if (question.format === "coding") {
                return CodingQuestions
                    .create({
                        question_id: question.question_id,
                        explain: req.body.explain,
                        language: req.body.language,
                        base_code: req.body.base_code,
                        stdinout: req.body.stdinout,
                        max_exec_time: req.body.max_exec_time,
                        model_answer: req.body.model_answer,
                        judge_format: req.body.judge_format,
                        mandatory_words: req.body.mandatory_words,
                        mini_lines: req.body.mini_lines
                    })
                    .then(codingquestion => {
                        return res.status(201).send(codingquestion);
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        return res.status(400).send(error);
                    })
            } else {
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
        })
};

exports.deleteCodingQuestion = async (req, res) => {
    CodingQuestions.findOne({
        where: { question_id: req.params.id }
    })
        .then(codingquestions => {
            if(codingquestions === null){
                return res.status(404).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                });
            }
            codingquestions.destroy();
            return res.send('deleted!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.updateCodingQuestion = async (req, res) => {
    Question.findOne({
        where: { question_id: req.params.id }
    })
    .then(question => {
        if (question.format === "coding") {
            return CodingQuestions
            .findOne({
                where: { question_id: req.params.id }
            })
            .then(coding => {
                return CodingQuestions
                    .update({
                        question_id: question.question_id,
                        explain: req.body.explain,
                        language: req.body.language,
                        base_code: req.body.base_code,
                        stdinout: req.body.stdinout,
                        max_exec_time: req.body.max_exec_time,
                        model_answer: req.body.model_answer,
                        judge_format: req.body.judge_format,
                        mandatory_words: req.body.mandatory_words,
                        mini_lines: req.body.mini_lines
                    }, {
                        where: { question_id: coding.question_id }
                    })
                    .then(result => {
                        return res.send('updated!');
                    })
                    .catch((error) => {
                        console.log("ERROR処理");
                        return res.status(400).send(error);
                    });
            })
            .catch((error) => {
                return res.status(404).send('更新する問題がありません');
            })
        } else {
            return res.status(404).json({
                "errors": [
                    {
                        "message": "Not Found"
                    }
                ]
            });
        }
    })
    .catch((error) => {
        console.log('ERROR処理');
        return res.status(400).send(error);
    })
};