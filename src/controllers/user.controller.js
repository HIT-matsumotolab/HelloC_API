import bcrypt from "bcrypt";

import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;
const Membership = models.membership;

exports.getUserList = async (req, res) => {
  User.findAll({
    attributes: {
      exclude: ['password_hash']
    }
  })
    .then(users => {
      if(users[0] === undefined){
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }
      return res.send(users);
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};

exports.getUser = async (req, res) => {
  User.findOne({
    where: { user_id: req.params.id },
    attributes: {
      exclude: ['password_hash']
    }
  })
    .then(user => {
      if(user === null){
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }
      // console.log(user);
      return res.send(user);
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};


exports.getGroups = async (req, res) => {
  Membership.findAll({
    where: { user_id: req.params.id },
    // raw: true,
    include: [{
      model: models.groups,
      as: 'group'
    }]
  })
    .then(result => {
      if(result[0] === undefined){
        return res.status(404).json({
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

exports.createUser = async (req, res) => {
  User.create({
    name: req.body.name,
    mail: req.body.mail,
    password_hash: bcrypt.hashSync(req.body.password, 10),
    role: req.body.role
  })
    .then(user => {
      return res.status(201).send({ userId: user.user_id });
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};


exports.deleteUser = async (req, res) => {
  User.update(
    {
      role: '学習終了者'
    },
    {
      where: { user_id: req.params.id }
    })
    .then(user => {
      return res.status(200).send('deleted!');
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};


exports.updateUser = async (req, res) => {
  User.update(
    {
      name: req.body.name,
      mail: req.body.mail,
      password_hash: bcrypt.hashSync(req.body.password, 10),
      role: req.body.role
    },
    {
      where: { user_id: req.params.id }
    })
    .then(user => {
      return res.status(200).send('updated!');
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};

