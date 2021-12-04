import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class blank_select_questions extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'questions',
        key: 'question_id'
      }
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
      allowNull: false
    },
    stdinout: {
      type: DataTypes.JSONB,
      allowNull: true
    },
    max_exec_time: {
      type: DataTypes.SMALLINT,
      allowNull: false,
      defaultValue: 2
    },
    select_blank: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    correct_blank: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    hint_type: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'blank_question_hints',
        key: 'hint_type'
      }
    }
  }, {
    sequelize,
    tableName: 'blank_select_questions',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "blank_select_questions_pkey",
        unique: true,
        fields: [
          { name: "question_id" },
        ]
      },
    ]
  });
  }
}
