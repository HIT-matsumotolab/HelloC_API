import { Router } from 'express';
const log = require('../controllers/log.controller');

const router = Router();

router
    .get('/', log.getLogInfoList)
    .get('/:id', log.getLogInfo)
    .post('/', log.createLogInfo)
    .delete('/:id', log.deleteLogInfo)
    .put('/:id', log.updateLogInfo)

    //detail_logs
    .post('/:id/detail', log.createDetailLog)
    .delete('/detail/:id', log.deleteDetailLog)
    .put('/detail/:id', log.updateDetailLog)


export default router;