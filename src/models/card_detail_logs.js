import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class card_detail_logs extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    infomation_log_id: {
      type: DataTypes.BIGINT,
      allowNull: false,
      references: {
        model: 'infomation_logs',
        key: 'infomation_log_id'
      }
    },
    card_detail_log_id: {
      autoIncrement: true,
      type: DataTypes.BIGINT,
      allowNull: false,
      primaryKey: true
    },
    select_history: {
      type: DataTypes.JSONB,
      allowNull: true
    },
    trial: {
      type: DataTypes.SMALLINT,
      allowNull: true
    },
    result_type: {
      type: DataTypes.STRING,
      allowNull: true,
      references: {
        model: 'results',
        key: 'result_type'
      }
    },
    answer: {
      type: DataTypes.JSONB,
      allowNull: true
    },
    answer_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'card_detail_logs',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "card_detail_logs_pkey",
        unique: true,
        fields: [
          { name: "card_detail_log_id" },
        ]
      },
    ]
  });
  return card_detail_logs;
  }
}
