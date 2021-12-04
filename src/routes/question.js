import { Router } from 'express';
const question = require('../controllers/question.controller');
const router = Router();

router.get('/', question.getQuestionList)
    .get('/:id', question.getQuestion)
    .get('/:id/info', question.getQuestionInfo)
    .get('/blankselect/question', question.getBlankSelectQuestionList)
    .get('/questionposing/question', question.getQuestionPosingList)
    .post('/', question.createQuestion)
    .post('/:id/blank', question.createBlankSelectQuestion)
    .post('/:id/questionposing', question.createQuestionPosing)
    // .post('/:id/card', question.createCard)
    .delete('/:id', question.deleteQuestion)
    .put('/:id', question.updateQuestion)


export default router;