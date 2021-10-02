import { Router } from 'express';
const user = require('../controllers/user.controller');
const router = Router();

router.get('/', user.getUserList);

router.get('/:id', user.getUser);

router.post('/', user.createUser);

router.delete('/:id', user.deleteUser);

router.put('/:id', user.updateUser);

export default router;