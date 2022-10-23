import bcrypt from "bcrypt";
import { initModels } from "../models/init-models.js";
import { Op } from "sequelize";

const config = require("../config/auth.js");

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;
const Role =models.roles;

var jwt = require("jsonwebtoken");
// var bcrypt = require("bcryptjs");

exports.signup = async (req, res) => {
  await sequelize.transaction(async (t) => {
    console.log(req.body.mail);
    User.findOrCreate({
      where: {
        [Op.and]: {
            mail: req.body.mail

        }
      },
      defaults: {
        name: req.body.name,
        mail: req.body.mail,
        password_hash: bcrypt.hashSync(req.body.password, 10),
        role: req.body.role
      }
    }).then(([auth, created]) => {
      if(created) {
        const token = jwt.sign({ user_id: auth.user_id }, config.secret, config.option);
        return res.status(201).send({
          accessToken: token
        });
      }
    }).catch((error) => {
      console.log("ERROR処理");
      console.log(error);
      return res.status(401).json({
        "errors": [
            {
                "message": "登録できませんでした"
            }
        ]
      });
    })
  });
};

exports.signin = (req, res) => {
  // console.log('Cookies: ', req.cookies)
  User.findOne({
    where: {
      mail: req.body.mail,
      // password: bcrypt.matches(req.body.password)
    },
    raw: true
  })
    .then(user => {
      console.log(user);
      if (!user) {
        return res.status(401).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }

      var passwordIsValid = (
        bcrypt.compareSync(req.body.password, user.password_hash)
        // console.log(bcrypt.hashSync(req.body.password, 10)),
        // user.password_hash
        // console.log(user.password_hash)
      );

      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          "errors": [
            {
                "message": "Invalid Password!"
            }
        ]
        });
      }

      var token = jwt.sign({ user_id: user.user_id }, config.secret, config.option);
      res.status(200).send({
        user_id: user.user_id,
        name: user.name,
        mail: user.mail,
        role: user.role,
        accessToken: token
      });

    })
    .catch(err => {
      res.status(500).send(err);
    });
};
exports.userBoard = (req, res) => {
  res.status(200).send({
    user_id: req.user_id,
    name: req.name,
    mail: req.mail,
    role: req.role,
    accessToken: req.token
  });
};
exports.adminBoard = (req, res) => {
  // console.log(req);
  res.status(200).send({
    user_id: req.user_id,
    name: req.name,
    mail: req.mail,
    role: req.role,
    accessToken: req.token
  });
};
// exports.start = async (req, res) => {
//     User.findOne({
//         where: { mail: req.body.mail }
//     })
//         .then(user => {
//             if (user == null) {
//                 return res.send({ error: "ログインできません" });
//             }
//             if (!bcrypt.compareSync(req.body.password, user.password_hash)) {
//                 return res.send({ error: "ログインできません" });
//             }
//             return res.send({
//                 userId: user.user_id,
//                 name: user.name
//             });
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
// };
