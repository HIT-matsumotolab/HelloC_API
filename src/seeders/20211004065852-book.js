'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('books', [
      {
        "name":"サンプルG１",
        "summary":"サンプルグループ１です",
        "access_key":"password123",
        "user_id":1
      },
      {
        "name":"サンプルG2",
        "summary":"サンプルグループ2です",
        "access_key":"password123",
        "user_id":2
      },
      {
        "name":"サンプルG3",
        "summary":"サンプルグループ3です",
        "access_key":"password123",
        "user_id":3
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('books', null, {});
  }
};
