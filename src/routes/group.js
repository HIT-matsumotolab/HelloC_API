import { Router } from 'express';
const group = require('../controllers/group.controller');
const router = Router();

router
    .get('/', group.getGroupList)
    .get('/:id', group.getGroup)
    .get('/:id/books', group.getBooks)
    .post('/', group.createGroup)
    .post('/addUser', group.addUser)
    .post('/addBook', group.addBook)
    .post('/removeUser', group.removeUser)
    .post('/removeBook', group.removeBook)
    .delete('/:id', group.deleteGroup)
    .put('/:id', group.updateGroup)

export default router;