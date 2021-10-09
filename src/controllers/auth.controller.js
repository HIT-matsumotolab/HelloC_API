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
            if (user == null) {
                return res.send({ error: "ログインできません" });
            }
            if (!bcrypt.compareSync(req.body.password, user.password_hash)) {
                return res.send({ error: "ログインできません" });
            }
            return res.send({
                userId: user.user_id,
                name: user.name
            });
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
};
