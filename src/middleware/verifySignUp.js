import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;
const Role =models.roles;

exports.checkDuplicateMail = (req, res, next) => {
    // mail
    // console.log(req.body.mail);
    User.findOne({
      where: {
        mail: req.body.mail
      }
    }).then(user => {
      console.log(user);
      if (user) {
        res.status(400).send({
          message: "Failed! Mail is already in use!"
        });
        return;
      }

      next();
    });
};

exports.checkRolesExisted = (req, res, next) => {
  // console.log(req.body.role);
  if (req.body.role) {
    Role.findOne({
      where: {
        role: req.body.role
      }
    }).then(role => {
      if (!role) {
        res.status(400).send({
          message: "Failed! Role does not exist"
        });
        return;
      }
      next();
    })
  }
};
