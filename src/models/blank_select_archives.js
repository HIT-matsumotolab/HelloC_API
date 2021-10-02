import _sequelize from 'sequelize';
const { Model, Sequelize } = _sequelize;

export default class blank_select_archives extends Model {
  static init(sequelize, DataTypes) {
  super.init({
    archives_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'mirror_questions',
        key: 'mirror_question_id'
      }
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    explain: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    language: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'programing_languages',
        key: 'language'
      }
    },
    base_code: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    select_blank: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    correct_blank: {
      type: DataTypes.JSONB,
      allowNull: false
    },
    stdinout: {
      type: DataTypes.JSONB,
      allowNull: true
    },
    hint_type: {
      type: DataTypes.STRING,
      allowNull: false,
      references: {
        model: 'blank_question_hints',
        key: 'hint_type'
      }
    },
    max_exec_time: {
      type: DataTypes.SMALLINT,
      allowNull: false,
      defaultValue: 2
    }
  }, {
    sequelize,
    tableName: 'blank_select_archives',
    schema: 'public',
    timestamps: false,
    indexes: [
      {
        name: "blank_select_archives_pkey",
        unique: true,
        fields: [
          { name: "archives_id" },
        ]
      },
    ]
  });
  return blank_select_archives;
  }
}
