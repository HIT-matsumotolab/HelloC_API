import { Router } from 'express';
const auth = require('../controllers/auth.controller');
const router = Router();
const { verifySignUp, authJwt } = require("../middleware");

router.use(function(req, res, next) {
    // res.header(
        // "Access-Control-Allow-Headers",
        // "Access-Control-Allow-Origin", "*",
        // "x-access-token, Origin, Content-Type, Accept"
    // );
    next();
})
.post(
    '/signup',
    [
        verifySignUp.checkDuplicateMail,
        verifySignUp.checkRolesExisted,
        auth.signup
    ],
)
.get(
    '/user',
    [
        authJwt.verifyToken,
        authJwt.isUser,
        auth.userBoard
    ],
)
.get(
    '/admin',
    [
        authJwt.verifyToken,
        authJwt.isAdmin,
        auth.adminBoard
    ],
)
.post('/signin', auth.signin);

// router.post('/', auth.start);

export default router;