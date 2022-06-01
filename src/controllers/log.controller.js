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
            turn: req.body.turn,
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
        return res.status(404).json({
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
      return res.status(404).json({
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
            answer: req.body.answer,
            elapsed_time: req.body.elapsed_time
          });
          return res.send(log);
        } catch (error) {
          console.log("ERROR処理");
          return res.status(400).send(error);
        }
      }else{
        return res.status(404).json({
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
      return res.status(404).json({
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
      console.log(error);
  })
}
