import bcrypt from "bcrypt";


import { initModels } from "../models/init-models.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const User = models.users;

exports.start = async (req, res) => {
    User.findOne({
        where: { mail: req.body.mail }
    })
        .then(user => {
            if (!bcrypt.compareSync(req.body.password, user.password_hash)) {
                return res.send({ error: "ログインできません" });
            }
            return res.send({ userId: user.user_id });
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};
