'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('questions', [
      {
        name: 'test01',
        format: 'blank_select',
        user_id: '1',
        mode: '演習モード',
        time_limit: 1000,
        number_limit: 500
      },
      {
        name: 'test02',
        format: 'coding',
        user_id: '1',
        mode: '演習モード',
        time_limit: 1000,
        number_limit: 500
      },
      {
        name: 'test02',
        format: 'blank_select',
        user_id: '1',
        mode: 'テストモード',
        time_limit: 1000,
        number_limit: 500
      },
      {
        name: 'test03',
        format: 'coding',
        user_id: '1',
        mode: 'テストモード',
        time_limit: 1000,
        number_limit: 500
      },
      {
        name: 'test04',
        format: 'blank_select',
        user_id: '1',
        mode: 'リアルタイムモード',
        time_limit: 1000,
        number_limit: 500
      },
      {
        name: 'test05',
        format: 'coding',
        user_id: '1',
        mode: 'リアルタイムモード',
        time_limit: 1000,
        number_limit: 500
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('questions', null, {});
  }
};

