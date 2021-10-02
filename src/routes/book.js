import { Router } from 'express';
const book = require('../controllers/book.controller');
const router = Router();

router.get('/', book.getBookList);

router.get('/:id', book.getBook);

router.post('/', book.createBook);

router.delete('/:id', book.deleteBook); 

router.put('/:id', book.updateBook);

export default router;