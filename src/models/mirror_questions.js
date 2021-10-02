import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class mirror_questions extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    mirror_question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    }
  }, {
    sequelize,
    tableName: 'mirror_questions',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "mirror_questions_pkey",
        unique: true,
        fields: [
          { name: "mirror_question_id" },
        ]
      },
    ]
  });
  return mirror_questions;
  }
}
