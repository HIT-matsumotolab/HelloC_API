const express = require('express');
const router = express.Router();

router.use('/class', require('./class'));

module.exports = router;

// ルーティングする場合
// 
