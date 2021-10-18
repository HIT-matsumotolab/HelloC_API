import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;

exports.checkDuplicateMail = (req, res, next) => {
    // mail
    User.findOne({
      where: {
        mail: req.body.mail
      }
    }).then(user => {
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
  if (req.body.roles) {
    for (let i = 0; i < req.body.roles.length; i++) {
      if (!ROLES.includes(req.body.roles[i])) {
        res.status(400).send({
          message: "Failed! Role does not exist = " + req.body.roles[i]
        });
        return;
      }
    }
  }
  
  next();
};
