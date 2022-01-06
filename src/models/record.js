import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class record extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    book_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'books',
        key: 'book_id'
      },
      unique: "record_book_id_question_id_key"
    },
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'questions',
        key: 'question_id'
      },
      unique: "record_book_id_question_id_key"
    },
    open_time: {
      type: DataTypes.DATE,
      allowNull: true
    },
    close_time: {
      type: DataTypes.DATE,
      allowNull: true
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    sequelize,
    tableName: 'record',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "record_book_id_question_id_key",
        unique: true,
        primaryKey: true,
        fields: [
          { name: "book_id" },
          { name: "question_id" },
        ]
      },
    ]
  });
  record.removeAttribute('id');
  return record;
  }
}
