import { Router } from 'express';
const question = require('../controllers/question.controller');
const router = Router();

router.get('/', question.getQuestionList)
    .get('/:id', question.getQuestion)
    .get('/:id/info', question.getQuestionInfo)
    .get('/blankselect/list', question.getBlankSelectQuestionList)
    .get('/:id/blankselect', question.getBlankSelectQuestion)
    .get('/card/list', question.getCardQuestionList)
    .get('/:id/card', question.getCardQuestion)
    .post('/', question.createQuestion)
    .post('/:id/blankselect', question.createBlankSelectQuestion)
    .post('/:id/card', question.createCardQuestion)
    // .post('/:id/card', question.createCard)
    .delete('/:id', question.deleteQuestion)
    .delete('/:id/blankselect', question.deleteBlankSelectQuestion)
    .delete('/:id/card', question.deleteCardQuestion)
    .put('/:id', question.updateQuestion)
    .put('/:id/blankselect', question.updateBlankSelectQuestion)
    .put('/:id/card', question.updateCardQuestion)


export default router;
