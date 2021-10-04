'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('users', [
      {
        name: 'TEST1',
        mail: 'test1@example.com',
        password_hash: 'password',
        role: '学習者',
        created_at: new Date()
      },
      {
        name: 'TEST2',
        mail: 'test2@example.com',
        password_hash: 'password',
        role: '学習者',
        created_at: new Date()
      },
      {
        name: 'TEST3',
        mail: 'test3@example.com',
        password_hash: 'password',
        role: '教授者',
        created_at: new Date()
      }
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('users', null, {});
  }
};
