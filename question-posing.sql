/**
 * USAGE 
 * psql -f initial-helloc-db.sql -Upostgres
 */

DROP DATABASE IF EXISTS helloc;
CREATE DATABASE helloc OWNER=postgres;

\connect helloc;

DROP TABLE IF EXISTS roles;
CREATE TABLE IF NOT EXISTS roles(
    role    varchar NOT NULL,
    summary varchar NOT NULL,
    PRIMARY KEY(role)
);

INSERT INTO roles(role,summary) VALUES ('教授者','問題の登録、学習者の進捗管理ができる');
INSERT INTO roles(role,summary) VALUES ('学習者','問題の取得、学習結果の送信、自身の進捗管理ができる');
INSERT INTO roles(role,summary) VALUES ('学習終了者','未使用の学習権限をもった（ログ管理のため）');
INSERT INTO roles(role,summary) VALUES ('問題作成者','問題作成のみ可能、外部からもってきた問題はこのユーザーで問題登録する');

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
    user_id         serial,
    name            varchar NOT NULL,
    mail            varchar NOT NULL UNIQUE,
    password_hash   varchar NOT NULL,
    role            varchar NOT NULL,
    created_at      timestamp NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT users_pkey PRIMARY KEY(user_id),
    CONSTRAINT users_role_fkey FOREIGN KEY(role)
        REFERENCES roles(role) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS groups;
