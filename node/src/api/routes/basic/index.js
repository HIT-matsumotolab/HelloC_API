const express = require('express');
const router = express.Router();

router.use('/log', require('./log'));
router.use('/test', require('./test'));

module.exports = router;