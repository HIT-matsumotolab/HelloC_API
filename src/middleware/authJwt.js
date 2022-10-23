import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;
const Role =models.roles;
const jwt = require("jsonwebtoken");
const config = require("../config/auth.js");
// const db = require("../models");
// const User = db.user;

exports.verifyToken = (req, res, next) => {
  const token = req.headers["x-access-token"];
  if (!token) {
    return res.status(403).send({
      message: "No token provided!"
    });
  }

  jwt.verify(token, config.secret, (err, decoded) => {
    if (err) {
      return res.status(401).send({
        message: err.message
      });
    }
    req.userId = decoded.user_id;
    req.token = token;
    
    next();
  });
};

exports.isAdmin = (req, res, next) => {
  User.findByPk(req.userId).then(user => {
    if(user.role==='教授者'){
      req.user_id = user.user_id;
      req.name = user.name;
      req.mail = user.mail,
      req.role = user.role,
      req.token = req.token
      next();
      return;
    }else{
      res.status(403).send({
        message: "Require User Role!"
      });
    }
  });
};

exports.isUser = (req, res, next) => {
  User.findByPk(req.userId).then(user => {
    // console.log(user.role);
    if(user.role==='学習者'){
      req.user_id = user.user_id;
      req.name = user.name;
      req.mail = user.mail,
      req.role = user.role,
      req.token = req.token
      next();
      return;
    }else{
      res.status(403).send({
        message: "Require User Role!"
      });
    }
    // Role.findOne({
    //   where: { role: req.body.role }
    // })
    // .then(role => {
    //   console.log(role);
    //   if(role.role='学習者'){
    //     next();
    //     return;
    //   }
    // })
    // .catch(error => {
    //   res.status(403).send({
    //     message: "Require User Role!"
    //   })
    // })
    // user.getRoles().then(roles => {
    //   for (let i = 0; i < roles.length; i++) {
    //     if (roles[i].name === "学習者") {
    //       next();
    //       return;
    //     }
    //   }

    //   res.status(403).send({
    //     message: "Require User Role!"
    //   });
    // });
  });
};

exports.isUserOrAdmin = (req, res, next) => {
  User.findByPk(req.userId).then(user => {
    user.getRoles().then(roles => {
      for (let i = 0; i < roles.length; i++) {
        if (roles[i].name === "教授者") {
          next();
          return;
        }

        if (roles[i].name === "学習者") {
          next();
          return;
        }
      }

      res.status(403).send({
        message: "Require User or Admin Role!"
      });
    });
  });
};
