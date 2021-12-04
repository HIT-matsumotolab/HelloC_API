import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class archive_questions extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    archive_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    mirror_question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'mirror_questions',
        key: 'mirror_question_id'
      }
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
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'archive_questions',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "archive_questions_pkey",
        unique: true,
        fields: [
          { name: "archive_id" },
        ]
      },
    ]
  });
  }
}
