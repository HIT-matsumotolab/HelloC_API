require('dotenv').config();

const express = require('express')
const app = express()
const bcrypt = require('bcrypt')
const passport = require('passport')
const flash = require('express-flash')
const session = require('express-session')
const methodOverride = require('method-override')
const bodyParser = require('body-parser');

const mysqlconfig = require('./models/mysqlConnection')
const mysql = require('mysql2');

const initializePassport = require('./models/passport-config')
initializePassport(passport)

const checkAuth = require('./models/checkAuth')

app.use(express.urlencoded({ extended: false }))
app.use(flash())
app.use(session({
  secret: 'helloC_API',
  resave: false,
  saveUninitialized: false
}))
app.use(passport.initialize())
app.use(passport.session())
app.use(methodOverride('_method'))

app.use(function (req, res, next) {
  const allowedOrigins = process.env.IP_ADDRESS;
  const origin = req.headers.origin;
  if (allowedOrigins.indexOf(origin) > -1) {
    res.setHeader('Access-Control-Allow-Origin', origin);
  }
  res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});

app.use(bodyParser.json());
//curl -X POST -d "name=test" -d "password=test" http://localhost:3000/login
app.post('/login', function (req, res, next) {

  passport.authenticate('local', function (err, user, info) {
    if (err) { return next(err); }
    if (!user) {
      return res.json({
        err_message: "ユーザーが存在しませんorパスワードが違います"
      });;
    }
    req.logIn(user, function (err) {
      if (err) { return next(err); }
      return res.json({
        succsess: "認証完了", user: user.name, authority: user.authority
      });
    });
  })(req, res, next);

});

app.delete('/logout', (req, res) => {
  req.logOut()
  res.json({
    message: "ログアウト"
  });
})


app.use('/api/test/', require('./routes/test'));
app.use('/api/basic/',/*checkAuth.Authenticated,*/ require('./routes/basic'));
app.use('/api/manager/',checkAuth.Authenticated, require('./routes/manager'));
//app.use('/api/rtv/', checkAuth.Authenticated,require('./routes/rtv'));


const port = process.env.PORT || 3000;
app.listen(port);
console.log('listen on port ' + port);