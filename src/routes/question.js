import { Router } from 'express';
const question = require('../controllers/question.controller');
const router = Router();

router.get('/', question.getQuestionList)
    .get('/:id', question.getQuestion)
    .get('/:id/info', question.getQuestionInfo)
    .post('/', question.createQuestion)
    .post('/api/questions/:id/blank', question.createBlankSelectQuestion)
    .delete('/:id', question.deleteQuestion)
    .put('/:id', question.updateQuestion)


export default router;