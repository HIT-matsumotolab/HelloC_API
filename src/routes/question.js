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

    .get('/coding/list', question.getCodingQuestionList)
    .get('/:id/coding', question.getCodingQuestion)

    .post('/', question.createQuestion)
    .post('/:id/blankselect', question.createBlankSelectQuestion)
    .post('/:id/card', question.createCardQuestion)

    .post('/:id/coding', question.createCodingQuestion)

    .delete('/:id', question.deleteQuestion)
    .delete('/:id/blankselect', question.deleteBlankSelectQuestion)
    .delete('/:id/card', question.deleteCardQuestion)

    .delete('/:id/coding', question.deleteCodingQuestion)

    .put('/:id', question.updateQuestion)
    .put('/:id/blankselect', question.updateBlankSelectQuestion)
    .put('/:id/card', question.updateCardQuestion)

    .put('/:id/coding', question.updateCodingQuestion)

export default router;
