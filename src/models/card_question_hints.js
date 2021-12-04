import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class card_question_hints extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    hint_type: {
      type: DataTypes.STRING,
      allowNull: false,
      primaryKey: true
    },
    summary: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'card_question_hints',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "card_question_pkey",
        unique: true,
        fields: [
          { name: "hint_type" },
        ]
      },
    ]
  });
  }
}
