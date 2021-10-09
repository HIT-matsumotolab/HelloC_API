import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class collection extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    group_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'groups',
        key: 'group_id'
      },
      unique: "collection_group_id_book_id_key"
    },
    book_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'books',
        key: 'book_id'
      },
      unique: "collection_group_id_book_id_key"
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'collection',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "collection_group_id_book_id_key",
        unique: true,
        fields: [
          { name: "group_id" },
          { name: "book_id" },
        ]
      },
    ]
  });
  return collection;
  }
}
