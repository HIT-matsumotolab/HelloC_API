import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class question_formats extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    format: {
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
    tableName: 'question_formats',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "question_formats_pkey",
        unique: true,
        fields: [
          { name: "format" },
        ]
      },
    ]
  });
  return question_formats;
  }
}
