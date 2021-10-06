require('dotenv/config');
import { Sequelize } from "sequelize";

const sequelize = new Sequelize(
  process.env.POSTGRES_DB,
  process.env.POSTGRES_USER,
  process.env.POSTGRES_PASS,
  {
    host: process.env.POSTGRES_HOST,
    port: process.env.POSTGRES_PORT,
    dialect: 'postgres'
  }
);
(async () => {
  await sequelize.authenticate();
  console.log("authenticated postgres");
})();
module.exports = sequelize;