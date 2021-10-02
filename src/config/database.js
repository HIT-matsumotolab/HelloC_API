require('dotenv/config');
import {Sequelize} from "sequelize";

module.exports=new Sequelize(
  process.env.POSTGRES_DB, 
  process.env.POSTGRES_USER, 
  process.env.POSTGRES_PASS, 
  {dialect: 'postgres' }
);