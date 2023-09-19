import bcrypt from "bcrypt";
// import req from "express/lib/request";
// import detail_logs from "../models/detail_logs.js";

import { initModels } from "../models/init-models.js";
// import results from "../models/results.js";

const sequelize = require("../config/database");
const models = initModels(sequelize);

const LogInfo = models.information_logs;
const Detail_log = models.detail_logs;
const Card_Detail_log = models.card_detail_logs;
const Result = models.results;

exports.getLogInfoList = async (req, res) => {
  LogInfo.findAll()
    .then(logs => {
      if(logs[0] === undefined){
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }
      return res.send(logs);
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};

exports.getLogInfo = async (req, res) => {
  LogInfo.findOne({
    where: { information_log_id: req.params.id }
  })
    .then(log => {
      if(log === null){
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
      }
      if(log.format === 'card_question'){
        LogInfo.findOne({
          where: { information_log_id: req.params.id },
          include: [{
            model: Card_Detail_log,
            as: 'card_detail_logs'
          }]
        }).then(logs => {
          return res.send(logs);
        }).catch((error) => {
          console.log("ERROR処理");
          return res.status(400).send(error);
        })
      }
      else if(log.format === 'blank_select' || log.format === 'coding'){
        LogInfo.findOne({
          where: { information_log_id: req.params.id },
          include: [{
            model: Detail_log,
            as: 'detail_logs'
          }]
        }).then(logs => {
          return res.send(logs);
        }).catch((error) => {
          console.log("ERROR処理");
          return res.status(400).send(error);
        })
      }
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};

exports.createLogInfo = async (req, res) => {
  LogInfo.create({
    user_id: req.body.user_id,
    question_id: req.body.question_id,
    format: req.body.format
  })
    .then(log => {
      return res.status(201).send({log});
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};


exports.deleteLogInfo = async (req, res) => {
  LogInfo.destroy({
      where: { information_log_id: req.params.id }
    })
    .then(log => {
      if(log === 1){
        return res.status(200).send('deleted!');
      } else {
          return res.status(404).json({
            "errors": [
                {
                    "message": "Not Found"
                }
            ]
          });
      }
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};


exports.updateLogInfo = async (req, res) => {
  LogInfo.update(
    {
        user_id: req.body.user_id,
        question_id: req.body.question_id,
        format: req.body.format
    },
    {
        where: { information_log_id: req.params.id }
    })
    .then(log => {
      if(log[0] === 0){
        return res.status(404).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
        });
    }
    return res.send('updated!');
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(400).send(error);
    });
};

exports.getDetailLogInfoList = async (req, res) => {
  Detail_log.findAll()
  .then(logs => {
    return res.send(logs);
  })
  .catch((error) => {
    console.log('ERROR処理');
    return res.status(400).send(error);
  })
}
exports.getCardDetailLogInfoList = async (req, res) => {
  Card_Detail_log.findAll()
  .then(logs => {
    if(logs[0] === undefined){
      return res.status(404).json({
        "errors": [
          {
              "message": "Not Found"
          }
        ]
      })
    }
    return res.send(logs);
  })
  .catch((error) => {
    console.log('ERROR処理');
    return res.status(400).send(error);
  })
}

exports.createDetailLog = async (req, res) => {
    LogInfo.findOne({
        where: { information_log_id: req.params.id }
    })
    .then(async loginfo => {
      // console.log(loginfo.format);
      if(loginfo.format === 'blank_select' || loginfo.format === 'coding'){
        try {
          const log = await Detail_log.create({
            information_log_id: loginfo.information_log_id,
            select_history: req.body.select_history,
            trial: req.body.trial,
            result_type: req.body.result_type,
            answer: req.body.answer,
            elapsed_time: req.body.elapsed_time
          });
          return res.send(log);
        } catch (error) {
          console.log("ERROR処理");
          return res.status(400).send(error);
        }
      }else{
        return res.status(401).json({
          "errors": [
            {
                "message": "Formats do not match"
            }
        ]
        })
      }
    })
    .catch((error) => {
      console.log("ERROR処理");
      return res.status(401).json({
        "errors": [
            {
                "message": "Not Found"
            }
        ]
      });
    })
}

exports.createCardDetailLog = async (req, res) => {
    LogInfo.findOne({
        where: { information_log_id: req.params.id }
    })
    .then(async loginfo => {
      if(loginfo.format === 'card_question'){
        try {
          const log = await Card_Detail_log.create({
            information_log_id: loginfo.information_log_id,
            select_history: req.body.select_history,
            trial: req.body.trial,
            result_type: req.body.result_type,
            levenshtein_distance: req.body.levenshtein_distance,
            answer: req.body.answer,
            elapsed_time: req.body.elapsed_time
          });
          return res.send(log);
        } catch (error) {
          console.log("ERROR処理");
          console.log(error)
          return res.status(400).send(error);
        }
      }else{
        return res.status(401).json({
          "errors": [
            {
                "message": "Formats do not match"
            }
        ]
        })
      }
    })
    .catch((error) => {
      console.log("ERROR処理");
      console.log("feawo")
      return res.status(401).json({
        "errors": [
            {
                "message": "Not Found"
            }
        ]
      });
    })
}

// exports.updateDetailLog = async (req, res) => {
//     LogInfo.findOne({
//         where: { information_log_id: req.params.id }
//     })
//     .then(result => {
//         return result.update({
//             turn: req.body.turn,
//             result_type: req.body.result_type,
//             answer: req.body.answer,
//             elapsed_time: req.body.elapsed_time
//         })
//         .then(log => {
//             return res.send(log);
//         })
//         .catch((error) => {
//             console.log("ERROR処理");
//             console.error(error);
//         });
//     })
// };
// exports.updateCardDetailLog = async (req, res) => {
//   LogInfo.findOne({
//       where: { information_log_id: req.params.id }
//   })
//   .then(result => {
//       return Card_Detail_log.update({
//           select_history: req.body.select_history,
//           trial: req.body.trial,
//           result_type: req.body.result_type,
//           answer: req.body.answer,
//           elapsed_time: req.body.elapsed_time
//       })
//       .then(log => {
//           return res.send(log);
//       })
//       .catch((error) => {
//           console.log("ERROR処理");
//           console.error(error);
//       });
//   })
// };


exports.deleteDetailLog = async (req, res) => {
    Detail_log.destroy({
        where: { detail_log_id: req.params.id }
    })
    .then(loginfo => {
      if(loginfo === 1){
        return res.status(200).json({
          "success": [
              {
                  "message": "deleted!"
              }
          ]
        });
      } else {
        return res.status(401).json({
            "errors": [
                {
                    "message": "Not Found"
                }
            ]
        });
      }
    })
    .catch((error) => {
        console.log("ERROR処理");
        console.log(error);
    })
}
exports.deleteCardDetailLog = async (req, res) => {
  Card_Detail_log.destroy({
      where: { card_detail_log_id: req.params.id }
  })
  .then(loginfo => {
    if(loginfo === 1){
      return res.status(200).json({
        "success": [
            {
                "message": "deleted!"
            }
        ]
      });
    } else {
      return res.status(401).json({
          "errors": [
              {
                  "message": "Not Found"
              }
          ]
      });
    }
  })
  .catch((error) => {
      console.log("ERROR処理");
      console.log(error);
  })
}
exports.getLogInfoByQuestionID = async (req, res) => {
  const { question_id } = req.params;

  // データベースから指定した question_id の LogInfo を取得
  try {
    const logInfos = await LogInfo.findAll({
      where: { question_id },
    });

    // ユーザーごとに情報を整形して格納するためのマップを用意
    const userLogMap = new Map();

    for (const logInfo of logInfos) {
      const user_id = logInfo.user_id;
      const userInfo = {
        information_log_id: logInfo.information_log_id,
        user_id: logInfo.user_id,
        question_id: logInfo.question_id,
        format: logInfo.format,
        created_at: logInfo.created_at,
        card_detail_logs: [],
      };

      // 対応するカード詳細ログ情報を取得
      const cardDetailLogs = await Card_Detail_log.findAll({
        where: { information_log_id: logInfo.information_log_id },
      });

      for (const cardDetailLog of cardDetailLogs) {
        const cardLog = {
          information_log_id: cardDetailLog.information_log_id,
          card_detail_log_id: cardDetailLog.card_detail_log_id,
          select_history: cardDetailLog.select_history,
          trial: cardDetailLog.trial,
          result_type: cardDetailLog.result_type,
          levenshtein_distance: cardDetailLog.levenshtein_distance,
          answer: cardDetailLog.answer,
          elapsed_time: cardDetailLog.elapsed_time,
          answer_at: cardDetailLog.answer_at,
        };
        userInfo.card_detail_logs.push(cardLog);
      }

      if (!userLogMap.has(user_id)) {
        userLogMap.set(user_id, { user_id, info: [] });
      }

      userLogMap.get(user_id).info.push(userInfo);
    }

    // マップから値だけを取り出して JSON 配列に変換
    const result = Array.from(userLogMap.values());

    // 結果をJSONで返す
    return res.status(200).json(result);
  } catch (error) {
    console.log("ERROR処理");
    return res.status(400).send(error);
  }
};