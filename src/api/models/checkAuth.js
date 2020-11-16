//check:ログイン認証済み
exports.Authenticated = function (req, res, next) {
    if (req.isAuthenticated()) {
        return next()
    }
    res.json({
        err_message: "認証してください"
    });
}
//check:ログインユーザーの役割権限（教師、学生）
exports.roleAuthority = function (req, res, next) {
    if (req.user.authority == 1) {
        return next()
    }
    res.json({
        err_message: "教師権限がありません"
    });
}
//check:ログインユーザーのアクセス権限
exports.checkUserID = function (req, res, next) {
    console.log(req.user.name)
    if (req.user.name == req.query.user) {
        return next()
    }
    res.json({
        err_message: "ログインしたユーザと違います", session_user: req.user.name
    });

}