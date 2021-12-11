import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class questions extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    question_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    format: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'question_formats',
        key: 'format'
      }
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'user_id'
      }
    },
    mode: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'question_modes',
        key: 'mode'
      }
    },
    time_limit: {
      type: DataTypes.SMALLINT,
      allowNull: true
    },
    number_limit: {
      type: DataTypes.SMALLINT,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'questions',
    schema: 'public',
    timestamps: true,
    indexes: [
      {
        name: "questions_pkey",
        unique: true,
        fields: [
          { name: "question_id" },
        ]
      },
    ]
  });
  return questions;
  }
}
