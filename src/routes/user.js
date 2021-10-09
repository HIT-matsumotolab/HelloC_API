import { Router } from 'express';
const user = require('../controllers/user.controller');
const router = Router();

router
    .get('/', user.getUserList)
    .get('/:id/groups',user.getGroups)
    .get('/:id', user.getUser)
    .post('/', user.createUser)
    .delete('/:id', user.deleteUser)
    .put('/:id', user.updateUser);

export default router;