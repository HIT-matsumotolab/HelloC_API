import { Router } from 'express';
const question = require('../controllers/question.controller');
const router = Router();

router.get('/', question.getQuestionList)
    .get('/:id', question.getQuestion)
    .post('/', question.createQuestion)
    .delete('/:id', question.deleteQuestion)
    .put('/:id', question.updateQuestion);

export default router;