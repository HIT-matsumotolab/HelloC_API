import { Router } from 'express';
const book = require('../controllers/book.controller');
const router = Router();

router.get('/', book.getBookList)
    .get('/:id', book.getBook)
    .get('/:id/questions', book.getQuestions)
    .get('/:id/records', book.getRecord)
    .post('/', book.createBook)
    .post('/addRecord', book.addRecord)
    .delete('/removeRecord', book.removeRecord)
    .delete('/:id', book.deleteBook) 
    .put('/:id', book.updateBook);

export default router;