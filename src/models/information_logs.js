import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class information_logs extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    information_log_id: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'user_id'
      }
    },
    question_id: {
      type: DataTypes.INTEGER,
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
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'information_logs',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "information_logs_pkey",
        unique: true,
        fields: [
          { name: "information_log_id" },
        ]
      },
    ]
  });
  return information_logs;
  }
}
