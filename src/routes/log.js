import { Router } from 'express';
const log = require('../controllers/log.controller');

const router = Router();

router
    .get('/', log.getLogInfoList)
    .get('/:id', log.getLogInfo)
    .post('/', log.createLogInfo)
    .delete('/:id', log.deleteLogInfo)
    .put('/:id', log.updateLogInfo)

    .get('/info/:question_id', log.getLogInfoByQuestionID)

    //detail_logs
    .get('/detail/list', log.getDetailLogInfoList)
    .post('/:id/detail', log.createDetailLog)
    .delete('/detail/:id', log.deleteDetailLog)
    // .put('/detail/:id', log.updateDetailLog)

    //card_detail_logs
    .get('/carddetail/list', log.getCardDetailLogInfoList)
    .post('/:id/carddetail', log.createCardDetailLog)
    .delete('/carddetail/:id', log.deleteCardDetailLog)
    // .put('/carddetail/:id', log.updateCardDetailLog)


export default router;