CREATE TABLE IF NOT EXISTS groups(
    group_id    serial,
    name        varchar NOT NULL,
    summary     varchar,
    access_key  varchar,
    user_id     integer NOT NULL,
    created_at  timestamp NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT groups_pkey PRIMARY KEY(group_id),
    CONSTRAINT groups_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS membership;
CREATE TABLE IF NOT EXISTS membership(
    user_id     integer     NOT NULL,
    group_id    integer     NOT NULL,
    created_at  timestamp   NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    UNIQUE (user_id,group_id),
    CONSTRAINT membership_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT membership_group_id_fkey FOREIGN KEY(group_id)
        REFERENCES groups(group_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books(
    book_id     serial,
    name        varchar NOT NULL,
    summary     varchar,
    access_key  varchar,
    user_id     integer NOT NULL,
    created_at  timestamp NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    UNIQUE (name,user_id),
    CONSTRAINT books_pkey PRIMARY KEY(book_id),
    CONSTRAINT books_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS collection;
CREATE TABLE IF NOT EXISTS collection(
    group_id    integer     NOT NULL,
    book_id     integer     NOT NULL,
    created_at  timestamp   NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    UNIQUE (group_id,book_id),
    CONSTRAINT collection_group_id_fkey FOREIGN KEY(group_id)
        REFERENCES groups(group_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT collection_book_id_fkey FOREIGN KEY(book_id)
        REFERENCES books(book_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS infomation_logs;
CREATE TABLE IF NOT EXISTS infomation_logs(
    infomation_log_id   bigserial,
    user_id             integer NOT NULL,
    group_id            integer NOT NULL,
    question_id         integer NOT NULL,
    question_version    varchar NOT NULL,
    elapsed_time        smallint NOT NULL,
    created_at          timestamp NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT infomation_logs_pkey PRIMARY KEY(infomation_log_id),
    CONSTRAINT infomation_logs_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS results;
CREATE TABLE IF NOT EXISTS results(
    result_type     varchar NOT NULL,
    summary         varchar NOT NULL,
    CONSTRAINT results_pkey PRIMARY KEY(result_type)
);

INSERT INTO results(result_type,summary) VALUES ('正解','正解です');
INSERT INTO results(result_type,summary) VALUES ('コンパイルエラー','文法が間違ってます');
INSERT INTO results(result_type,summary) VALUES ('模範解答不一致','実行結果が違います');

DROP TABLE IF EXISTS detail_logs;
CREATE TABLE IF NOT EXISTS detail_logs(
    infomation_log_id   bigserial,
    turn                smallint    NOT NULL,
    result_type         varchar     NOT NULL,
    answer              jsonb       NOT NULL,
    answer_at           timestamp   NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT detail_logs_pkey PRIMARY KEY(infomation_log_id),
    CONSTRAINT detail_logs_infomation_log_id_fkey FOREIGN KEY(infomation_log_id)
        REFERENCES infomation_logs(infomation_log_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT detail_logs_result_type_fkey FOREIGN KEY(result_type)
        REFERENCES results(result_type) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS question_formats;
CREATE TABLE IF NOT EXISTS question_formats(
    format      varchar NOT NULL,
    summary     varchar NOT NULL,
    CONSTRAINT question_formats_pkey PRIMARY KEY(format)
);

INSERT INTO question_formats(format,summary) VALUES ('blank_select','空欄補填選択方式。複数ある選択肢の中から問題を選んで解答する');
INSERT INTO question_formats(format,summary) VALUES ('coding','記述方式。問題文をもとに自らコーディングして解答する');
INSERT INTO question_formats(format,summary) VALUES ('question_posing','空欄補填の作問方式。ダミーを含む選択肢からカードを選んでコードを完成させる');

DROP TABLE IF EXISTS question_modes;
CREATE TABLE IF NOT EXISTS question_modes(
    mode        varchar NOT NULL,
    summary     varchar NOT NULL,
    CONSTRAINT question_mode_pkey PRIMARY KEY(mode)
);

INSERT INTO question_modes(mode,summary) VALUES ('演習モード','答えを送信する前に正誤判定が可能');
INSERT INTO question_modes(mode,summary) VALUES ('テストモード','答え送信のみ、一発勝負');
INSERT INTO question_modes(mode,summary) VALUES ('リアルタイムモード','正誤判定をするが、一回ごとに送信して、教授者が解答状況を見ることが可能');

DROP TABLE IF EXISTS questions;
CREATE TABLE IF NOT EXISTS questions(
    question_id     serial,
    name            varchar NOT NULL,
    format          varchar  NOT NULL,
    user_id         integer NOT NULL,
    mode            varchar NOT NULL,
    time_limit    smallint,
    number_limit  smallint,
    created_at      timestamp NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT questions_pkey PRIMARY KEY(question_id),
    CONSTRAINT question_formats_fkey FOREIGN KEY(format)
        REFERENCES question_formats(format) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT questions_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT question_modes_fkey FOREIGN KEY(mode)
        REFERENCES question_modes(mode) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS record;
CREATE TABLE IF NOT EXISTS record(
    book_id     integer     NOT NULL,
    question_id integer     NOT NULL,
    open_time   timestamp,
    close_time   timestamp,
    created_at  timestamp   NOT NULL NOT NULL default CURRENT_TIMESTAMP,
    UNIQUE (book_id,question_id),
    CONSTRAINT record_book_id_fkey FOREIGN KEY(book_id)
        REFERENCES books(book_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT record_question_id_fkey FOREIGN KEY(question_id)
        REFERENCES questions(question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS mirror_questions;
CREATE TABLE IF NOT EXISTS mirror_questions(
    mirror_question_id integer NOT NULL,
    CONSTRAINT mirror_questions_pkey PRIMARY KEY(mirror_question_id)
);

DROP TABLE IF EXISTS archive_questions;
CREATE TABLE IF NOT EXISTS archive_questions(
    archive_id          serial,
    name                varchar NOT NULL,
    mirror_question_id  integer NOT NULL,
    format              varchar  NOT NULL,
    user_id             integer NOT NULL,
    mode                varchar NOT NULL,
    time_limit        smallint,
    number_limit      smallint,
    created_at          timestamp NOT NULL default CURRENT_TIMESTAMP,
    CONSTRAINT archive_questions_pkey PRIMARY KEY(archive_id),
    CONSTRAINT archive_questions_question_id_fkey FOREIGN KEY(mirror_question_id)
        REFERENCES mirror_questions(mirror_question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT archive_question_formats_fkey FOREIGN KEY(format)
        REFERENCES question_formats(format) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT archive_questions_user_id_fkey FOREIGN KEY(user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT archive_question_mode_fkey FOREIGN KEY(mode)
        REFERENCES question_modes(mode) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS programing_languages;
CREATE TABLE IF NOT EXISTS programing_languages(
    language    varchar NOT NULL,
    summary     varchar NOT NULL,
    CONSTRAINT programing_languages_pkey PRIMARY KEY(language)
);

INSERT INTO programing_languages(language,summary) VALUES ('C','C言語vesion--');

DROP TABLE IF EXISTS blank_question_hints;
CREATE TABLE IF NOT EXISTS blank_question_hints(
    hint_type       varchar NOT NULL,
    summary         varchar NOT NULL,
    CONSTRAINT blank_question_hints_pkey PRIMARY KEY(hint_type)
);
DROP TABLE IF EXISTS card_question_hints;
CREATE TABLE IF NOT EXISTS card_question_hints(
    hint_type       varchar NOT NULL,
    summary         varchar NOT NULL,
    CONSTRAINT card_question_pkey PRIMARY KEY(hint_type)
);


INSERT INTO blank_question_hints(hint_type,summary) VALUES ('なし','ヒントなし');
INSERT INTO blank_question_hints(hint_type,summary) VALUES ('数（不正解）','正誤判定時に〇個間違ってると表示');
INSERT INTO blank_question_hints(hint_type,summary) VALUES ('場所（不正解）','正誤判定時に〇個めと×個めが間違ってると表示');

INSERT INTO card_question_hints(hint_type,summary) VALUES ('なし','ヒントなし');
INSERT INTO card_question_hints(hint_type,summary) VALUES ('数（不正解）','正誤判定時に〇個間違ってると表示');
INSERT INTO card_question_hints(hint_type,summary) VALUES ('場所（不正解）','正誤判定時に〇個めと×個めが間違ってると表示');

DROP TABLE IF EXISTS judge_formats;
CREATE TABLE IF NOT EXISTS judge_formats(
    judge_format    varchar NOT NULL,
    summary         varchar NOT NULL,
    CONSTRAINT judge_formats_pkey PRIMARY KEY(judge_format)
);

INSERT INTO judge_formats(judge_format,summary) VALUES ('完全一致','答えを送信する前に正誤判定が可能');
INSERT INTO judge_formats(judge_format,summary) VALUES ('出力変数のみ一致','答え送信のみ、一発勝負');

DROP TABLE IF EXISTS blank_select_questions;
CREATE TABLE IF NOT EXISTS blank_select_questions(
    question_id     integer NOT NULL,
    explain         text NOT NULL,
    language        varchar NOT NULL,
    base_code       text NOT NULL,
    stdinout        jsonb,
    max_exec_time   smallint NOT NULL DEFAULT 2,
    select_blank    jsonb NOT NULL,
    correct_blank   jsonb NOT NULL,
    hint_type       varchar NOT NULL,
    CONSTRAINT blank_select_questions_pkey PRIMARY KEY(question_id),
    CONSTRAINT blank_select_questions_question_id_fkey FOREIGN KEY(question_id)
        REFERENCES questions(question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT blank_select_questions_language_fkey FOREIGN KEY(language)
        REFERENCES programing_languages(language) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT blank_select_questions_hint_type_fkey FOREIGN KEY(hint_type)
        REFERENCES blank_question_hints(hint_type) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS card_question_posing;
CREATE TABLE IF NOT EXISTS card_question_posing(
    question_id     integer NOT NULL,
    explain         text NOT NULL,
    language        varchar NOT NULL,
    base_code       text NOT NULL,
    card            jsonb NOT NULL,
    correct_blank   jsonb NOT NULL,
    stdinout        jsonb,
    max_exec_time   smallint NOT NULL DEFAULT 2,
    hint_type       varchar NOT NULL,
    CONSTRAINT card_question_posing_pkey PRIMARY KEY(question_id),
    CONSTRAINT card_question_posing_question_id_fkey FOREIGN KEY(question_id)
        REFERENCES questions(question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT card_question_posing_language_fkey FOREIGN KEY(language)
        REFERENCES programing_languages(language) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT card_question_posing_hint_type_fkey FOREIGN KEY(hint_type)
        REFERENCES card_question_hints(hint_type) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS blank_select_archives;
CREATE TABLE IF NOT EXISTS blank_select_archives(
    archives_id     integer NOT NULL,
    explain         text NOT NULL,
    language        varchar NOT NULL,
    base_code       text NOT NULL,
    stdinout        jsonb,
    hint_type       varchar NOT NULL,
    max_exec_time   smallint NOT NULL DEFAULT 2,
    select_blank    jsonb NOT NULL,
    correct_blank   jsonb NOT NULL,
    CONSTRAINT blank_select_archives_pkey PRIMARY KEY(archives_id),
    CONSTRAINT blank_select_archives_archives_id_fkey FOREIGN KEY(archives_id)
        REFERENCES mirror_questions(mirror_question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT blank_select_questions_language_fkey FOREIGN KEY(language)
        REFERENCES programing_languages(language) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT blank_select_questions_hint_type_fkey FOREIGN KEY(hint_type)
        REFERENCES blank_question_hints(hint_type) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS coding_questions;
CREATE TABLE IF NOT EXISTS coding_questions(
    question_id     integer NOT NULL,
    explain         text NOT NULL,
    language        varchar NOT NULL,
    base_code       text,
    stdinout        jsonb NOT NULL,
    max_exec_time   smallint NOT NULL DEFAULT 2,
    model_answer    text NOT NULL,
    judge_format    varchar NOT NULL,
    mandatory_words varchar,
    mini_lines      smallint NOT NULL DEFAULT 1,
    CONSTRAINT coding_questions_pkey PRIMARY KEY(question_id),
    CONSTRAINT coding_questions_question_id_fkey FOREIGN KEY(question_id)
        REFERENCES questions(question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT coding_questions_language_fkey FOREIGN KEY(language)
        REFERENCES programing_languages(language) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT coding_questions_judge_format_fkey FOREIGN KEY(judge_format)
        REFERENCES judge_formats(judge_format) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);

DROP TABLE IF EXISTS coding_archives;
CREATE TABLE IF NOT EXISTS coding_archives(
    archives_id     integer NOT NULL,
    explain         text NOT NULL,
    language        varchar NOT NULL,
    base_code       text,
    model_answer    text NOT NULL,
    judge_format    varchar NOT NULL,
    stdinout        jsonb NOT NULL,
    mandatory_words varchar,
    max_exec_time   smallint NOT NULL DEFAULT 2,
    mini_lines      smallint NOT NULL DEFAULT 1,
    CONSTRAINT coding_archives_pkey PRIMARY KEY(archives_id),
    CONSTRAINT coding_archives_archives_id_fkey FOREIGN KEY(archives_id)
        REFERENCES mirror_questions(mirror_question_id) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT coding_questions_language_fkey FOREIGN KEY(language)
        REFERENCES programing_languages(language) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT coding_questions_judge_format_fkey FOREIGN KEY(judge_format)
        REFERENCES judge_formats(judge_format) MATCH SIMPLE
        ON DELETE NO ACTION ON UPDATE CASCADE
);
