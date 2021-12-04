import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class programing_languages extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    language: {
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
    tableName: 'programing_languages',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "programing_languages_pkey",
        unique: true,
        fields: [
          { name: "language" },
        ]
      },
    ]
  });
  }
}
