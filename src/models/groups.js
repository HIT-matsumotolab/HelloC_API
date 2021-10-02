import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class groups extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    group_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    summary: {
      type: DataTypes.STRING,
      allowNull: true
    },
    access_key: {
      type: DataTypes.STRING,
      allowNull: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'users',
        key: 'user_id'
      }
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'groups',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "groups_pkey",
        unique: true,
        fields: [
          { name: "group_id" },
        ]
      },
    ]
  });
  return groups;
  }
}
