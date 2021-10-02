import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const Group = models.groups;
const Membership = models.membership;
const Collection = models.collection;

exports.getGroupList = async (req, res) => {
    Group.findAll()
        .then(groups => {
            return res.send(groups);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.getGroup = async (req, res) => {
    Group.findOne({
        where: { group_id: req.params.id }
    })
        .then(group => {
            return res.send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
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
            return res.send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.deleteGroup = async (req, res) => {
    Group.findOne({
        where: { group_id: req.params.id }
    })
        .then(group => {
            group.destroy();
            return res.send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};


exports.updateGroup = async (req, res) => {
    Group.update({
        name: req.body.name,
        summary: req.body.summary,
        access_key: req.body.access_key,
        user_id: req.body.user_id
    }, {
        where: { group_id: req.params.id }
    })
        .then(group => {
            return res.send(group);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.addUser = async (req, res) => {
    Membership.create({
        user_id: req.body.user_id,
        group_id: req.body.group_id
    })
        .then(membership => {
            return res.send(membership);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
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
            membership.destroy();
            return res.send('削除');
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};

exports.addBook = async (req, res) => {
    Collection.create({
        group_id: req.body.group_id,
        book_id: req.body.book_id
    })
        .then(collection => {
            return res.send(collection);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
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
            collection.destroy();
            return res.send('削除');
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};
