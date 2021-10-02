import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class judge_formats extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    judge_format: {
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
    tableName: 'judge_formats',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "judge_formats_pkey",
        unique: true,
        fields: [
          { name: "judge_format" },
        ]
      },
    ]
  });
  return judge_formats;
  }
}
