import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class blank_select_question_posing extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'card_question_posing',
        key: 'question_id'
      }
    },
    question_code: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    card: {
      type: DataTypes.JSONB,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'blank_select_question_posing',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "blank_select_question_posing_pkey",
        unique: true,
        fields: [
          { name: "question_id" },
        ]
      },
    ]
  });
  return blank_select_question_posing;
  }
}
