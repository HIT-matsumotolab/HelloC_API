import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class membership extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'user_id'
      },
      unique: "membership_user_id_group_id_key"
    },
    group_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'groups',
        key: 'group_id'
      },
      unique: "membership_user_id_group_id_key"
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'membership',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "membership_user_id_group_id_key",
        unique: true,
        fields: [
          { name: "user_id" },
          { name: "group_id" },
        ]
      },
    ]
  });
  }
}
