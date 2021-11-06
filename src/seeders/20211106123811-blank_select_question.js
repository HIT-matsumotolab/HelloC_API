'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('blank_select_questions', [
      {
        "question_id": 1,
        "explain": "サンプルです。本体はここにHTML構文？ベースの文字列が入ります",
        "language": "C",
        "base_code": "#include <stdio.h>\nint main()\n{\n\tint i, j;\n\t\n\t/* 判定フラグ */\n\tint flag;\n\t\n\t/* 素数かどうかを判定 */\n\tfor( i=2;i<=100;i++ ) {\n\t\tflag = 0;\n\t\tfor( j=2;j<i;j++ ){\n\t\t\tif( i%j==0 ) {\n\t\t\t\tflag = 1;\n\t\t\t\tbreak;\n\t\t\t}\n\t\t}\n\t\t/* 判定結果を出力 */\n\t\tif( flag==0 )\n\t\t\tprintf(\"%d \", i);\n\t}\n\t\n\treturn 0;\n}",
        "select_blank": '{"blank1": {"loc": {"10": [9,1],"12": [11,1]},"option": ["1","2","3","4"]},"blank2": {"loc": {"12": [13,3]},"option": ["j==i","j>i","j<i","j>=i"]},"blank3": {"loc": {"19": [7,7]},"option": ["1","2","3","4"]}}',
        "correct_blank": '{"blank1": "2","blank2": "j<i","blank3": "flag==0"}',
        "stdinout": '{"example1":{"in":"","out":"2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 "}}',
        "hint_type": "なし",
        "max_exec_time": "3"
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('blank_select_questions', null, {});
  }
};

