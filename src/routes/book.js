import { Router } from 'express';
const book = require('../controllers/book.controller');
const router = Router();

router.get('/', book.getBookList)
    .get('/:id', book.getBook)
    .get('/:id/questions', book.getQuestions)
    .post('/', book.createBook)
    .post('/addRecord', book.addRecord)
    .post('/removeRecord', book.removeRecord)
    .delete('/:id', book.deleteBook) 
    .put('/:id', book.updateBook);

export default router;