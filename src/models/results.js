import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class results extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    result_type: {
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
    tableName: 'results',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "results_pkey",
        unique: true,
        fields: [
          { name: "result_type" },
        ]
      },
    ]
  });
  return results;
  }
}
