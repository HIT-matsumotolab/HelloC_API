import { Router } from 'express';
const group = require('../controllers/group.controller');
const router = Router();

router.get('/', group.getGroupList);

router.get('/:id', group.getGroup);

router.post('/', group.createGroup);

router.post('/addUser', group.addUser);

router.post('/removeUser', group.removeUser);

router.delete('/:id', group.deleteGroup); 

router.put('/:id', group.updateGroup);

export default router;