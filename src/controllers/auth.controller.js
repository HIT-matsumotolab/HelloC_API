import bcrypt from "bcrypt";


import { initModels } from "../models/init-models.js";

const config = require("../config/auth.js");

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;
const Role =models.roles;

var jwt = require("jsonwebtoken");
// var bcrypt = require("bcryptjs");

exports.signup = async (req, res) => {
  try {
    await sequelize.transaction(async (t) => {
      const user = await User.create({
        name: req.body.name,
        mail: req.body.mail,
        password_hash: bcrypt.hashSync(req.body.password, 10),
        role: req.body.role
      }, { transaction: t })
      .catch(error => {
        res.status(404).send({ message: "Role does not exist"});
      })

      // if (user.role) {
        console.log(user.role);
        await Role.findOne({
          where: {
            role: req.body.role
          },
          raw: true
        }, { transaction: t }).then(roles => {
          console.log(roles);
          res.send({ message: "User was registered successfully!" });
        });
    })
  }
    catch (error) {
        console.log(error);
    };
};

exports.signin = (req, res) => {
  User.findOne({
    where: {
      mail: req.body.mail
    },
    raw: true
  })
    .then(user => {
      console.log(user);
      if (!user) {
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }

      var passwordIsValid = (
        bcrypt.hashSync(req.body.password, 10),
        user.password_hash
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

      var token = jwt.sign({ user_id: user.user_id }, config.secret, {
        expiresIn: 86400 // 24 hours
      });

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
