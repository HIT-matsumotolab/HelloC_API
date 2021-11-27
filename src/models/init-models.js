import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _archive_questions from  "./archive_questions.js";
import _blank_question_hints from  "./blank_question_hints.js";
import _blank_select_archives from  "./blank_select_archives.js";
import _blank_select_question_posing from  "./blank_select_question_posing.js";
import _blank_select_questions from  "./blank_select_questions.js";
import _books from  "./books.js";
import _card_question_hints from  "./card_question_hints.js";
import _card_question_posing from  "./card_question_posing.js";
import _coding_archives from  "./coding_archives.js";
import _coding_questions from  "./coding_questions.js";
import _collection from  "./collection.js";
import _detail_logs from  "./detail_logs.js";
import _groups from  "./groups.js";
import _infomation_logs from  "./infomation_logs.js";
import _judge_formats from  "./judge_formats.js";
import _membership from  "./membership.js";
import _mirror_questions from  "./mirror_questions.js";
import _programing_languages from  "./programing_languages.js";
import _question_formats from  "./question_formats.js";
import _question_modes from  "./question_modes.js";
import _questions from  "./questions.js";
import _record from  "./record.js";
import _results from  "./results.js";
import _roles from  "./roles.js";
import _users from  "./users.js";

export const initModels = (sequelize) => {
  const archive_questions = _archive_questions.init(sequelize, DataTypes);
  const blank_question_hints = _blank_question_hints.init(sequelize, DataTypes);
  const blank_select_archives = _blank_select_archives.init(sequelize, DataTypes);
  const blank_select_question_posing = _blank_select_question_posing.init(sequelize, DataTypes);
  const blank_select_questions = _blank_select_questions.init(sequelize, DataTypes);
  const books = _books.init(sequelize, DataTypes);
  const card_question_hints = _card_question_hints.init(sequelize, DataTypes);
  const card_question_posing = _card_question_posing.init(sequelize, DataTypes);
  const coding_archives = _coding_archives.init(sequelize, DataTypes);
  const coding_questions = _coding_questions.init(sequelize, DataTypes);
  const collection = _collection.init(sequelize, DataTypes);
  const detail_logs = _detail_logs.init(sequelize, DataTypes);
  const groups = _groups.init(sequelize, DataTypes);
  const infomation_logs = _infomation_logs.init(sequelize, DataTypes);
  const judge_formats = _judge_formats.init(sequelize, DataTypes);
  const membership = _membership.init(sequelize, DataTypes);
  const mirror_questions = _mirror_questions.init(sequelize, DataTypes);
  const programing_languages = _programing_languages.init(sequelize, DataTypes);
  const question_formats = _question_formats.init(sequelize, DataTypes);
  const question_modes = _question_modes.init(sequelize, DataTypes);
  const questions = _questions.init(sequelize, DataTypes);
  const record = _record.init(sequelize, DataTypes);
  const results = _results.init(sequelize, DataTypes);
  const roles = _roles.init(sequelize, DataTypes);
  const users = _users.init(sequelize, DataTypes);

  blank_select_archives.belongsTo(blank_question_hints, { as: "hint_type_blank_question_hint", foreignKey: "hint_type"});
  blank_question_hints.hasMany(blank_select_archives, { as: "blank_select_archives", foreignKey: "hint_type"});
  blank_select_questions.belongsTo(blank_question_hints, { as: "hint_type_blank_question_hint", foreignKey: "hint_type"});
  blank_question_hints.hasMany(blank_select_questions, { as: "blank_select_questions", foreignKey: "hint_type"});
  collection.belongsTo(books, { as: "book", foreignKey: "book_id"});
  books.hasMany(collection, { as: "collections", foreignKey: "book_id"});
  record.belongsTo(books, { as: "book", foreignKey: "book_id"});
  books.hasMany(record, { as: "records", foreignKey: "book_id"});
  card_question_posing.belongsTo(card_question_hints, { as: "hint_type_card_question_hint", foreignKey: "hint_type"});
  card_question_hints.hasMany(card_question_posing, { as: "card_question_posings", foreignKey: "hint_type"});
  collection.belongsTo(groups, { as: "group", foreignKey: "group_id"});
  groups.hasMany(collection, { as: "collections", foreignKey: "group_id"});
  membership.belongsTo(groups, { as: "group", foreignKey: "group_id"});
  groups.hasMany(membership, { as: "memberships", foreignKey: "group_id"});
  detail_logs.belongsTo(infomation_logs, { as: "infomation_log", foreignKey: "infomation_log_id"});
  infomation_logs.hasOne(detail_logs, { as: "detail_log", foreignKey: "infomation_log_id"});
  coding_archives.belongsTo(judge_formats, { as: "judge_format_judge_format", foreignKey: "judge_format"});
  judge_formats.hasMany(coding_archives, { as: "coding_archives", foreignKey: "judge_format"});
  coding_questions.belongsTo(judge_formats, { as: "judge_format_judge_format", foreignKey: "judge_format"});
  judge_formats.hasMany(coding_questions, { as: "coding_questions", foreignKey: "judge_format"});
  archive_questions.belongsTo(mirror_questions, { as: "mirror_question", foreignKey: "mirror_question_id"});
  mirror_questions.hasMany(archive_questions, { as: "archive_questions", foreignKey: "mirror_question_id"});
  blank_select_archives.belongsTo(mirror_questions, { as: "archive", foreignKey: "archives_id"});
  mirror_questions.hasOne(blank_select_archives, { as: "blank_select_archive", foreignKey: "archives_id"});
  coding_archives.belongsTo(mirror_questions, { as: "archive", foreignKey: "archives_id"});
  mirror_questions.hasOne(coding_archives, { as: "coding_archive", foreignKey: "archives_id"});
  blank_select_archives.belongsTo(programing_languages, { as: "language_programing_language", foreignKey: "language"});
  programing_languages.hasMany(blank_select_archives, { as: "blank_select_archives", foreignKey: "language"});
  blank_select_questions.belongsTo(programing_languages, { as: "language_programing_language", foreignKey: "language"});
  programing_languages.hasMany(blank_select_questions, { as: "blank_select_questions", foreignKey: "language"});
  card_question_posing.belongsTo(programing_languages, { as: "language_programing_language", foreignKey: "language"});
  programing_languages.hasMany(card_question_posing, { as: "card_question_posings", foreignKey: "language"});
  coding_archives.belongsTo(programing_languages, { as: "language_programing_language", foreignKey: "language"});
  programing_languages.hasMany(coding_archives, { as: "coding_archives", foreignKey: "language"});
  coding_questions.belongsTo(programing_languages, { as: "language_programing_language", foreignKey: "language"});
  programing_languages.hasMany(coding_questions, { as: "coding_questions", foreignKey: "language"});
  archive_questions.belongsTo(question_formats, { as: "format_question_format", foreignKey: "format"});
  question_formats.hasMany(archive_questions, { as: "archive_questions", foreignKey: "format"});
  questions.belongsTo(question_formats, { as: "format_question_format", foreignKey: "format"});
  question_formats.hasMany(questions, { as: "questions", foreignKey: "format"});
  archive_questions.belongsTo(question_modes, { as: "mode_question_mode", foreignKey: "mode"});
  question_modes.hasMany(archive_questions, { as: "archive_questions", foreignKey: "mode"});
  questions.belongsTo(question_modes, { as: "mode_question_mode", foreignKey: "mode"});
  question_modes.hasMany(questions, { as: "questions", foreignKey: "mode"});
  blank_select_question_posing.belongsTo(questions, { as: "question", foreignKey: "question_id"});
  questions.hasMany(blank_select_question_posing, { as: "blank_select_question_posings", foreignKey: "question_id"});
  blank_select_questions.belongsTo(questions, { as: "question", foreignKey: "question_id"});
  questions.hasOne(blank_select_questions, { as: "blank_select_question", foreignKey: "question_id"});
  card_question_posing.belongsTo(questions, { as: "question", foreignKey: "question_id"});
  questions.hasOne(card_question_posing, { as: "card_question_posing", foreignKey: "question_id"});
  coding_questions.belongsTo(questions, { as: "question", foreignKey: "question_id"});
  questions.hasOne(coding_questions, { as: "coding_question", foreignKey: "question_id"});
  record.belongsTo(questions, { as: "question", foreignKey: "question_id"});
  questions.hasMany(record, { as: "records", foreignKey: "question_id"});
  detail_logs.belongsTo(results, { as: "result_type_result", foreignKey: "result_type"});
  results.hasMany(detail_logs, { as: "detail_logs", foreignKey: "result_type"});
  users.belongsTo(roles, { as: "role_role", foreignKey: "role"});
  roles.hasMany(users, { as: "users", foreignKey: "role"});
  archive_questions.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(archive_questions, { as: "archive_questions", foreignKey: "user_id"});
  books.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(books, { as: "books", foreignKey: "user_id"});
  groups.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(groups, { as: "groups", foreignKey: "user_id"});
  infomation_logs.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(infomation_logs, { as: "infomation_logs", foreignKey: "user_id"});
  membership.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(membership, { as: "memberships", foreignKey: "user_id"});
  questions.belongsTo(users, { as: "user", foreignKey: "user_id"});
  users.hasMany(questions, { as: "questions", foreignKey: "user_id"});

  return {
    archive_questions,
    blank_question_hints,
    blank_select_archives,
    blank_select_question_posing,
    blank_select_questions,
    books,
    card_question_hints,
    card_question_posing,
    coding_archives,
    coding_questions,
    collection,
    detail_logs,
    groups,
    infomation_logs,
    judge_formats,
    membership,
    mirror_questions,
    programing_languages,
    question_formats,
    question_modes,
    questions,
    record,
    results,
    roles,
    users,
  };
}
