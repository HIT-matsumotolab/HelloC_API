import { Router } from 'express';
const question = require('../controllers/question.controller');
const router = Router();

router.get('/', question.getQuestionList)
    .get('/:id', question.getQuestion)
    .get('/:id/info', question.getQuestionInfo)
    .post('/', question.createQuestion)
    .delete('/:id', question.deleteQuestion)
    .put('/:id', question.updateQuestion)

    .get('/blankselect/question', question.getBlankSelectQuestionList)
    .get('/blankselect/question/:id', question.getBlankSelectQuestion)
    .post('/:id/blank', question.createBlankSelectQuestion)
    .delete('/:id/blank', question.deleteBlankSelectQuestion)
    .put('/:id/blank', question.updateBlankSelectQuestion)

export default router;