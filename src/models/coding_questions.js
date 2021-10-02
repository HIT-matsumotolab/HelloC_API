import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class coding_questions extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'questions',
        key: 'question_id'
      }
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    explain: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    language: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'programing_languages',
        key: 'language'
      }
    },
    base_code: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    model_answer: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    judge_format: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'judge_formats',
        key: 'judge_format'
      }
    },
    stdinout: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    mandatory_words: {
      type: DataTypes.STRING,
      allowNull: true
    },
    max_exec_time: {
      type: DataTypes.SMALLINT,
      allowNull: false,
      defaultValue: 2
    },
    mini_lines: {
      type: DataTypes.SMALLINT,
      allowNull: false,
      defaultValue: 1
    }
  }, {
    sequelize,
    tableName: 'coding_questions',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "coding_questions_pkey",
        unique: true,
        fields: [
          { name: "question_id" },
        ]
      },
    ]
  });
  return coding_questions;
  }
}
