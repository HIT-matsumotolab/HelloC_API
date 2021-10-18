import { Router } from 'express';
const auth = require('../controllers/auth.controller');
const router = Router();
const { verifySignUp } = require("../middleware");

router.use(function(req, res, next) {
    res.header(
        "Access-Control-Allow-Headers",
        "x-access-token, Origin, Content-Type, Accept"
    );
    next();
})
router.post(
    '/signup',
    [
        verifySignUp.checkDuplicateMail,
        verifySignUp.checkRolesExisted
    ],
    auth.signup
);
router.post('/signin', auth.signin);

// router.post('/', auth.start);

export default router;