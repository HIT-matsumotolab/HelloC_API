import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class detail_logs extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    infomation_log_id: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'infomation_logs',
        key: 'infomation_log_id'
      }
    },
    turn: {
      type: DataTypes.SMALLINT,
      allowNull: false
    },
    result_type: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'results',
        key: 'result_type'
      }
    },
    answer: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    answer_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'detail_logs',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "detail_logs_pkey",
        unique: true,
        fields: [
          { name: "infomation_log_id" },
        ]
      },
    ]
  });
  }
}
