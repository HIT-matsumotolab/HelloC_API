'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('books', [
      {
        "name":"TEST1",
        "summary":"サンプル教材",
        "access_key":"pass",
        "user_id":1
      },
      {
        "name":"TEST2",
        "summary":"サンプル教材",
        "access_key":"access",
        "user_id":2
      },
      {
        "name":"TEST3",
        "summary":"サンプル教材",
        "access_key":"key",
        "user_id":1
      }
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('books', null, {});
  }
};
