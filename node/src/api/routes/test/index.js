const express = require('express');
const router = express.Router();

// GET  http://localhost:3000/api/test/
router.get('/', function (req, res) {
    res.json({
        message: "welcome helloC_API"
    });
});

module.exports = router;

// ルーティングする場合
// const router = express.Router();
// router.use('/ルート名', require('./ファイル名'));
