const LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');
const mysqlconfig = require('./mysqlConnection');
const mysql = require('mysql2/promise');

async function SQL(statement, placeholder) {
  const connection = await mysql.createConnection(mysqlconfig);
  try {
    const [rows, fields] = await connection.query(statement, placeholder);
    return rows[0];
  } catch (e) {
    console.log(e);
  } finally {
    connection.end();
  }
};

function initialize(passport) {
  const authenticateUser = async (name, password, done) => {
    const statement = "select user_id,name,password,authority from users where name=?";
    const sqlResult = await SQL(statement, name);
    if (sqlResult == null) {
      return done(null, false, { message: 'No user with that email' });
    }
    const user = {
      id: sqlResult.user_id,
      name: sqlResult.name,
      password: sqlResult.password,
      authority: sqlResult.authority
    };

    try {
      if (await bcrypt.compare(password, user.password)) {
        return done(null, user);
      } else {
        return done(null, false, { message: 'Password incorrect' });
      }
    } catch (e) {
      return done(e);
    }
  }

  passport.use(new LocalStrategy({ usernameField: 'name' }, authenticateUser));
  passport.serializeUser((user, done) => done(null, user));
  passport.deserializeUser((user, done) => done(null, user));
}

module.exports = initialize;