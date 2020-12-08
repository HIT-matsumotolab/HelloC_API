const express = require('express');
const router = express.Router();

router.use('/classroom', require('./classroom'));
router.use('/question', require('./question'));
router.use('/register', require('./register'));

module.exports = router;