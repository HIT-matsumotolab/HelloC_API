import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class books extends Model {
  static init(sequelize, DataTypes) {
  return super.init({
    book_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: "books_name_user_id_key"
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
      },
      unique: "books_name_user_id_key"
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'books',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "books_name_user_id_key",
        unique: true,
        fields: [
          { name: "name" },
          { name: "user_id" },
        ]
      },
      {
        name: "books_pkey",
        unique: true,
        fields: [
          { name: "book_id" },
        ]
      },
    ]
  });
  }
}
