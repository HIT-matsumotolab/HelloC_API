import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Group = models.groups;
const Book = models.books;
const Membership = models.membership;
const Collection = models.collection;

exports.getGroupList = async (req, res) => {
    Group.findAll()
        .then(groups => {
            if(groups[0] === undefined){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            return res.send(groups);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.getGroup = async (req, res) => {
    Group.findOne({
        where: { group_id: req.params.id },
        raw: true
    })
        .then(group => {
            if(group === null){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            return res.status(200).send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.getBooks = async (req, res) => {
    Collection.findAll({
        where: { group_id: req.params.id },
        raw: true,
        include: [{
            model: Book,
            as: 'book'
        }]
    })
        .then(result => {
            if(result[0] === undefined){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            return res.send(result);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.createGroup = async (req, res) => {
    Group.create({
        name: req.body.name,
        summary: req.body.summary,
        access_key: req.body.access_key,
        user_id: req.body.user_id
    })
        .then(group => {
            return res.status(201).send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.deleteGroup = async (req, res) => {
    Group.findOne({
        where: { group_id: req.params.id }
    })
        .then(group => {
            if(group === null){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            group.destroy();
            return res.send('deleted!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};


exports.updateGroup = async (req, res) => {
    try {
        await sequelize.transaction(async (t) => {
            const group = await Group.update({
                name: req.body.name,
                summary: req.body.summary,
                access_key: req.body.access_key,
                user_id: req.body.user_id
            }, {
                where: { group_id: req.params.id }
            }, { transaction: t })
            .then(group => {
                if(group === null){
                    res.status(401).json({
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
            })
        })
    }
    catch (error) {
            console.log("ERROR処理");
            console.log(error);
            return res.status(400).send(error);
        }
};

exports.addUser = async (req, res) => {
    Membership.create({
        user_id: req.body.user_id,
        group_id: req.body.group_id
    })
        .then(membership => {
            return res.status(201).send(membership);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.removeUser = async (req, res) => {
    Membership.findOne({
        where: {
            user_id: req.body.user_id,
            group_id: req.body.group_id
        }
    })
        .then(membership => {
            if(membership === null){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            membership.destroy();
            return res.status(200).send('deleted!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.addBook = async (req, res) => {
    Collection.create({
        group_id: req.body.group_id,
        book_id: req.body.book_id
    })
        .then(collection => {
            return res.status(201).send(collection);
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};

exports.removeBook = async (req, res) => {
    Collection.findOne({
        where: {
            group_id: req.body.group_id,
            book_id: req.body.book_id
        }
    })
        .then(collection => {
            if(collection === null){
                return res.status(401).json({
                    "errors": [
                        {
                            "message": "Not Found"
                        }
                    ]
                  });
            }
            collection.destroy();
            return res.send('deleted!');
        })
        .catch((error) => {
            console.log("ERROR処理");
            return res.status(400).send(error);
        });
};
