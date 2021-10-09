import { Router } from 'express';
const auth = require('../controllers/auth.controller');
const router = Router();

router.post('/', auth.start);

export default router;