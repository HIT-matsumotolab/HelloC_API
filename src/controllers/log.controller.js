import bcrypt from "bcrypt";
import req from "express/lib/request";
import detail_logs from "../models/detail_logs.js";

import { initModels } from "../models/init-models.js";
import results from "../models/results.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const LogInfo = models.infomation_logs;
const Detail_log = models.detail_logs;
const Result = models.results;

exports.getLogInfoList = async (req, res) => {
  LogInfo.findAll()
    .then(logs => {
      return res.send(logs);
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.error(error);
    });
};

exports.getLogInfo = async (req, res) => {
  LogInfo.findOne({
    where: { infomation_log_id: req.params.id },
    include: [
        {
            model: Detail_log,
            as: 'detail_log'
        },
        {
            model: Result,
            as: 'result'
        }
    ]
  })
    .then(log => {
      return res.send(log);
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.error(error);
    });
};

exports.createLogInfo = async (req, res) => {
  LogInfo.create({
    user_id: req.body.user_id,
    group_id: req.body.group_id,
    question_id: req.body.question_id,
    question_version: req.body.question_version,
    elapsed_time: req.body.elapsed_time
  })
    .then(log => {
      return res.send({log});
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.error(error);
    });
};


exports.deleteLogInfo = async (req, res) => {
  LogInfo.findOne({
      where: { infomation_log_id: req.params.id }
    })
    .then(log => {
      log.destroy();
      return res.send(log)
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.error(error);
    });
};


exports.updateLogInfo = async (req, res) => {
  LogInfo.update(
    {
        user_id: req.body.user_id,
        group_id: req.body.group_id,
        question_id: req.body.question_id,
        question_version: req.body.question_version,
        elapsed_time: req.body.elapsed_time
    },
    {
        where: { infomation_log_id: req.params.id }
    })
    .then(log => {
      return res.send(log);
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.error(error);
    });
};

exports.createDetailLog = async (req, res) => {
    LogInfo.findOne({
        where: { infomation_log_id: req.params.id }
    })
    .then(loginfo => {
        return Detail_log.create({
            infomation_log_id: req.body.infomation_log_id,
            turn: req.body.turn,
            result_type: req.body.result_type,
            answer: req.body.answer
        })
        .then(log => {
            return res.send(log);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
    })
};

exports.updateDetailLog = async (req, res) => {
    LogInfo.findOne({
        where: { infomation_log_id: req.params.id }
    })
    .then(loginfo => {
        return Detail_log.update({
            turn: req.body.turn,
            result_type: req.body.result_type,
            answer: req.body.answer
        })
        .then(log => {
            return res.send(log);
        })
        .catch((error) => {
            console.log("ERROR処理");
            console.error(error);
        });
    })
};


exports.deleteDetailLog = async (req, res) => {
    Detail_log.findOne({
        where: { infomation_log_id: req.params.id }
    })
    .then(loginfo => {
        loginfo.destroy();
        return res.send(log);
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.log(error);
    })
}
