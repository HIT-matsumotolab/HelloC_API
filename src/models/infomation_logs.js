import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class infomation_logs extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    infomation_log_id: {
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
    group_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    question_version: {
      type: DataTypes.STRING,
      allowNull: false
    },
    elapsed_time: {
      type: DataTypes.SMALLINT,
      allowNull: false
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'infomation_logs',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "infomation_logs_pkey",
        unique: true,
        fields: [
          { name: "infomation_log_id" },
        ]
      },
    ]
  });
  return infomation_logs;
  }
}
