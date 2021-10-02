import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class blank_question_hints extends Model {
  static init(sequelize, DataTypes) {
  super.init({
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
    tableName: 'blank_question_hints',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "blank_question_hints_pkey",
        unique: true,
        fields: [
          { name: "hint_type" },
        ]
      },
    ]
  });
  return blank_question_hints;
  }
}
