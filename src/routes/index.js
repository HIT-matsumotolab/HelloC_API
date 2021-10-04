import { Router } from 'express';

import user from './user';
import group from './group';
import book from './book';
import question from './question';
import log from './log';

const router = Router();

router.use('/users', user);
router.use('/groups', group);
router.use('/books', book);
router.use('/questions', question);
// router.use('/log', log);

export default router;
