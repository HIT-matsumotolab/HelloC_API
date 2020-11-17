const express = require('express');
const router = express.Router();

// GET  http://localhost:3000/api/test/
router.get('/', function (req, res) {
    console.log("welcome helloC_API");
    res.json({
        message: "welcome helloC_API"
    });
});

router.post('/', function (req, res) {
    // リクエストボディを出力
    console.log(req.body);
    res.json({
        message: "json送信されました",
    });
});

module.exports = router;

// ルーティングする場合
// const router = express.Router();
// router.use('/ルート名', require('./ファイル名'));
