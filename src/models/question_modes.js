import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class question_modes extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    mode: {
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
    tableName: 'question_modes',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "question_mode_pkey",
        unique: true,
        fields: [
          { name: "mode" },
        ]
      },
    ]
  });
  return question_modes;
  }
}
