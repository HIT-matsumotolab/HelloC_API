import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class card_question_posing extends Model {
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
    hint_type: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'card_question_hints',
        key: 'hint_type'
      }
    }
  }, {
    sequelize,
    tableName: 'card_question_posing',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "card_question_posing_pkey",
        unique: true,
        fields: [
          { name: "question_id" },
        ]
      },
    ]
  });
  return card_question_posing;
  }
}
