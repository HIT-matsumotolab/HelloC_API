--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)
-- Dumped by pg_dump version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archive_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_questions (
    archive_id integer NOT NULL,
    name character varying NOT NULL,
    mirror_question_id integer NOT NULL,
    format character varying NOT NULL,
    user_id integer NOT NULL,
    mode character varying NOT NULL,
    time_limit smallint,
    number_limit smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.archive_questions OWNER TO postgres;

--
-- Name: archive_questions_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archive_questions_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archive_questions_archive_id_seq OWNER TO postgres;

--
-- Name: archive_questions_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archive_questions_archive_id_seq OWNED BY public.archive_questions.archive_id;


--
-- Name: blank_question_hints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blank_question_hints (
    hint_type character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.blank_question_hints OWNER TO postgres;

--
-- Name: blank_select_archives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blank_select_archives (
    archives_id integer NOT NULL,
    explain text NOT NULL,
    language character varying NOT NULL,
    base_code text NOT NULL,
    stdinout jsonb,
    hint_type character varying NOT NULL,
    max_exec_time smallint DEFAULT 2 NOT NULL,
    select_blank jsonb NOT NULL,
    correct_blank jsonb NOT NULL
);


ALTER TABLE public.blank_select_archives OWNER TO postgres;

--
-- Name: blank_select_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blank_select_questions (
    question_id integer NOT NULL,
    explain text NOT NULL,
    language character varying NOT NULL,
    base_code text NOT NULL,
    stdinout jsonb,
    max_exec_time smallint DEFAULT 2 NOT NULL,
    select_blank jsonb NOT NULL,
    correct_blank jsonb NOT NULL,
    hint_type character varying NOT NULL
);


ALTER TABLE public.blank_select_questions OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    name character varying NOT NULL,
    summary character varying,
    access_key character varying,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_book_id_seq OWNER TO postgres;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- Name: card_detail_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_detail_logs (
    information_log_id bigint NOT NULL,
    card_detail_log_id bigint NOT NULL,
    select_history jsonb,
    trial smallint,
    result_type character varying,
    answer jsonb,
    elapsed_time smallint NOT NULL,
    answer_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.card_detail_logs OWNER TO postgres;

--
-- Name: card_detail_logs_card_detail_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_detail_logs_card_detail_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_detail_logs_card_detail_log_id_seq OWNER TO postgres;

--
-- Name: card_detail_logs_card_detail_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_detail_logs_card_detail_log_id_seq OWNED BY public.card_detail_logs.card_detail_log_id;


--
-- Name: card_question_hints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_question_hints (
    hint_type character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.card_question_hints OWNER TO postgres;

--
-- Name: card_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_questions (
    question_id integer NOT NULL,
    explain text NOT NULL,
    language character varying NOT NULL,
    base_code text NOT NULL,
    card jsonb NOT NULL,
    correct_blank jsonb NOT NULL,
    stdinout jsonb,
    max_exec_time smallint DEFAULT 2 NOT NULL,
    hint_type character varying NOT NULL
);


ALTER TABLE public.card_questions OWNER TO postgres;

--
-- Name: coding_archives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coding_archives (
    archives_id integer NOT NULL,
    explain text NOT NULL,
    language character varying NOT NULL,
    base_code text,
    model_answer text NOT NULL,
    judge_format character varying NOT NULL,
    stdinout jsonb NOT NULL,
    mandatory_words character varying,
    max_exec_time smallint DEFAULT 2 NOT NULL,
    mini_lines smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.coding_archives OWNER TO postgres;

--
-- Name: coding_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coding_questions (
    question_id integer NOT NULL,
    explain text NOT NULL,
    language character varying NOT NULL,
    base_code text,
    stdinout jsonb NOT NULL,
    max_exec_time smallint DEFAULT 2 NOT NULL,
    model_answer text NOT NULL,
    judge_format character varying NOT NULL,
    mandatory_words character varying,
    mini_lines smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.coding_questions OWNER TO postgres;

--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    group_id integer NOT NULL,
    book_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- Name: detail_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_logs (
    information_log_id bigint,
    detail_log_id bigint NOT NULL,
    turn smallint NOT NULL,
    result_type character varying NOT NULL,
    answer jsonb NOT NULL,
    elapsed_time smallint NOT NULL,
    answer_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.detail_logs OWNER TO postgres;

--
-- Name: detail_logs_detail_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detail_logs_detail_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detail_logs_detail_log_id_seq OWNER TO postgres;

--
-- Name: detail_logs_detail_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detail_logs_detail_log_id_seq OWNED BY public.detail_logs.detail_log_id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    name character varying NOT NULL,
    summary character varying,
    access_key character varying,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_group_id_seq OWNER TO postgres;

--
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- Name: information_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.information_logs (
    information_log_id bigint NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    format character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.information_logs OWNER TO postgres;

--
-- Name: information_logs_information_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.information_logs_information_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.information_logs_information_log_id_seq OWNER TO postgres;

--
-- Name: information_logs_information_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.information_logs_information_log_id_seq OWNED BY public.information_logs.information_log_id;


--
-- Name: judge_formats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.judge_formats (
    judge_format character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.judge_formats OWNER TO postgres;

--
-- Name: membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membership (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.membership OWNER TO postgres;

--
-- Name: mirror_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mirror_questions (
    mirror_question_id integer NOT NULL
);


ALTER TABLE public.mirror_questions OWNER TO postgres;

--
-- Name: programing_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programing_languages (
    language character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.programing_languages OWNER TO postgres;

--
-- Name: question_formats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_formats (
    format character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.question_formats OWNER TO postgres;

--
-- Name: question_modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_modes (
    mode character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.question_modes OWNER TO postgres;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    question_id integer NOT NULL,
    name character varying NOT NULL,
    format character varying NOT NULL,
    user_id integer NOT NULL,
    mode character varying NOT NULL,
    time_limit smallint,
    number_limit smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.question_id;


--
-- Name: record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record (
    book_id integer NOT NULL,
    question_id integer NOT NULL,
    open_time timestamp without time zone,
    close_time timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.record OWNER TO postgres;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    result_type character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role character varying NOT NULL,
    summary character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying NOT NULL,
    mail character varying NOT NULL,
    password_hash character varying NOT NULL,
    role character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: archive_questions archive_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions ALTER COLUMN archive_id SET DEFAULT nextval('public.archive_questions_archive_id_seq'::regclass);


--
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- Name: card_detail_logs card_detail_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_detail_logs ALTER COLUMN card_detail_log_id SET DEFAULT nextval('public.card_detail_logs_card_detail_log_id_seq'::regclass);


--
-- Name: detail_logs detail_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_logs ALTER COLUMN detail_log_id SET DEFAULT nextval('public.detail_logs_detail_log_id_seq'::regclass);


--
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- Name: information_logs information_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_logs ALTER COLUMN information_log_id SET DEFAULT nextval('public.information_logs_information_log_id_seq'::regclass);


--
-- Name: questions question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN question_id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: archive_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive_questions (archive_id, name, mirror_question_id, format, user_id, mode, time_limit, number_limit, created_at) FROM stdin;
\.


--
-- Data for Name: blank_question_hints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blank_question_hints (hint_type, summary) FROM stdin;
なし	ヒントなし
数（不正解）	正誤判定時に〇個間違ってると表示
場所（不正解）	正誤判定時に〇個めと×個めが間違ってると表示
\.


--
-- Data for Name: blank_select_archives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blank_select_archives (archives_id, explain, language, base_code, stdinout, hint_type, max_exec_time, select_blank, correct_blank) FROM stdin;
\.


--
-- Data for Name: blank_select_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blank_select_questions (question_id, explain, language, base_code, stdinout, max_exec_time, select_blank, correct_blank, hint_type) FROM stdin;
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, name, summary, access_key, user_id, created_at) FROM stdin;
2	test	tset	test	3	2022-01-16 07:49:07.164991
30	てｓってｓｔ	てｓってｓ	てｓつぇｔ	5	2022-01-30 10:26:21.37614
1	TEST	実験	test	3	2022-01-11 02:45:36.15506
31	test_1	エラー処理確認用	test_1	44	2022-03-08 05:51:59.648538
\.


--
-- Data for Name: card_detail_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_detail_logs (information_log_id, card_detail_log_id, select_history, trial, result_type, answer, elapsed_time, answer_at) FROM stdin;
1	1	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	0	\N	\N	10	2022-01-12 02:16:53.583982
1	2	{"option": "num", "toCard": 2}	1	\N	\N	15	2022-01-12 02:16:58.114494
1	3	{"option": "a[i] = x", "toCard": 0}	2	\N	\N	19	2022-01-12 02:17:02.467234
1	4	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	22	2022-01-12 02:17:05.77074
1	5	{"option": "a[j] = x", "toCard": 0}	4	\N	\N	29	2022-01-12 02:17:12.573161
1	6	\N	5	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	31	2022-01-12 02:17:14.36267
2	7	{"option": "arry[lowid] == target", "toCard": 2}	0	\N	\N	53	2022-01-12 02:18:15.472302
2	8	{"option": "arry[lowid] == target", "toCard": 2}	1	\N	\N	61	2022-01-12 02:18:23.118439
2	9	{"option": "arry[midid] == target", "toCard": 2}	2	\N	\N	65	2022-01-12 02:18:27.171806
2	10	{"option": "arry[midid] < target", "toCard": 3}	3	\N	\N	69	2022-01-12 02:18:31.780534
2	11	{"option": "highid = midid - 1", "toCard": 1}	4	\N	\N	75	2022-01-12 02:18:36.852068
2	12	\N	5	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	76	2022-01-12 02:18:38.259208
3	13	{"option": "y[k++] = x[j]", "toCard": 4}	0	\N	\N	13	2022-01-12 02:18:56.864239
3	14	{"option": "(x[i] / m) % 10", "toCard": 2}	1	\N	\N	21	2022-01-12 02:19:04.181458
3	15	{"option": "while (m <= r)", "toCard": 0}	2	\N	\N	25	2022-01-12 02:19:08.852221
3	16	\N	3	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	27	2022-01-12 02:19:10.682502
5	17	{"option": "a[i] = j", "toCard": 3}	0	\N	\N	248	2022-01-12 11:29:56.076059
5	18	{"option": "a[i] = j", "toCard": 0}	1	\N	\N	251	2022-01-12 11:29:58.458376
5	19	{"option": "a[i] = j", "toCard": 3}	2	\N	\N	253	2022-01-12 11:30:00.374643
5	20	{"option": "while(i++<j)", "toCard": 0}	3	\N	\N	262	2022-01-12 11:30:09.251784
5	21	{"option": "for( i=0; i<num; i++)", "toCard": 3}	4	\N	\N	294	2022-01-12 11:30:41.336041
5	22	{"option": "while(i-->j-1)", "toCard": 0}	5	\N	\N	378	2022-01-12 11:32:05.997203
5	23	{"option": "while(i++<j)", "toCard": 0}	6	\N	\N	381	2022-01-12 11:32:08.408661
5	24	{"option": "while(i++<j)", "toCard": 3}	7	\N	\N	386	2022-01-12 11:32:13.436885
5	25	{"option": "a[i] = x", "toCard": 0}	8	\N	\N	429	2022-01-12 11:32:56.870186
5	26	{"option": "num", "toCard": 0}	9	\N	\N	495	2022-01-12 11:34:02.449729
5	27	{"option": "num", "toCard": 2}	10	\N	\N	498	2022-01-12 11:34:05.965341
5	28	{"option": "a[i] = j", "toCard": 0}	11	\N	\N	503	2022-01-12 11:34:11.120056
5	29	\N	12	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i++<j) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = j;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	506	2022-01-12 11:34:13.596286
5	30	{"option": "while(i++<j)", "toCard": 3}	13	\N	\N	586	2022-01-12 11:35:33.307846
5	31	{"option": "while(i-->j-1)", "toCard": 3}	14	\N	\N	589	2022-01-12 11:35:36.753926
5	32	\N	15	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = j;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	592	2022-01-12 11:35:39.401988
5	33	{"option": "a[i] = x", "toCard": 0}	16	\N	\N	654	2022-01-12 11:36:41.75553
5	34	{"option": "a[i] = j", "toCard": 0}	17	\N	\N	660	2022-01-12 11:36:47.256389
10	78	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	11	\N	\N	461	2022-01-12 12:15:12.744728
12	83	{"option": "arry[midid] > target", "toCard": 3}	1	\N	\N	178	2022-01-12 12:19:49.651524
32	274	{"option": "arry[midid] > target", "toCard": 3}	15	\N	\N	782	2022-01-12 13:11:29.023803
5	35	\N	18	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = j;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	663	2022-01-12 11:36:50.329617
5	36	{"option": "a[j] = x", "toCard": 0}	19	\N	\N	716	2022-01-12 11:37:43.156138
5	37	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	719	2022-01-12 11:37:46.225642
5	38	\N	21	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	755	2022-01-12 11:38:22.81997
5	39	{"option": "a[i] = x", "toCard": 0}	22	\N	\N	807	2022-01-12 11:39:14.495319
5	40	\N	23	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	810	2022-01-12 11:39:17.334387
5	41	{"option": "a[j] = x", "toCard": 0}	24	\N	\N	832	2022-01-12 11:39:39.951386
5	42	\N	25	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i-->j-1) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	834	2022-01-12 11:39:41.644752
8	43	{"option": "arry[midid] == target", "toCard": 2}	0	\N	\N	104	2022-01-12 11:41:51.282512
8	44	{"option": "arry[midid] > target", "toCard": 3}	1	\N	\N	142	2022-01-12 11:42:28.731954
8	45	{"option": "highid = midid - 1", "toCard": 1}	2	\N	\N	164	2022-01-12 11:42:50.867979
8	46	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	165	2022-01-12 11:42:52.451448
8	47	{"option": "arry[midid] < target", "toCard": 3}	4	\N	\N	264	2022-01-12 11:44:30.682125
8	48	\N	5	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	265	2022-01-12 11:44:32.147804
9	49	{"option": "while (m >= r)", "toCard": 0}	0	\N	\N	266	2022-01-12 11:49:04.873425
9	50	{"option": "(x[i] / m) % 10", "toCard": 2}	1	\N	\N	304	2022-01-12 11:49:42.859332
9	51	{"option": "while (m <= r)", "toCard": 0}	2	\N	\N	321	2022-01-12 11:49:59.896434
9	52	{"option": "y[k--] = x[j]", "toCard": 4}	3	\N	\N	342	2022-01-12 11:50:21.17177
9	53	\N	4	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	353	2022-01-12 11:50:31.832464
10	79	\N	12	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	479	2022-01-12 12:15:30.114042
10	80	{"option": "num", "toCard": 2}	13	\N	\N	489	2022-01-12 12:15:40.39156
12	84	{"option": "highid++", "toCard": 1}	2	\N	\N	225	2022-01-12 12:20:36.254665
9	54	\N	5	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	358	2022-01-12 11:50:36.872202
9	55	{"option": "(x[i] * m) % 10", "toCard": 2}	6	\N	\N	401	2022-01-12 11:51:20.62864
9	56	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	405	2022-01-12 11:51:23.777498
9	57	\N	8	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	436	2022-01-12 11:51:55.210899
9	58	{"option": "y[k++] = x[j]", "toCard": 4}	9	\N	\N	453	2022-01-12 11:52:12.135289
9	59	\N	10	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	456	2022-01-12 11:52:15.544183
9	60	{"option": "y[k++] = x[i]", "toCard": 4}	11	\N	\N	479	2022-01-12 11:52:37.740698
10	81	\N	14	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	492	2022-01-12 12:15:43.613957
30	185	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	377	2022-01-12 12:55:03.731528
36	275	{"option": "x", "toCard": 2}	0	\N	\N	77	2022-01-12 13:11:34.724424
36	276	{"option": "x", "toCard": 2}	1	\N	\N	78	2022-01-12 13:11:36.076649
9	61	\N	12	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	480	2022-01-12 11:52:39.405913
9	62	{"option": "y[k++] = x[j]", "toCard": 4}	13	\N	\N	489	2022-01-12 11:52:47.813369
9	63	{"option": "(x[i] / m) * 10", "toCard": 2}	14	\N	\N	580	2022-01-12 11:54:19.041574
9	64	\N	15	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	583	2022-01-12 11:54:22.073735
9	65	{"option": "(x[i] / m) % 10", "toCard": 2}	16	\N	\N	600	2022-01-12 11:54:38.696575
9	66	\N	17	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	603	2022-01-12 11:54:42.134835
10	67	{"option": "a[j] = x", "toCard": 3}	0	\N	\N	30	2022-01-12 12:08:01.833197
10	68	{"option": "while(i++<j)", "toCard": 3}	1	\N	\N	40	2022-01-12 12:08:11.303669
10	69	{"option": "num", "toCard": 2}	2	\N	\N	199	2022-01-12 12:10:50.091945
10	70	{"option": "a[j] = x", "toCard": 0}	3	\N	\N	212	2022-01-12 12:11:03.571195
10	71	{"option": "x", "toCard": 2}	4	\N	\N	221	2022-01-12 12:11:13.037096
10	72	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i++<j) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	226	2022-01-12 12:11:16.968838
10	73	\N	6	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i++<j) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	236	2022-01-12 12:11:26.993632
10	74	\N	7	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  while(i++<j) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	357	2022-01-12 12:13:28.57995
10	75	{"option": "for( i=0; i<num; i++)", "toCard": 3}	8	\N	\N	424	2022-01-12 12:14:34.99517
10	76	{"option": "for( i=0; i<j; i++)", "toCard": 3}	9	\N	\N	435	2022-01-12 12:14:46.611999
10	77	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	440	2022-01-12 12:14:51.26842
12	82	{"option": "arry[lowid] == target", "toCard": 2}	0	\N	\N	117	2022-01-12 12:18:48.983414
12	85	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	227	2022-01-12 12:20:38.581127
12	86	{"option": "arry[midid] < target", "toCard": 3}	4	\N	\N	300	2022-01-12 12:21:51.184233
12	87	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	303	2022-01-12 12:21:54.627021
12	88	{"option": "midid++", "toCard": 1}	6	\N	\N	317	2022-01-12 12:22:08.530346
12	89	\N	7	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	319	2022-01-12 12:22:10.795411
12	90	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	337	2022-01-12 12:22:28.935992
12	91	{"option": "highid++", "toCard": 1}	9	\N	\N	357	2022-01-12 12:22:48.3455
12	92	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	360	2022-01-12 12:22:52.004727
12	93	{"option": "arry[highid] == target", "toCard": 2}	11	\N	\N	385	2022-01-12 12:23:16.262141
12	94	\N	12	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	387	2022-01-12 12:23:18.592448
12	95	{"option": "arry[highid] < target", "toCard": 3}	13	\N	\N	416	2022-01-12 12:23:47.596743
12	96	\N	14	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	420	2022-01-12 12:23:51.971427
12	97	{"option": "midid++", "toCard": 1}	15	\N	\N	561	2022-01-12 12:26:12.063273
12	98	{"option": "arry[lowid] == target", "toCard": 2}	16	\N	\N	586	2022-01-12 12:26:37.247453
12	99	{"option": "arry[lowid] < target", "toCard": 3}	17	\N	\N	634	2022-01-12 12:27:26.010985
36	277	{"option": "a[i] = x", "toCard": 2}	2	\N	\N	85	2022-01-12 13:11:43.14275
36	278	{"option": "x", "toCard": 2}	3	\N	\N	88	2022-01-12 13:11:45.97054
50	513	{"option": "for( i=0; i<num; i++)", "toCard": 3}	2	\N	\N	18	2022-01-13 02:41:47.941523
12	100	\N	18	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	636	2022-01-12 12:27:27.449247
12	101	{"option": "arry[midid] < target", "toCard": 3}	19	\N	\N	656	2022-01-12 12:27:47.132301
12	102	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	659	2022-01-12 12:27:50.183187
12	103	{"option": "arry[midid] > target", "toCard": 3}	21	\N	\N	670	2022-01-12 12:28:01.400448
12	104	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	679	2022-01-12 12:28:10.512013
12	105	{"option": "arry[highid] < target", "toCard": 3}	23	\N	\N	690	2022-01-12 12:28:21.15288
12	106	\N	24	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	691	2022-01-12 12:28:23.02946
12	107	{"option": "arry[highid] == target", "toCard": 2}	25	\N	\N	711	2022-01-12 12:28:42.710814
12	108	\N	26	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	713	2022-01-12 12:28:44.784944
12	109	{"option": "arry[midid] < target", "toCard": 3}	27	\N	\N	733	2022-01-12 12:29:04.781057
12	110	\N	28	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	735	2022-01-12 12:29:06.547373
12	111	{"option": "arry[lowid] == target", "toCard": 2}	29	\N	\N	788	2022-01-12 12:29:59.226739
12	112	{"option": "arry[lowid] < target", "toCard": 3}	30	\N	\N	797	2022-01-12 12:30:08.640068
12	113	{"option": "highid = midid - 1", "toCard": 1}	31	\N	\N	810	2022-01-12 12:30:21.594562
12	114	\N	32	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	812	2022-01-12 12:30:23.918872
35	279	{"option": "for(i = 0; i <= r; i++)", "toCard": 0}	0	\N	\N	297	2022-01-12 13:12:59.139731
50	514	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	3	\N	\N	30	2022-01-13 02:42:00.245402
12	115	\N	33	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	814	2022-01-12 12:30:25.495764
12	116	{"option": "highid = midid + 1", "toCard": 1}	34	\N	\N	841	2022-01-12 12:30:52.99806
12	117	\N	35	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	844	2022-01-12 12:30:55.392045
12	118	{"option": "highid = midid - 1", "toCard": 1}	36	\N	\N	854	2022-01-12 12:31:05.148021
12	119	{"option": "arry[midid] == target", "toCard": 2}	37	\N	\N	920	2022-01-12 12:32:11.226865
12	120	{"option": "arry[midid] < target", "toCard": 3}	38	\N	\N	938	2022-01-12 12:32:29.613123
12	121	\N	39	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	948	2022-01-12 12:32:39.342703
18	122	{"option": "while (m <= r)", "toCard": 0}	0	\N	\N	253	2022-01-12 12:46:13.658845
25	123	{"option": "a[i] = x", "toCard": 3}	0	\N	\N	31	2022-01-12 12:46:15.796429
25	124	{"option": "while(i++<j)", "toCard": 0}	1	\N	\N	33	2022-01-12 12:46:18.392015
25	125	{"option": "num", "toCard": 2}	2	\N	\N	40	2022-01-12 12:46:25.192234
25	126	{"option": "for( i=0; i<num; i++)", "toCard": 2}	3	\N	\N	45	2022-01-12 12:46:30.161536
27	127	{"option": "for( i=0; i<num; i++)", "toCard": 3}	0	\N	\N	112	2022-01-12 12:48:14.126111
25	128	{"option": "a[j] = i", "toCard": 3}	4	\N	\N	172	2022-01-12 12:48:36.984248
27	129	{"option": "for( i=0; i<j; i++)", "toCard": 3}	1	\N	\N	150	2022-01-12 12:48:51.858082
30	130	{"option": "while(i++<j)", "toCard": 3}	0	\N	\N	10	2022-01-12 12:48:57.13031
18	131	{"option": "(x[i] / m) * 10", "toCard": 2}	1	\N	\N	449	2022-01-12 12:49:29.356119
25	132	{"option": "while(i++<j)", "toCard": 0}	5	\N	\N	233	2022-01-12 12:49:38.058715
27	133	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	2	\N	\N	207	2022-01-12 12:49:49.063159
27	134	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	3	\N	\N	209	2022-01-12 12:49:50.885321
25	135	{"option": "while(num-1>j--)", "toCard": 0}	6	\N	\N	250	2022-01-12 12:49:55.422793
18	136	{"option": "y[k--] = x[i]", "toCard": 4}	2	\N	\N	475	2022-01-12 12:49:55.624349
18	137	\N	3	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	478	2022-01-12 12:49:58.692067
25	138	{"option": "num", "toCard": 2}	7	\N	\N	286	2022-01-12 12:50:30.913849
27	139	{"option": "a[i] = x", "toCard": 0}	4	\N	\N	250	2022-01-12 12:50:32.23146
25	140	{"option": "while(i++<num-1)", "toCard": 0}	8	\N	\N	300	2022-01-12 12:50:45.023449
27	141	{"option": "num", "toCard": 0}	5	\N	\N	265	2022-01-12 12:50:47.021021
18	142	{"option": "(x[i] * m) % 10", "toCard": 2}	4	\N	\N	528	2022-01-12 12:50:48.152327
25	143	\N	9	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  a[j] = i {\\n    a[i+1] = a[i];\\n  }\\n  while(i++<num-1);\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	304	2022-01-12 12:50:48.741233
27	144	{"option": "a[i] = x", "toCard": 0}	6	\N	\N	268	2022-01-12 12:50:49.589255
36	280	{"option": "for( i=0; i<num; i++)", "toCard": 3}	4	\N	\N	182	2022-01-12 13:13:20.027698
18	145	\N	5	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	530	2022-01-12 12:50:50.515826
27	146	{"option": "a[x] = i", "toCard": 0}	7	\N	\N	275	2022-01-12 12:50:57.251423
18	147	{"option": "(x[i] / m) % 10", "toCard": 2}	6	\N	\N	549	2022-01-12 12:51:09.56756
27	148	{"option": "a[j] = x", "toCard": 0}	8	\N	\N	288	2022-01-12 12:51:10.202278
18	149	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	562	2022-01-12 12:51:22.027776
25	150	{"option": "a[j] = x", "toCard": 3}	10	\N	\N	340	2022-01-12 12:51:24.995928
27	151	{"option": "num", "toCard": 2}	9	\N	\N	311	2022-01-12 12:51:33.09835
18	152	{"option": "(x[i] * m) * 10", "toCard": 2}	8	\N	\N	582	2022-01-12 12:51:42.57264
18	153	\N	9	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	585	2022-01-12 12:51:45.16156
25	154	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  a[j] = x {\\n    a[i+1] = a[i];\\n  }\\n  while(i++<num-1);\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	368	2022-01-12 12:51:53.462624
27	155	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	338	2022-01-12 12:52:00.142696
18	156	{"option": "(x[i] * m) % 10", "toCard": 2}	10	\N	\N	600	2022-01-12 12:52:00.450199
30	157	{"option": "a[j] = x", "toCard": 3}	1	\N	\N	200	2022-01-12 12:52:07.29342
30	158	{"option": "for( i=0; i<num; i++)", "toCard": 3}	2	\N	\N	207	2022-01-12 12:52:13.799326
25	159	{"option": "while(num-1>j--)", "toCard": 0}	12	\N	\N	396	2022-01-12 12:52:21.392169
25	160	{"option": "while(i-->j-1)", "toCard": 0}	13	\N	\N	399	2022-01-12 12:52:23.764255
18	161	{"option": "y[k++] = x[i]", "toCard": 4}	11	\N	\N	635	2022-01-12 12:52:34.939472
30	162	{"option": "for( i=0; i<num; i++)", "toCard": 3}	3	\N	\N	232	2022-01-12 12:52:38.748902
27	183	\N	15	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	513	2022-01-12 12:54:55.017734
18	184	{"option": "y[k/2] = x[j]", "toCard": 4}	18	\N	\N	783	2022-01-12 12:55:03.535764
35	281	{"option": "while (m == r)", "toCard": 0}	1	\N	\N	350	2022-01-12 13:13:52.560654
18	163	\N	12	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	639	2022-01-12 12:52:39.196028
30	164	{"option": "a[j] = x", "toCard": 0}	4	\N	\N	259	2022-01-12 12:53:06.348971
27	165	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	404	2022-01-12 12:53:06.349657
25	166	{"option": "for( i=0; i<num; i++)", "toCard": 3}	14	\N	\N	443	2022-01-12 12:53:08.341633
25	167	{"option": "a[j] = x", "toCard": 0}	15	\N	\N	474	2022-01-12 12:53:38.737938
30	168	{"option": "for( i=0; i<j; i++)", "toCard": 3}	5	\N	\N	296	2022-01-12 12:53:43.421888
30	169	{"option": "for( i=0; i<num; i++)", "toCard": 3}	6	\N	\N	300	2022-01-12 12:53:46.745063
30	170	{"option": "for( i=0; i<j; i++)", "toCard": 3}	7	\N	\N	303	2022-01-12 12:53:49.597384
30	171	{"option": "num", "toCard": 2}	8	\N	\N	307	2022-01-12 12:53:53.558237
27	172	{"option": "x", "toCard": 2}	12	\N	\N	463	2022-01-12 12:54:05.364275
25	173	\N	16	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	504	2022-01-12 12:54:09.431883
30	174	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	9	\N	\N	335	2022-01-12 12:54:22.048567
18	175	{"option": "y[k++] = x[j]", "toCard": 4}	13	\N	\N	744	2022-01-12 12:54:24.610249
18	176	{"option": "y[k--] = x[j]", "toCard": 4}	14	\N	\N	750	2022-01-12 12:54:30.39734
18	177	\N	15	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	752	2022-01-12 12:54:32.50323
30	178	{"option": "x", "toCard": 2}	10	\N	\N	355	2022-01-12 12:54:41.506838
27	179	{"option": "num", "toCard": 2}	13	\N	\N	504	2022-01-12 12:54:46.271279
18	180	{"option": "y[k*2] = x[j]", "toCard": 4}	16	\N	\N	770	2022-01-12 12:54:50.686741
27	181	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	14	\N	\N	510	2022-01-12 12:54:52.07189
18	182	\N	17	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k*2] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	772	2022-01-12 12:54:52.55678
36	282	{"option": "while(i++<j)", "toCard": 0}	5	\N	\N	216	2022-01-12 13:13:53.696454
18	186	\N	19	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k/2] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	785	2022-01-12 12:55:05.700203
30	187	\N	12	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	379	2022-01-12 12:55:05.827289
18	188	{"option": "(x[i] / m) % 10", "toCard": 2}	20	\N	\N	809	2022-01-12 12:55:28.924623
18	189	{"option": "y[k--] = x[j]", "toCard": 4}	21	\N	\N	813	2022-01-12 12:55:33.370013
18	190	\N	22	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	815	2022-01-12 12:55:35.275922
18	191	{"option": "y[k*2] = x[j]", "toCard": 4}	23	\N	\N	826	2022-01-12 12:55:46.81205
30	192	\N	13	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	420	2022-01-12 12:55:47.256962
18	193	\N	24	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k*2] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	829	2022-01-12 12:55:49.243404
18	194	{"option": "y[k++] = x[j]", "toCard": 4}	25	\N	\N	832	2022-01-12 12:55:51.897304
18	195	\N	26	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	833	2022-01-12 12:55:53.507713
30	196	\N	14	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	429	2022-01-12 12:55:56.187332
31	197	{"option": "arry[highid] == target", "toCard": 2}	0	\N	\N	49	2022-01-12 12:56:16.308493
25	198	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	17	\N	\N	650	2022-01-12 12:56:34.670604
30	199	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	15	\N	\N	501	2022-01-12 12:57:08.153687
30	200	\N	16	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	505	2022-01-12 12:57:11.610623
25	201	\N	18	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	690	2022-01-12 12:57:15.060208
25	202	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	19	\N	\N	693	2022-01-12 12:57:18.354725
25	203	\N	20	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	694	2022-01-12 12:57:19.104303
30	204	{"option": "num", "toCard": 2}	17	\N	\N	545	2022-01-12 12:57:51.982033
30	205	\N	18	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	548	2022-01-12 12:57:54.828803
31	206	{"option": "arry[lowid] < target", "toCard": 3}	1	\N	\N	175	2022-01-12 12:58:22.817304
31	207	{"option": "midid++", "toCard": 1}	2	\N	\N	212	2022-01-12 12:58:59.547118
31	208	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	221	2022-01-12 12:59:08.717865
31	209	{"option": "arry[midid] == target", "toCard": 2}	4	\N	\N	274	2022-01-12 13:00:01.623396
34	210	{"option": "arry[highid] == target", "toCard": 2}	0	\N	\N	33	2022-01-12 13:00:08.831477
34	211	{"option": "midid++", "toCard": 3}	1	\N	\N	36	2022-01-12 13:00:11.710983
34	212	{"option": "arry[highid] == target", "toCard": 1}	2	\N	\N	37	2022-01-12 13:00:13.014615
31	213	{"option": "arry[highid] < target", "toCard": 3}	5	\N	\N	307	2022-01-12 13:00:34.751487
32	214	{"option": "arry[highid] == target", "toCard": 2}	0	\N	\N	131	2022-01-12 13:00:38.229884
31	215	\N	6	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	316	2022-01-12 13:00:43.080453
34	216	{"option": "arry[lowid] == target", "toCard": 2}	3	\N	\N	104	2022-01-12 13:01:20.547548
34	217	{"option": "arry[midid] > target", "toCard": 3}	4	\N	\N	147	2022-01-12 13:02:03.459436
32	218	{"option": "midid++", "toCard": 1}	1	\N	\N	222	2022-01-12 13:02:08.863127
34	219	{"option": "arry[midid] < target", "toCard": 3}	5	\N	\N	160	2022-01-12 13:02:16.44623
31	220	{"option": "highid++", "toCard": 1}	7	\N	\N	426	2022-01-12 13:02:33.540024
32	221	{"option": "arry[highid] < target", "toCard": 3}	2	\N	\N	251	2022-01-12 13:02:38.37528
31	222	{"option": "highid = midid + 1", "toCard": 1}	8	\N	\N	432	2022-01-12 13:02:39.226217
31	223	\N	9	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	434	2022-01-12 13:02:41.602585
32	224	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	255	2022-01-12 13:02:41.774253
34	225	{"option": "arry[lowid] < target", "toCard": 3}	6	\N	\N	196	2022-01-12 13:02:52.033278
31	226	{"option": "highid = midid - 1", "toCard": 1}	10	\N	\N	460	2022-01-12 13:03:07.17571
31	227	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	462	2022-01-12 13:03:09.389878
31	228	{"option": "arry[lowid] < target", "toCard": 3}	12	\N	\N	496	2022-01-12 13:03:43.680761
31	229	{"option": "arry[midid] < target", "toCard": 3}	13	\N	\N	508	2022-01-12 13:03:55.036437
34	230	{"option": "highid = midid - 1", "toCard": 1}	7	\N	\N	275	2022-01-12 13:04:10.707692
34	231	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	276	2022-01-12 13:04:11.892157
31	232	{"option": "arry[midid] > target", "toCard": 3}	14	\N	\N	537	2022-01-12 13:04:24.359365
31	233	\N	15	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	541	2022-01-12 13:04:27.990264
32	234	{"option": "arry[midid] == target", "toCard": 2}	4	\N	\N	370	2022-01-12 13:04:37.11384
31	235	{"option": "midid++", "toCard": 1}	16	\N	\N	554	2022-01-12 13:04:41.141253
31	236	\N	17	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	556	2022-01-12 13:04:43.658766
34	237	{"option": "arry[midid] < target", "toCard": 3}	9	\N	\N	312	2022-01-12 13:04:48.020433
31	238	{"option": "highid = midid + 1", "toCard": 1}	18	\N	\N	564	2022-01-12 13:04:51.846027
32	239	{"option": "arry[midid] < target", "toCard": 3}	5	\N	\N	388	2022-01-12 13:04:54.433347
31	240	\N	19	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	570	2022-01-12 13:04:57.705326
32	272	\N	13	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	734	2022-01-12 13:10:41.370566
31	241	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	573	2022-01-12 13:05:00.345254
32	242	\N	6	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	395	2022-01-12 13:05:02.070574
34	243	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	328	2022-01-12 13:05:03.76282
34	244	{"option": "highid = midid + 1", "toCard": 1}	11	\N	\N	341	2022-01-12 13:05:17.0957
31	245	{"option": "highid = midid - 1", "toCard": 1}	21	\N	\N	596	2022-01-12 13:05:23.883694
31	246	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	604	2022-01-12 13:05:31.319184
31	247	\N	23	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	607	2022-01-12 13:05:34.034014
34	248	{"option": "highid = midid - 1", "toCard": 1}	12	\N	\N	372	2022-01-12 13:05:48.386588
34	249	{"option": "arry[midid] > target", "toCard": 3}	13	\N	\N	385	2022-01-12 13:06:00.952152
34	250	{"option": "arry[midid] < target", "toCard": 3}	14	\N	\N	413	2022-01-12 13:06:28.881747
32	251	\N	7	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	482	2022-01-12 13:06:29.227909
34	252	\N	15	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	414	2022-01-12 13:06:29.992754
34	253	{"option": "arry[highid] == target", "toCard": 2}	16	\N	\N	434	2022-01-12 13:06:49.724576
32	273	{"option": "arry[midid] < target", "toCard": 3}	14	\N	\N	766	2022-01-12 13:11:12.769618
34	254	\N	17	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	436	2022-01-12 13:06:51.870193
31	255	{"option": "arry[midid] < target", "toCard": 3}	24	\N	\N	693	2022-01-12 13:06:59.928247
31	256	\N	25	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	695	2022-01-12 13:07:02.121711
32	257	{"option": "arry[midid] > target", "toCard": 3}	8	\N	\N	556	2022-01-12 13:07:42.921708
32	258	{"option": "midid++", "toCard": 1}	9	\N	\N	562	2022-01-12 13:07:49.138247
32	259	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	577	2022-01-12 13:08:03.686613
34	260	{"option": "highid = midid - 1", "toCard": 1}	18	\N	\N	536	2022-01-12 13:08:32.586265
34	261	{"option": "arry[midid] > target", "toCard": 3}	19	\N	\N	570	2022-01-12 13:09:06.155065
34	262	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	572	2022-01-12 13:09:07.681367
34	263	{"option": "arry[midid] < target", "toCard": 3}	21	\N	\N	575	2022-01-12 13:09:10.736171
34	264	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[highid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	575	2022-01-12 13:09:11.561902
32	265	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	668	2022-01-12 13:09:35.146806
34	266	{"option": "arry[highid] < target", "toCard": 2}	23	\N	\N	601	2022-01-12 13:09:37.368595
34	267	{"option": "arry[highid] == target", "toCard": 2}	24	\N	\N	628	2022-01-12 13:10:04.442172
34	268	{"option": "arry[highid] == target", "toCard": 2}	25	\N	\N	640	2022-01-12 13:10:16.608956
34	269	{"option": "arry[midid] == target", "toCard": 2}	26	\N	\N	644	2022-01-12 13:10:19.929402
34	270	\N	27	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	646	2022-01-12 13:10:21.947222
32	271	{"option": "arry[highid] < target", "toCard": 3}	12	\N	\N	729	2022-01-12 13:10:36.065998
36	283	\N	6	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  while(i++<j);\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	219	2022-01-12 13:13:57.119806
32	284	{"option": "arry[midid] < target", "toCard": 3}	16	\N	\N	961	2022-01-12 13:14:28.175277
36	285	\N	7	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  while(i++<j);\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	255	2022-01-12 13:14:32.795017
36	286	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  while(i++<j);\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	256	2022-01-12 13:14:34.115506
32	287	\N	17	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	968	2022-01-12 13:14:35.150642
32	288	{"option": "arry[midid] > target", "toCard": 3}	18	\N	\N	980	2022-01-12 13:14:47.200457
37	289	{"option": "while (m <= r)", "toCard": 0}	0	\N	\N	185	2022-01-12 13:15:10.111624
35	290	{"option": "(x[i] / m) % 10", "toCard": 2}	2	\N	\N	437	2022-01-12 13:15:18.951345
32	291	{"option": "highid++", "toCard": 1}	19	\N	\N	1014	2022-01-12 13:15:21.283067
32	292	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1018	2022-01-12 13:15:24.71686
36	293	{"option": "a[j] = x", "toCard": 0}	9	\N	\N	309	2022-01-12 13:15:27.391243
36	294	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	319	2022-01-12 13:15:37.158779
32	295	\N	21	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1037	2022-01-12 13:15:43.747786
32	296	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1053	2022-01-12 13:15:59.441181
32	297	\N	23	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1069	2022-01-12 13:16:15.488559
32	298	{"option": "highid = midid + 1", "toCard": 1}	24	\N	\N	1133	2022-01-12 13:17:19.490316
36	299	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	11	\N	\N	422	2022-01-12 13:17:20.18026
32	314	{"option": "arry[midid] > target", "toCard": 3}	32	\N	\N	1195	2022-01-12 13:18:22.342265
36	300	\N	12	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	425	2022-01-12 13:17:22.754151
32	301	\N	25	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1136	2022-01-12 13:17:23.019374
32	302	{"option": "highid = midid - 1", "toCard": 1}	26	\N	\N	1144	2022-01-12 13:17:30.793444
32	303	\N	27	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1147	2022-01-12 13:17:34.215215
32	304	\N	28	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1158	2022-01-12 13:17:44.676238
32	305	{"option": "highid++", "toCard": 1}	29	\N	\N	1165	2022-01-12 13:17:51.771508
35	306	{"option": "y[k++] = x[i]", "toCard": 4}	3	\N	\N	590	2022-01-12 13:17:52.386743
35	307	\N	4	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	594	2022-01-12 13:17:56.514457
32	308	{"option": "arry[midid] < target", "toCard": 3}	30	\N	\N	1177	2022-01-12 13:18:04.230497
32	309	\N	31	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1181	2022-01-12 13:18:08.299863
36	310	{"option": "for( i=0; i<j; i++)", "toCard": 3}	13	\N	\N	475	2022-01-12 13:18:12.834034
36	311	\N	14	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	477	2022-01-12 13:18:14.76971
36	312	\N	15	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	478	2022-01-12 13:18:16.091871
36	313	\N	16	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	480	2022-01-12 13:18:17.973172
32	315	\N	33	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	1199	2022-01-12 13:18:25.797047
35	316	{"option": "y[k/2] = x[i]", "toCard": 4}	5	\N	\N	633	2022-01-12 13:18:35.635916
35	317	\N	6	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k/2] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	636	2022-01-12 13:18:38.296923
36	318	{"option": "for( i=0; i<num; i++)", "toCard": 3}	17	\N	\N	503	2022-01-12 13:18:41.18042
35	319	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k/2] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	640	2022-01-12 13:18:42.633713
36	320	\N	18	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<num; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	505	2022-01-12 13:18:42.941862
37	321	{"option": "(x[i] * m) % 10", "toCard": 2}	1	\N	\N	399	2022-01-12 13:18:44.442606
37	322	{"option": "y[k--] = x[j]", "toCard": 4}	2	\N	\N	416	2022-01-12 13:19:01.426456
36	323	{"option": "for( i=0; i<j; i++)", "toCard": 3}	19	\N	\N	526	2022-01-12 13:19:03.766848
37	324	\N	3	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	423	2022-01-12 13:19:07.913136
36	325	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	532	2022-01-12 13:19:09.696596
35	326	{"option": "y[k--] = x[i]", "toCard": 4}	8	\N	\N	668	2022-01-12 13:19:10.78036
36	348	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	24	\N	\N	667	2022-01-12 13:21:24.922818
35	327	\N	9	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	671	2022-01-12 13:19:13.160269
35	328	\N	10	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	673	2022-01-12 13:19:15.766665
37	329	{"option": "y[k--] = x[i]", "toCard": 4}	4	\N	\N	445	2022-01-12 13:19:30.493151
37	330	\N	5	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	447	2022-01-12 13:19:32.3109
37	331	{"option": "y[k++] = x[i]", "toCard": 4}	6	\N	\N	455	2022-01-12 13:19:40.446657
35	332	{"option": "while (m != r)", "toCard": 0}	11	\N	\N	699	2022-01-12 13:19:40.90312
37	333	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	458	2022-01-12 13:19:43.514505
36	349	\N	25	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	669	2022-01-12 13:21:27.375774
35	350	{"option": "y[k++] = x[j]", "toCard": 4}	19	\N	\N	812	2022-01-12 13:21:33.884908
50	515	\N	4	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	33	2022-01-13 02:42:02.677376
35	334	\N	12	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m != r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	701	2022-01-12 13:19:43.802574
36	335	{"option": "a[i] = x", "toCard": 2}	21	\N	\N	569	2022-01-12 13:19:47.195255
36	336	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=0; i<j; i++) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  a[i] = x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	575	2022-01-12 13:19:52.545608
35	337	{"option": "y[k++] = x[j]", "toCard": 4}	13	\N	\N	720	2022-01-12 13:20:01.969345
35	338	{"option": "y[k--] = x[i]", "toCard": 4}	14	\N	\N	722	2022-01-12 13:20:04.560815
35	339	{"option": "y[k++] = x[i]", "toCard": 4}	15	\N	\N	724	2022-01-12 13:20:06.797151
35	340	\N	16	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m != r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	726	2022-01-12 13:20:08.760657
37	341	{"option": "y[k++] = x[j]", "toCard": 4}	8	\N	\N	508	2022-01-12 13:20:33.246714
37	342	{"option": "y[k++] = x[j]", "toCard": 4}	9	\N	\N	510	2022-01-12 13:20:35.747713
37	343	\N	10	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	512	2022-01-12 13:20:37.153382
36	344	{"option": "x", "toCard": 2}	23	\N	\N	623	2022-01-12 13:20:40.886967
37	345	{"option": "y[k*2] = x[j]", "toCard": 4}	11	\N	\N	531	2022-01-12 13:20:56.32849
35	346	{"option": "(x[i] * m) % 10", "toCard": 2}	17	\N	\N	783	2022-01-12 13:21:05.361929
35	347	\N	18	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m != r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	785	2022-01-12 13:21:07.622016
35	351	\N	20	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m != r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	813	2022-01-12 13:21:35.614729
36	352	{"option": "num", "toCard": 2}	26	\N	\N	715	2022-01-12 13:22:12.815363
37	353	{"option": "y[k++] = x[j]", "toCard": 4}	12	\N	\N	610	2022-01-12 13:22:15.621003
36	354	\N	27	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	718	2022-01-12 13:22:15.87779
37	355	{"option": "(x[i] / m) % 10", "toCard": 2}	13	\N	\N	627	2022-01-12 13:22:31.86152
37	356	\N	14	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	628	2022-01-12 13:22:33.541425
35	357	{"option": "y[k++] = x[j]", "toCard": 4}	21	\N	\N	911	2022-01-12 13:23:13.404133
35	358	{"option": "while (m >= r)", "toCard": 0}	22	\N	\N	926	2022-01-12 13:23:28.290419
35	359	\N	23	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m >= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	928	2022-01-12 13:23:30.389508
35	360	{"option": "while (m <= r)", "toCard": 0}	24	\N	\N	941	2022-01-12 13:23:43.061018
35	361	\N	25	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	943	2022-01-12 13:23:45.309266
38	414	{"option": "y[k/2] = x[i]", "toCard": 4}	26	\N	\N	1005	2022-01-12 13:35:25.067989
48	516	{"option": "y[k++] = x[i]", "toCard": 4}	1	\N	\N	418	2022-01-13 02:43:13.628432
35	362	\N	26	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	945	2022-01-12 13:23:47.648693
35	363	{"option": "y[k/2] = x[j]", "toCard": 4}	27	\N	\N	984	2022-01-12 13:24:26.072433
35	364	\N	28	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k/2] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	986	2022-01-12 13:24:28.041274
35	365	{"option": "y[k*2] = x[j]", "toCard": 4}	29	\N	\N	998	2022-01-12 13:24:40.08877
35	366	\N	30	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k*2] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	1000	2022-01-12 13:24:42.289415
35	367	{"option": "y[k++] = x[j]", "toCard": 4}	31	\N	\N	1009	2022-01-12 13:24:50.963919
38	368	{"option": "for(i = 0; i >= r; i++)", "toCard": 0}	0	\N	\N	373	2022-01-12 13:24:53.055945
35	369	{"option": "(x[i] * m) % 10", "toCard": 2}	32	\N	\N	1053	2022-01-12 13:25:35.685792
35	370	{"option": "(x[i] / m) % 10", "toCard": 2}	33	\N	\N	1061	2022-01-12 13:25:43.618261
35	371	\N	34	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	1064	2022-01-12 13:25:45.986207
38	372	{"option": "y[k--] = x[i]", "toCard": 4}	1	\N	\N	427	2022-01-12 13:25:46.878882
38	373	{"option": "(x[i] / m) * 10", "toCard": 2}	2	\N	\N	483	2022-01-12 13:26:42.188169
39	374	{"option": "arry[highid] == target", "toCard": 2}	0	\N	\N	271	2022-01-12 13:28:15.219288
39	429	{"option": "midid++", "toCard": 1}	27	\N	\N	828	2022-01-12 13:37:31.645756
38	375	\N	3	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i >= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	612	2022-01-12 13:28:51.414628
39	376	{"option": "arry[lowid] == target", "toCard": 2}	1	\N	\N	379	2022-01-12 13:30:03.317325
38	377	{"option": "for(i = 0; i >= r; i--)", "toCard": 0}	4	\N	\N	686	2022-01-12 13:30:05.955996
38	378	\N	5	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i >= r; i--) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	690	2022-01-12 13:30:09.083119
39	379	{"option": "arry[highid] == target", "toCard": 3}	2	\N	\N	386	2022-01-12 13:30:10.071146
39	380	{"option": "arry[midid] > target", "toCard": 1}	3	\N	\N	412	2022-01-12 13:30:35.796482
39	381	{"option": "midid++", "toCard": 1}	4	\N	\N	417	2022-01-12 13:30:40.950422
38	382	{"option": "while (m >= r)", "toCard": 0}	6	\N	\N	725	2022-01-12 13:30:44.93683
39	383	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] == target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	424	2022-01-12 13:30:47.663304
38	384	{"option": "while (m <= r)", "toCard": 0}	7	\N	\N	734	2022-01-12 13:30:53.34782
38	385	\N	8	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	737	2022-01-12 13:30:56.633931
39	430	\N	28	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	830	2022-01-12 13:37:34.062898
39	431	{"option": "highid++", "toCard": 1}	29	\N	\N	832	2022-01-12 13:37:36.240916
38	386	\N	9	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	741	2022-01-12 13:31:00.970712
39	387	{"option": "highid++", "toCard": 1}	6	\N	\N	446	2022-01-12 13:31:09.811667
39	388	\N	7	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] == target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	448	2022-01-12 13:31:12.535878
39	389	{"option": "highid = midid + 1", "toCard": 1}	8	\N	\N	461	2022-01-12 13:31:24.601517
38	390	{"option": "(x[i] * m) * 10", "toCard": 2}	10	\N	\N	767	2022-01-12 13:31:26.597259
39	391	\N	9	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] == target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	465	2022-01-12 13:31:29.421939
38	392	\N	11	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	771	2022-01-12 13:31:30.61443
39	393	{"option": "highid = midid - 1", "toCard": 1}	10	\N	\N	477	2022-01-12 13:31:41.447835
39	394	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[lowid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] == target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	481	2022-01-12 13:31:45.049014
38	395	{"option": "while (m == r)", "toCard": 0}	12	\N	\N	793	2022-01-12 13:31:52.50745
39	432	\N	30	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	834	2022-01-12 13:37:38.414433
39	433	{"option": "highid = midid + 1", "toCard": 1}	31	\N	\N	837	2022-01-12 13:37:40.730487
38	396	\N	13	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m == r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	797	2022-01-12 13:31:56.724243
38	397	{"option": "while (m <= r)", "toCard": 0}	14	\N	\N	809	2022-01-12 13:32:08.763755
38	398	\N	15	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	816	2022-01-12 13:32:15.253609
39	399	{"option": "midid++", "toCard": 1}	12	\N	\N	525	2022-01-12 13:32:28.638203
38	400	{"option": "(x[i] * m) % 10", "toCard": 2}	16	\N	\N	832	2022-01-12 13:32:31.263505
38	401	\N	17	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	835	2022-01-12 13:32:34.371486
38	402	{"option": "(x[i] / m) % 10", "toCard": 2}	18	\N	\N	848	2022-01-12 13:32:47.885922
38	403	\N	19	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	852	2022-01-12 13:32:51.272555
39	434	\N	32	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	839	2022-01-12 13:37:42.839391
39	435	{"option": "highid = midid - 1", "toCard": 1}	33	\N	\N	842	2022-01-12 13:37:45.857613
38	404	\N	20	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	877	2022-01-12 13:33:16.597247
38	405	\N	21	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	893	2022-01-12 13:33:32.903164
39	406	{"option": "arry[midid] > target", "toCard": 2}	13	\N	\N	590	2022-01-12 13:33:33.748885
39	407	{"option": "highid = midid - 1", "toCard": 1}	14	\N	\N	671	2022-01-12 13:34:54.674789
38	408	{"option": "y[k*2] = x[i]", "toCard": 4}	22	\N	\N	975	2022-01-12 13:34:54.857426
38	409	\N	23	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k*2] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	980	2022-01-12 13:34:59.238702
38	410	{"option": "y[k++] = x[i]", "toCard": 4}	24	\N	\N	990	2022-01-12 13:35:09.76
38	411	\N	25	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	994	2022-01-12 13:35:13.191424
39	412	{"option": "arry[lowid] < target", "toCard": 3}	15	\N	\N	696	2022-01-12 13:35:20.545638
39	413	\N	16	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	700	2022-01-12 13:35:23.618297
38	415	\N	27	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k/2] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	1010	2022-01-12 13:35:29.197658
38	416	{"option": "y[k++] = x[i]", "toCard": 4}	28	\N	\N	1017	2022-01-12 13:35:36.836904
39	417	{"option": "highid = midid + 1", "toCard": 1}	17	\N	\N	727	2022-01-12 13:35:50.952715
38	418	{"option": "y[k++] = x[j]", "toCard": 4}	29	\N	\N	1031	2022-01-12 13:35:50.959307
39	419	\N	18	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	729	2022-01-12 13:35:53.070011
38	420	\N	30	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	1035	2022-01-12 13:35:54.887197
39	421	{"option": "midid++", "toCard": 1}	19	\N	\N	743	2022-01-12 13:36:06.936383
39	422	\N	20	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	745	2022-01-12 13:36:09.531279
39	423	{"option": "highid++", "toCard": 1}	21	\N	\N	751	2022-01-12 13:36:14.75512
39	424	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	753	2022-01-12 13:36:17.267203
39	425	{"option": "midid++", "toCard": 1}	23	\N	\N	759	2022-01-12 13:36:23.393783
39	426	{"option": "highid = midid - 1", "toCard": 1}	24	\N	\N	763	2022-01-12 13:36:27.443803
39	427	{"option": "arry[highid] < target", "toCard": 3}	25	\N	\N	790	2022-01-12 13:36:53.859913
39	428	\N	26	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	798	2022-01-12 13:37:02.478235
39	436	\N	34	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] > target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	844	2022-01-12 13:37:48.042974
39	437	{"option": "arry[highid] == target", "toCard": 3}	35	\N	\N	885	2022-01-12 13:38:28.55795
39	438	{"option": "arry[highid] < target", "toCard": 3}	36	\N	\N	892	2022-01-12 13:38:36.315301
39	439	{"option": "arry[highid] == target", "toCard": 2}	37	\N	\N	899	2022-01-12 13:38:42.571385
39	440	{"option": "arry[midid] == target", "toCard": 2}	38	\N	\N	905	2022-01-12 13:38:49.046378
39	441	\N	39	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[highid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	920	2022-01-12 13:39:04.31649
39	442	{"option": "arry[midid] > target", "toCard": 3}	40	\N	\N	942	2022-01-12 13:39:25.781479
39	443	{"option": "arry[lowid] < target", "toCard": 3}	41	\N	\N	970	2022-01-12 13:39:54.234474
39	444	{"option": "arry[highid] < target", "toCard": 3}	42	\N	\N	978	2022-01-12 13:40:01.583017
39	445	{"option": "arry[midid] < target", "toCard": 3}	43	\N	\N	980	2022-01-12 13:40:04.402487
39	446	\N	44	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	986	2022-01-12 13:40:09.768747
40	447	{"option": "y[k--] = x[i]", "toCard": 2}	0	\N	\N	236	2022-01-12 13:44:37.661733
40	448	{"option": "y[k--] = x[j]", "toCard": 4}	1	\N	\N	242	2022-01-12 13:44:43.57515
40	449	{"option": "for(i = 0; i >= r; i++)", "toCard": 0}	2	\N	\N	255	2022-01-12 13:44:56.271738
40	450	\N	3	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i >= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = y[k--] = x[i];       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	267	2022-01-12 13:45:08.511971
40	451	{"option": "for(i = 0; i <= r; i++)", "toCard": 0}	4	\N	\N	352	2022-01-12 13:46:34.051248
40	452	{"option": "(x[i] / m) * 10", "toCard": 2}	5	\N	\N	379	2022-01-12 13:47:00.207574
40	453	\N	6	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i <= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	396	2022-01-12 13:47:17.57699
40	454	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i <= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k--] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	401	2022-01-12 13:47:22.68177
40	455	{"option": "y[k++] = x[j]", "toCard": 4}	8	\N	\N	461	2022-01-12 13:48:22.214168
40	456	\N	9	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i <= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	463	2022-01-12 13:48:25.002905
40	457	{"option": "for(i = 0; i <= r; i++)", "toCard": 0}	10	\N	\N	534	2022-01-12 13:49:35.193565
40	458	\N	11	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i <= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) * 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	558	2022-01-12 13:49:59.794303
40	459	{"option": "(x[i] / m) % 10", "toCard": 2}	12	\N	\N	576	2022-01-12 13:50:17.846519
40	460	\N	13	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i <= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	579	2022-01-12 13:50:20.814915
40	461	{"option": "while (m >= r)", "toCard": 0}	14	\N	\N	597	2022-01-12 13:50:38.348046
40	462	{"option": "while (m != r)", "toCard": 0}	15	\N	\N	610	2022-01-12 13:50:51.923246
49	509	\N	0	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n             {\\n    a[i+1] = a[i];\\n  }\\n            ;\\n            ++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	5	2022-01-13 02:38:57.444982
40	463	\N	16	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m != r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	614	2022-01-12 13:50:55.114376
40	464	{"option": "while (m >= r)", "toCard": 0}	17	\N	\N	620	2022-01-12 13:51:01.79798
40	465	{"option": "while (m <= r)", "toCard": 0}	18	\N	\N	623	2022-01-12 13:51:04.163875
40	466	\N	19	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	633	2022-01-12 13:51:14.472725
41	467	{"option": "num", "toCard": 0}	0	\N	\N	378	2022-01-12 14:05:07.771806
41	468	{"option": "while(i-->j-1)", "toCard": 3}	1	\N	\N	390	2022-01-12 14:05:19.714101
41	469	{"option": "a[j] = x", "toCard": 0}	2	\N	\N	396	2022-01-12 14:05:25.893432
41	470	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	3	\N	\N	474	2022-01-12 14:06:43.308453
41	471	{"option": "num", "toCard": 2}	4	\N	\N	480	2022-01-12 14:06:49.662979
41	472	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	485	2022-01-12 14:06:55.155432
41	473	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	6	\N	\N	674	2022-01-12 14:10:03.830106
41	474	\N	7	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	679	2022-01-12 14:10:08.614566
42	475	{"option": "arry[lowid] < target", "toCard": 3}	0	\N	\N	308	2022-01-12 14:16:06.908987
42	476	{"option": "highid = midid - 1", "toCard": 1}	1	\N	\N	423	2022-01-12 14:18:02.332111
42	477	{"option": "arry[midid] == target", "toCard": 2}	2	\N	\N	436	2022-01-12 14:18:15.507149
42	478	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	438	2022-01-12 14:18:17.026308
42	479	{"option": "arry[midid] < target", "toCard": 3}	4	\N	\N	522	2022-01-12 14:19:41.436772
42	480	\N	5	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	525	2022-01-12 14:19:44.075074
43	481	{"option": "(x[i] / m) % 10", "toCard": 2}	0	\N	\N	339	2022-01-12 14:25:29.034563
43	482	{"option": "while (m <= r)", "toCard": 0}	1	\N	\N	853	2022-01-12 14:34:03.018057
43	483	{"option": "y[k++] = x[i]", "toCard": 4}	2	\N	\N	978	2022-01-12 14:36:08.163227
50	512	{"option": "a[j] = x", "toCard": 0}	1	\N	\N	14	2022-01-13 02:41:43.688654
43	484	\N	3	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	980	2022-01-12 14:36:10.675469
43	485	{"option": "y[k++] = x[j]", "toCard": 4}	4	\N	\N	1029	2022-01-12 14:36:59.208987
43	486	\N	5	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	1035	2022-01-12 14:37:04.980973
44	487	{"option": "a[i] = x", "toCard": 0}	0	\N	\N	93	2022-01-13 02:24:05.136797
44	488	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	1	\N	\N	170	2022-01-13 02:25:22.122322
44	489	{"option": "while(i++<j)", "toCard": 0}	2	\N	\N	179	2022-01-13 02:25:31.309428
44	490	{"option": "a[j] = x", "toCard": 0}	3	\N	\N	187	2022-01-13 02:25:39.608784
44	491	{"option": "num", "toCard": 2}	4	\N	\N	232	2022-01-13 02:26:24.076667
44	492	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	239	2022-01-13 02:26:31.109909
44	493	{"option": "for( i=0; i<num; i++)", "toCard": 3}	6	\N	\N	288	2022-01-13 02:27:21.040211
44	494	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	7	\N	\N	296	2022-01-13 02:27:28.855081
44	495	\N	8	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	299	2022-01-13 02:27:31.873769
46	496	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	0	\N	\N	134	2022-01-13 02:32:23.090893
46	497	{"option": "a[j] = x", "toCard": 0}	1	\N	\N	203	2022-01-13 02:33:31.97737
46	498	{"option": "num", "toCard": 2}	2	\N	\N	214	2022-01-13 02:33:42.428994
46	499	{"option": "num", "toCard": 0}	3	\N	\N	220	2022-01-13 02:33:48.522552
46	500	{"option": "num", "toCard": 2}	4	\N	\N	222	2022-01-13 02:33:50.744103
46	501	{"option": "a[j] = x", "toCard": 0}	5	\N	\N	224	2022-01-13 02:33:52.530579
46	502	{"option": "x", "toCard": 2}	6	\N	\N	226	2022-01-13 02:33:54.62383
46	503	{"option": "num", "toCard": 2}	7	\N	\N	233	2022-01-13 02:34:01.632099
45	504	{"option": "arry[midid] == target", "toCard": 2}	0	\N	\N	318	2022-01-13 02:34:22.84825
46	505	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	261	2022-01-13 02:34:29.504531
45	506	{"option": "highid = midid - 1", "toCard": 1}	1	\N	\N	340	2022-01-13 02:34:45.467745
45	507	{"option": "arry[midid] < target", "toCard": 3}	2	\N	\N	372	2022-01-13 02:35:16.591321
45	508	\N	3	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	407	2022-01-13 02:35:52.114982
48	510	{"option": "(x[i] * m) % 10", "toCard": 2}	0	\N	\N	287	2022-01-13 02:41:02.862489
50	511	{"option": "num", "toCard": 2}	0	\N	\N	10	2022-01-13 02:41:39.931189
50	517	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	106	2022-01-13 02:43:16.271213
48	518	{"option": "y[k++] = x[j]", "toCard": 4}	2	\N	\N	433	2022-01-13 02:43:28.525089
48	519	{"option": "while (m <= r)", "toCard": 0}	3	\N	\N	487	2022-01-13 02:44:23.403607
48	520	\N	4	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	496	2022-01-13 02:44:31.979775
50	521	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	6	\N	\N	186	2022-01-13 02:44:36.433519
50	522	\N	7	正解	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[j] = x;\\n  num++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	189	2022-01-13 02:44:38.63404
48	523	{"option": "while (m >= r)", "toCard": 0}	5	\N	\N	511	2022-01-13 02:44:46.679088
48	524	\N	6	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m >= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] * m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	512	2022-01-13 02:44:48.161501
48	525	{"option": "while (m <= r)", "toCard": 0}	7	\N	\N	532	2022-01-13 02:45:07.942307
48	526	{"option": "(x[i] / m) % 10", "toCard": 2}	8	\N	\N	571	2022-01-13 02:45:46.646485
48	527	\N	9	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	573	2022-01-13 02:45:48.95839
51	528	{"option": "arry[highid] == target", "toCard": 2}	0	\N	\N	104	2022-01-13 02:46:49.512457
51	529	{"option": "midid++", "toCard": 1}	1	\N	\N	127	2022-01-13 02:47:13.282902
51	530	{"option": "highid++", "toCard": 1}	2	\N	\N	139	2022-01-13 02:47:25.256925
51	531	{"option": "arry[midid] > target", "toCard": 3}	3	\N	\N	174	2022-01-13 02:47:59.888978
51	532	{"option": "arry[midid] == target", "toCard": 2}	4	\N	\N	251	2022-01-13 02:49:16.387301
51	533	\N	5	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	253	2022-01-13 02:49:18.438749
51	534	\N	6	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	283	2022-01-13 02:49:49.009405
51	535	{"option": "midid++", "toCard": 1}	7	\N	\N	308	2022-01-13 02:50:13.499117
51	536	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	327	2022-01-13 02:50:32.856867
51	537	{"option": "arry[midid] < target", "toCard": 3}	9	\N	\N	368	2022-01-13 02:51:13.928723
51	538	\N	10	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	370	2022-01-13 02:51:15.905681
51	539	\N	11	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	380	2022-01-13 02:51:25.994367
51	540	{"option": "arry[midid] > target", "toCard": 3}	12	\N	\N	397	2022-01-13 02:51:42.638887
51	541	\N	13	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      midid++;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	403	2022-01-13 02:51:49.279227
51	542	{"option": "arry[midid] != target", "toCard": 2}	14	\N	\N	420	2022-01-13 02:52:05.748816
51	543	{"option": "arry[midid] == target", "toCard": 2}	15	\N	\N	459	2022-01-13 02:52:44.448443
51	544	{"option": "highid = midid - 1", "toCard": 1}	16	\N	\N	513	2022-01-13 02:53:38.328964
51	545	\N	17	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	515	2022-01-13 02:53:40.491997
51	546	{"option": "highid = midid + 1", "toCard": 1}	18	\N	\N	526	2022-01-13 02:53:51.633483
51	547	\N	19	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	528	2022-01-13 02:53:53.528145
51	548	{"option": "arry[midid] < target", "toCard": 3}	20	\N	\N	587	2022-01-13 02:54:52.605703
51	549	{"option": "arry[midid] > target", "toCard": 3}	21	\N	\N	607	2022-01-13 02:55:13.115617
51	550	\N	22	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	615	2022-01-13 02:55:20.656929
51	551	\N	23	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	629	2022-01-13 02:55:34.413653
51	552	\N	24	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	636	2022-01-13 02:55:41.974245
51	553	\N	25	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	644	2022-01-13 02:55:49.584594
51	554	{"option": "arry[midid] < target", "toCard": 3}	26	\N	\N	653	2022-01-13 02:55:58.328729
51	555	\N	27	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	655	2022-01-13 02:56:01.096905
51	556	\N	28	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid + 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	667	2022-01-13 02:56:13.084075
51	557	{"option": "arry[midid] > target", "toCard": 3}	29	\N	\N	675	2022-01-13 02:56:20.558752
51	558	{"option": "highid = midid - 1", "toCard": 1}	30	\N	\N	689	2022-01-13 02:56:34.405268
51	559	\N	31	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] > target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	696	2022-01-13 02:56:41.548348
51	560	{"option": "arry[midid] != target", "toCard": 2}	32	\N	\N	713	2022-01-13 02:56:59.098626
51	561	{"option": "arry[midid] == target", "toCard": 2}	33	\N	\N	716	2022-01-13 02:57:01.711982
51	562	{"option": "arry[midid] != target", "toCard": 2}	34	\N	\N	718	2022-01-13 02:57:03.854268
51	563	{"option": "arry[midid] == target", "toCard": 2}	35	\N	\N	720	2022-01-13 02:57:05.722223
51	564	{"option": "arry[midid] < target", "toCard": 3}	36	\N	\N	774	2022-01-13 02:57:59.499709
51	565	\N	37	正解	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[midid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	779	2022-01-13 02:58:04.933684
52	566	{"option": "y[k--] = x[j]", "toCard": 0}	0	\N	\N	111	2022-01-13 03:00:16.490484
52	567	{"option": "while (m >= r)", "toCard": 0}	1	\N	\N	119	2022-01-13 03:00:24.781101
52	568	{"option": "for(i = 0; i >= r; i++)", "toCard": 0}	2	\N	\N	147	2022-01-13 03:00:52.22647
52	569	{"option": "(x[i] / m) * 10", "toCard": 2}	3	\N	\N	342	2022-01-13 03:04:07.176291
52	570	{"option": "(x[i] / m) % 10", "toCard": 2}	4	\N	\N	451	2022-01-13 03:05:56.10163
52	571	{"option": "y[k--] = x[i]", "toCard": 4}	5	\N	\N	473	2022-01-13 03:06:18.615094
52	572	{"option": "y[k++] = x[i]", "toCard": 4}	6	\N	\N	488	2022-01-13 03:06:33.669814
52	573	\N	7	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  for(i = 0; i >= r; i++) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[i];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	494	2022-01-13 03:06:39.210969
52	574	{"option": "y[k--] = x[j]", "toCard": 4}	8	\N	\N	554	2022-01-13 03:07:39.225221
52	575	{"option": "y[k++] = x[j]", "toCard": 4}	9	\N	\N	559	2022-01-13 03:07:44.4428
52	576	{"option": "while (m >= r)", "toCard": 0}	10	\N	\N	568	2022-01-13 03:07:53.498553
52	577	{"option": "while (m >= r)", "toCard": 0}	11	\N	\N	600	2022-01-13 03:08:25.78898
52	578	\N	12	模範解答不一致	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m >= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	602	2022-01-13 03:08:27.745741
52	579	{"option": "while (m <= r)", "toCard": 0}	13	\N	\N	632	2022-01-13 03:08:57.101624
52	580	\N	14	正解	{"code": "#include<stdio.h>\\n#define NUM_DATA 10\\n\\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\\nstatic int y[NUM_DATA]; /* 作業用配列 */\\n\\n/* n 個のデータを表示する */\\nvoid ShowData(int x[], int n)\\n{\\n  int i;\\n  for (i = 0; i < n ; i++)\\n    printf(\\"%d \\", x[i]);\\n}\\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\\n  int i, j, k;                        /* r:基数を取り出す最大値 */\\n  int m = 1;                          /* 基数を取り出す桁 */\\n  while (m <= r) {\\n    for (i = 0; i < n; i++)\\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\\n\\n    k = 0;                            /* 配列の添字として使う */\\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\\n      for (j = 0; j < n; j++)\\n        if (rad[j] == i)              /* 基数の小さいものから */\\n          y[k++] = x[j];              /* y[ ] にコピー */\\n\\n    for (i = 0; i < n; i++)\\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\\n    \\n    /*  途中経過を表示  */\\n    printf(\\"\\\\nソート中: \\");\\n    ShowData(x, n);\\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\\n  }\\n}\\nint main (){\\n  int i, n, a[10];\\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\\n  scanf (\\"%d\\", &n);\\n  for (i = 0; i < n; i++){\\n    scanf (\\"%d\\", &a[i]);\\n  }\\n  radix_sort (a, n, r);\\n  printf (\\"\\\\nSorted items : \\");\\n  for (i = 0; i < n; i++)\\n    printf (\\"%d \\", a[i]);\\n  printf (\\"\\\\n\\");\\n  return 0;\\n}\\n"}	635	2022-01-13 03:09:00.241047
54	581	{"option": "for( i=0; i<j; i++)", "toCard": 3}	0	\N	\N	59	2022-01-13 08:09:15.983735
54	582	{"option": "for( i=0; i<num; i++)", "toCard": 3}	1	\N	\N	96	2022-01-13 08:09:52.632414
55	583	{"option": "for( i=num-1; i>j; i--)", "toCard": 3}	0	\N	\N	423	2022-01-13 08:28:48.763305
55	584	{"option": "a[i] = j", "toCard": 0}	1	\N	\N	455	2022-01-13 08:29:20.948653
55	585	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	2	\N	\N	660	2022-01-13 08:32:46.508771
55	586	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	3	\N	\N	663	2022-01-13 08:32:48.952867
55	587	{"option": "for( i=num-1; i>j-1; i--)", "toCard": 3}	4	\N	\N	672	2022-01-13 08:32:58.05261
55	588	{"option": "a[i] = x", "toCard": 0}	5	\N	\N	686	2022-01-13 08:33:11.863537
55	589	{"option": "a[i] = x", "toCard": 0}	6	\N	\N	690	2022-01-13 08:33:16.139911
55	590	{"option": "a[i] = x", "toCard": 2}	7	\N	\N	715	2022-01-13 08:33:42.331995
55	591	\N	8	模範解答不一致	{"code": "#include <stdio.h>\\n#define NUM 100\\nint main(void) {\\n  int a[NUM], i, j, num, x;\\n  scanf(\\"%d\\", &num);\\n  for( i=0; i<num; i++ ) {\\n    scanf(\\"%d\\", &a[i]);\\n  }\\n  for( i=0; i<num; i++ ) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  scanf(\\"%d %d\\", &j, &x);\\n  for( i=num-1; i>j-1; i--) {\\n    a[i+1] = a[i];\\n  }\\n  a[i] = x;\\n  a[i] = x++;\\n  for( i=0; i<num; i++) {\\n    printf(\\"a[%d] = %d\\\\n\\", i, a[i]);\\n  }\\n  return 0;\\n}\\n"}	719	2022-01-13 08:33:44.756702
55	592	{"option": "a[i] = j", "toCard": 0}	9	\N	\N	995	2022-01-13 08:38:20.980817
55	593	{"option": "a[j] = i", "toCard": 0}	10	\N	\N	1042	2022-01-13 08:39:08.596569
55	594	{"option": "a[j] = x", "toCard": 0}	11	\N	\N	1082	2022-01-13 08:39:48.026456
55	595	{"option": "a[j] = i", "toCard": 0}	12	\N	\N	1098	2022-01-13 08:40:04.282461
55	596	{"option": "a[j] = i", "toCard": 0}	13	\N	\N	1121	2022-01-13 08:40:27.074314
55	597	{"option": "a[i] = x", "toCard": 0}	14	\N	\N	1124	2022-01-13 08:40:30.537009
55	598	{"option": "a[j] = i", "toCard": 0}	15	\N	\N	1150	2022-01-13 08:40:55.802252
55	599	{"option": "a[j] = i", "toCard": 2}	16	\N	\N	1155	2022-01-13 08:41:01.275558
55	600	{"option": "a[i] = x", "toCard": 2}	17	\N	\N	1177	2022-01-13 08:41:23.09639
55	601	{"option": "a[i] = j", "toCard": 2}	18	\N	\N	1187	2022-01-13 08:41:33.662716
55	602	{"option": "a[x] = i", "toCard": 0}	19	\N	\N	1199	2022-01-13 08:41:44.944198
56	603	{"option": "arry[midid] == target", "toCard": 2}	0	\N	\N	244	2022-01-13 08:46:08.272387
56	604	{"option": "arry[lowid] < target", "toCard": 3}	1	\N	\N	273	2022-01-13 08:46:37.875918
56	605	{"option": "highid = midid - 1", "toCard": 1}	2	\N	\N	289	2022-01-13 08:46:53.778084
56	606	\N	3	模範解答不一致	{"code": "#include <stdio.h>\\n\\n/* 探索対象の配列 -- 11個 */\\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\\n\\nint main(void)\\n{\\n  /* 配列の範囲を狭めるための添字 */\\n  int lowid, midid, highid;\\n  int target;\\n\\n  int i;\\n  printf(\\"探索対象の値 : \\");\\n  for (i=0; i<=10; i++) {\\n    printf(\\"%2d, \\", arry[i]);\\n  }\\n  scanf(\\"%d\\", &target);\\n  printf(\\"\\\\n探索する値:%d\\", target);\\n\\n  /* 添字の範囲を初期化 */\\n  highid = 10;\\n  lowid = 0;\\n\\n  /* 値が見つかるまで繰り返す */\\n  while (lowid <= highid) {\\n    midid = (lowid + highid) / 2;\\n    if (arry[midid] == target) {\\n      printf(\\"\\\\n値 %d は %d 番目に見つかりました\\\\n\\", target, midid+1);\\n      return (0);\\n    } else if (arry[lowid] < target) {\\n      lowid = midid + 1;\\n    } else {\\n      highid = midid - 1;\\n    }\\n  }\\n  printf(\\"見つかりませんでした\\\\n\\");\\n  return (0);\\n}\\n"}	304	2022-01-13 08:47:08.912424
57	607	{"option": "for(i = 0; i <= r; i++)", "toCard": 0}	0	\N	\N	528	2022-01-13 08:50:56.367471
57	608	{"option": "y[k/2] = x[i]", "toCard": 2}	1	\N	\N	594	2022-01-13 08:52:02.324658
57	609	{"option": "y[k++] = x[j]", "toCard": 4}	2	\N	\N	691	2022-01-13 08:53:39.315052
57	610	{"option": "(x[i] / m) % 10", "toCard": 2}	3	\N	\N	882	2022-01-13 08:56:50.507321
65	611	{"option": "arry[midid] == target", "toCard": 2}	0	\N	\N	11	2022-01-21 12:43:54.789641
65	612	{"option": "midid++", "toCard": 1}	1	\N	\N	13	2022-01-21 12:43:56.702301
\.


--
-- Data for Name: card_question_hints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_question_hints (hint_type, summary) FROM stdin;
なし	ヒントなし
数（不正解）	正誤判定時に〇個間違ってると表示
場所（不正解）	正誤判定時に〇個めと×個めが間違ってると表示
\.


--
-- Data for Name: card_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_questions (question_id, explain, language, base_code, card, correct_blank, stdinout, max_exec_time, hint_type) FROM stdin;
3	<p>基数ソート（radix sort）は,「バケットソート」の改良版ともいえるアルゴリズムです。 基数（radix）というのは、10進数の10、16進数の16というように、 桁上がりの基準になる数のことです。 基数ソートの発想は、要するに、 「桁ごとに「バケットソート」を繰り返す」というものです。 そうすることで、必要となるバケツの数を基数分（10進数で1桁ずつソートするなら10個で OK）に抑えられます。 基数ソートでも、もちろん、 ソートできる値の桁数に制限が生じますが、 コンピュータ上で扱える整数の桁なんてたかが知れている （例えば、32ビット整数で、10進数10桁） ので、 実質上は、整数なら値の範囲を気にせず、計算量 O(n) でソートができます。</p><p><img src="https://i.imgur.com/Xz98pho.png" width="500"></p><p>上の画像のように数値を基数ソートで並び変えるプログラムを作成しなさい</p><p>実行例</p><p>5 ←入力</p><p>15 64 94 35 14 ←入力</p><p>ソート中: 64 94 14 15 35</p><p>ソート中: 14 15 35 64 94</p><p>ソート中: 14 15 35 64 94</p><p>ソート中: 14 15 35 64 94</p><p>Sorted items : 14 15 35 64 94</p>	C	#include<stdio.h>\n#define NUM_DATA 10\n\nstatic int rad[NUM_DATA]; /* 基数をしまう配列  */\nstatic int y[NUM_DATA]; /* 作業用配列 */\n\n/* n 個のデータを表示する */\nvoid ShowData(int x[], int n)\n{\n  int i;\n  for (i = 0; i < n ; i++)\n    printf("%d ", x[i]);\n}\nvoid radix_sort (int x[], int n, int r){/* n:データの数 */\n  int i, j, k;                        /* r:基数を取り出す最大値 */\n  int m = 1;                          /* 基数を取り出す桁 */\n  while (m <= r) {\n    for (i = 0; i < n; i++)\n      rad[i] = (x[i] / m) % 10;       /* 基数を取り出し rad[i] に保存 */\n\n    k = 0;                            /* 配列の添字として使う */\n    for (i = 0; i <= 9; i++)          /* 基数は 0 から 9 */\n      for (j = 0; j < n; j++)\n        if (rad[j] == i)              /* 基数の小さいものから */\n          y[k++] = x[j];              /* y[ ] にコピー */\n\n    for (i = 0; i < n; i++)\n      x[i] = y[i];                    /* x[ ] にコピーし直す */\n    \n    /*  途中経過を表示  */\n    printf("\\nソート中: ");\n    ShowData(x, n);\n    m *= 10;                          /*  基数を取り出す桁を一つ上げる */\n  }\n}\nint main (){\n  int i, n, a[10];\n  int r = 1000;      /* ソートするデータから取り出す基数の上限 */\n  scanf ("%d", &n);\n  for (i = 0; i < n; i++){\n    scanf ("%d", &a[i]);\n  }\n  radix_sort (a, n, r);\n  printf ("\\nSorted items : ");\n  for (i = 0; i < n; i++)\n    printf ("%d ", a[i]);\n  printf ("\\n");\n  return 0;\n}\n	[{"loc": {"end": 14, "line": 17, "start": 3}, "option": ["while (m >= r)", "while (m <= r)", "while (m == r)", "while (m != r)"]}, {"loc": {"end": 0, "line": 53, "start": 0}, "option": ["for(i = 0; i >= r; i++)", "for(i = 0; i <= r; i++)", "for(i = 0; i >= r; i--)", "for(i = 0; i <= r; i--)"]}, {"loc": {"end": 15, "line": 19, "start": 16}, "option": ["(x[i] / m) * 10", "(x[i] * m) % 10", "(x[i] * m) * 10", "(x[i] / m) % 10"]}, {"loc": {"end": 0, "line": 53, "start": 0}, "option": ["y[k--] = x[i]", "y[k*2] = x[i]", "y[k++] = x[i]", "y[k/2] = x[i]"]}, {"loc": {"end": 13, "line": 25, "start": 11}, "option": ["y[k--] = x[j]", "y[k*2] = x[j]", "y[k++] = x[j]", "y[k/2] = x[j]"]}]	["while (m <= r)", "(x[i] / m) % 10", "y[k++] = x[j]"]	{"example1": {"in": "", "out": ""}}	3	なし
2	<p>今回は二分探索について説明します。二分探索とは、前もってソートされた配列の中から、中央値と目的の値を比較して、目的の値が前方にあるのか後方にあるのかを判定して検索していく方法です</p><p>実行例</p><p>24 ←入力</p><p>探索する値:24</p><p>値 24 は 8 番目に見つかりました</p></p><p>実行例(失敗)</p><p>9 ←入力</p><p>見つかりませんでした</p>	C	#include <stdio.h>\n\n/* 探索対象の配列 -- 11個 */\nint arry[] = {1, 3, 5, 8, 12, 16, 19, 24, 26, 31, 35};\n\nint main(void)\n{\n  /* 配列の範囲を狭めるための添字 */\n  int lowid, midid, highid;\n  int target;\n\n  int i;\n  printf("探索対象の値 : ");\n  for (i=0; i<=10; i++) {\n    printf("%2d, ", arry[i]);\n  }\n  scanf("%d", &target);\n  printf("\\n探索する値:%d", target);\n\n  /* 添字の範囲を初期化 */\n  highid = 10;\n  lowid = 0;\n\n  /* 値が見つかるまで繰り返す */\n  while (lowid <= highid) {\n    midid = (lowid + highid) / 2;\n    if (arry[midid] == target) {\n      printf("\\n値 %d は %d 番目に見つかりました\\n", target, midid+1);\n      return (0);\n    } else if (arry[midid] < target) {\n      lowid = midid + 1;\n    } else {\n      highid = midid - 1;\n    }\n  }\n  printf("見つかりませんでした\\n");\n  return (0);\n}\n	[{"loc": {"end": 0, "line": 45, "start": 0}, "option": ["arry[highid] == target", "arry[lowid] == target", "arry[highid] < target", "arry[lowid] < target"]}, {"loc": {"end": 18, "line": 33, "start": 7}, "option": ["midid++", "highid++", "highid = midid + 1", "highid = midid - 1"]}, {"loc": {"end": 21, "line": 27, "start": 9}, "option": ["arry[highid] == target", "arry[lowid] == target", "arry[midid] != target", "arry[midid] == target"]}, {"loc": {"end": 20, "line": 30, "start": 16}, "option": ["arry[midid] > target", "arry[midid] < target", "arry[highid] < target", "arry[lowid] < target"]}]	["arry[midid] == target", "arry[midid] < target", "highid = midid - 1"]	{"example1": {"in": "", "out": ""}}	3	なし
1	<p><img src="https://i.imgur.com/okGiOtj.png" width="500"></p><p>実行例※出力はすべての入力が終わってからでないとされませんが, 気にしないでください</p><p>5 ←入力</p><p>1 2 3 4 5 ←入力</p><p>3 ←入力</p><p>7 ←入力</p><p>a[0] = 1</p><p>a[1] = 2</p><p>a[2] = 3</p>a[3] = 4</p><p>a[4] = 5</p><p>a[0] = 1</p><p>a[1] = 2</p><p>a[2] = 3</p><p>a[3] = 7</p><p>a[4] = 4</p><p>a[5] = 5</p>	C	#include <stdio.h>\n#define NUM 100\nint main(void) {\n  int a[NUM], i, j, num, x;\n  scanf("%d", &num);\n  for( i=0; i<num; i++ ) {\n    scanf("%d", &a[i]);\n  }\n  for( i=0; i<num; i++ ) {\n    printf("a[%d] = %d\\n", i, a[i]);\n  }\n  scanf("%d %d", &j, &x);\n  for( i=num-1; i>j-1; i--) {\n    a[i+1] = a[i];\n  }\n  a[j] = x;\n  num++;\n  for( i=0; i<num; i++) {\n    printf("a[%d] = %d\\n", i, a[i]);\n  }\n  return 0;\n}\n	[{"loc": {"end": 8, "line": 16, "start": 3}, "option": ["a[j] = x", "a[i] = x", "a[i] = j", "a[j] = i"]}, {"loc": {"end": 0, "line": 24, "start": 0}, "option": ["while(i++<j)", "while(num-1>j--)", "while(i++<num-1)", "while(i-->j-1)"]}, {"loc": {"end": 3, "line": 17, "start": 3}, "option": ["num", "x", "a[i] = x", "a[x] = i"]}, {"loc": {"end": 25, "line": 13, "start": 3}, "option": ["for( i=0; i<num; i++)", "for( i=0; i<j; i++)", "for( i=num-1; i>j; i--)", "for( i=num-1; i>j-1; i--)"]}]	["for( i=num-1; i>j-1; i--)", "a[j] = x", "num"]	{"example1": {"in": "", "out": ""}}	3	なし
\.


--
-- Data for Name: coding_archives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coding_archives (archives_id, explain, language, base_code, model_answer, judge_format, stdinout, mandatory_words, max_exec_time, mini_lines) FROM stdin;
\.


--
-- Data for Name: coding_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coding_questions (question_id, explain, language, base_code, stdinout, max_exec_time, model_answer, judge_format, mandatory_words, mini_lines) FROM stdin;
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (group_id, book_id, created_at) FROM stdin;
11	1	2022-03-18 03:41:52.279062
\.


--
-- Data for Name: detail_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detail_logs (information_log_id, detail_log_id, turn, result_type, answer, elapsed_time, answer_at) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (group_id, name, summary, access_key, user_id, created_at) FROM stdin;
1	shigematsu_実験	実験用グループ	test	3	2022-01-11 02:45:36.159043
11	test-1	エラー処理確認用	test	50	2022-03-06 09:55:44.862396
\.


--
-- Data for Name: information_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.information_logs (information_log_id, user_id, question_id, format, created_at) FROM stdin;
1	1	1	card_question	2022-01-12 02:16:42.933952
2	1	2	card_question	2022-01-12 02:17:21.801219
3	1	3	card_question	2022-01-12 02:18:43.065524
4	1	1	card_question	2022-01-12 10:25:22.652168
5	6	1	card_question	2022-01-12 11:25:47.072922
6	5	1	card_question	2022-01-12 11:34:32.511825
7	6	2	card_question	2022-01-12 11:40:00.109071
8	6	2	card_question	2022-01-12 11:40:06.522182
9	6	3	card_question	2022-01-12 11:44:38.617256
10	7	1	card_question	2022-01-12 12:07:30.897555
11	6	3	card_question	2022-01-12 12:14:22.524991
12	7	2	card_question	2022-01-12 12:16:50.993531
13	1	1	card_question	2022-01-12 12:18:48.719962
14	1	1	card_question	2022-01-12 12:20:34.657215
15	1	2	card_question	2022-01-12 12:28:28.030626
16	1	2	card_question	2022-01-12 12:31:03.672802
17	1	2	card_question	2022-01-12 12:31:58.644866
18	7	3	card_question	2022-01-12 12:41:59.810647
19	1	1	card_question	2022-01-12 12:43:38.310595
20	1	2	card_question	2022-01-12 12:43:47.44026
21	1	2	card_question	2022-01-12 12:44:02.364933
22	1	1	card_question	2022-01-12 12:44:18.726705
23	1	2	card_question	2022-01-12 12:44:23.560185
24	1	2	card_question	2022-01-12 12:45:14.929455
25	19	1	card_question	2022-01-12 12:45:44.410641
26	1	1	card_question	2022-01-12 12:45:49.640855
27	3	1	card_question	2022-01-12 12:46:21.369645
28	1	2	card_question	2022-01-12 12:47:06.57016
29	1	1	card_question	2022-01-12 12:47:22.434173
30	4	1	card_question	2022-01-12 12:48:46.408442
31	3	2	card_question	2022-01-12 12:55:26.902174
32	4	2	card_question	2022-01-12 12:58:26.364727
33	4	2	card_question	2022-01-12 12:58:32.90754
34	19	2	card_question	2022-01-12 12:59:35.605969
35	3	3	card_question	2022-01-12 13:08:01.788761
36	5	1	card_question	2022-01-12 13:10:17.439811
37	19	3	card_question	2022-01-12 13:12:04.748302
38	4	3	card_question	2022-01-12 13:18:39.044479
39	5	2	card_question	2022-01-12 13:23:43.523639
40	5	3	card_question	2022-01-12 13:40:41.042986
41	14	1	card_question	2022-01-12 13:58:49.145666
42	14	2	card_question	2022-01-12 14:10:58.853552
43	14	3	card_question	2022-01-12 14:19:49.815491
44	11	1	card_question	2022-01-13 02:22:31.849546
45	11	2	card_question	2022-01-13 02:29:04.41289
46	8	1	card_question	2022-01-13 02:30:08.298672
47	11	2	card_question	2022-01-13 02:31:24.569503
48	11	3	card_question	2022-01-13 02:36:15.349428
49	8	1	card_question	2022-01-13 02:38:52.199195
50	8	1	card_question	2022-01-13 02:41:29.450926
51	8	2	card_question	2022-01-13 02:45:05.264584
52	8	3	card_question	2022-01-13 02:58:24.956663
53	8	3	card_question	2022-01-13 02:58:33.375363
54	9	1	card_question	2022-01-13 08:08:15.156026
55	9	1	card_question	2022-01-13 08:21:44.921693
56	9	2	card_question	2022-01-13 08:42:02.234041
57	9	3	card_question	2022-01-13 08:42:07.712787
58	9	3	card_question	2022-01-13 08:42:10.521297
59	9	3	card_question	2022-01-13 08:42:12.704316
60	9	3	card_question	2022-01-13 08:42:15.965481
61	9	3	card_question	2022-01-13 08:42:19.448568
62	9	2	card_question	2022-01-13 08:42:25.885764
63	9	3	card_question	2022-01-13 08:42:29.69311
64	9	3	card_question	2022-01-13 08:42:33.236316
65	1	2	card_question	2022-01-21 12:43:43.550215
\.


--
-- Data for Name: judge_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.judge_formats (judge_format, summary) FROM stdin;
完全一致	答えを送信する前に正誤判定が可能
出力変数のみ一致	答え送信のみ、一発勝負
\.


--
-- Data for Name: membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membership (user_id, group_id, created_at) FROM stdin;
1	1	2022-01-11 02:54:39.388871
3	1	2022-01-12 02:35:00.517409
4	1	2022-01-12 02:35:05.539902
5	1	2022-01-12 02:35:10.275833
6	1	2022-01-12 02:35:14.697914
7	1	2022-01-12 02:35:19.605276
8	1	2022-01-12 02:35:23.807807
9	1	2022-01-12 02:35:29.061717
10	1	2022-01-12 02:35:34.389862
11	1	2022-01-12 02:35:38.988121
12	1	2022-01-12 02:35:43.889379
13	1	2022-01-12 02:35:48.353763
14	1	2022-01-12 02:35:52.874928
15	1	2022-01-12 02:35:59.742602
16	1	2022-01-12 02:36:04.320488
17	1	2022-01-12 02:36:09.112448
18	1	2022-01-12 02:36:13.297896
19	1	2022-01-12 02:36:17.39292
20	1	2022-01-12 02:36:33.837688
21	1	2022-01-12 02:36:38.597749
\.


--
-- Data for Name: mirror_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mirror_questions (mirror_question_id) FROM stdin;
\.


--
-- Data for Name: programing_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programing_languages (language, summary) FROM stdin;
C	C言語vesion--
\.


--
-- Data for Name: question_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_formats (format, summary) FROM stdin;
blank_select	空欄補填選択方式。複数ある選択肢の中から問題を選んで解答する
coding	記述方式。問題文をもとに自らコーディングして解答する
card_question	空欄補填の作問方式。ダミーを含む選択肢からカードを選んでコードを完成させる
\.


--
-- Data for Name: question_modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_modes (mode, summary) FROM stdin;
演習モード	答えを送信する前に正誤判定が可能
テストモード	答え送信のみ、一発勝負
リアルタイムモード	正誤判定をするが、一回ごとに送信して、教授者が解答状況を見ることが可能
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (question_id, name, format, user_id, mode, time_limit, number_limit, created_at) FROM stdin;
1	test1	card_question	1	演習モード	1200	500	2022-01-11 02:45:36.150476
2	test2	card_question	1	演習モード	1200	500	2022-01-11 02:45:36.150476
3	test3	card_question	1	演習モード	1200	500	2022-01-11 02:45:36.150476
\.


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.record (book_id, question_id, open_time, close_time, created_at) FROM stdin;
1	1	\N	\N	2022-01-30 11:53:25.956565
1	3	\N	\N	2022-01-30 11:53:30.952232
1	2	\N	\N	2022-01-30 12:14:19.776952
31	1	\N	\N	2022-03-08 09:48:00.387066
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (result_type, summary) FROM stdin;
正解	正解です
コンパイルエラー	文法が間違ってます
模範解答不一致	実行結果が違います
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role, summary) FROM stdin;
教授者	問題の登録、学習者の進捗管理ができる
学習者	問題の取得、学習結果の送信、自身の進捗管理ができる
学習終了者	未使用の学習権限をもった（ログ管理のため）
問題作成者	問題作成のみ可能、外部からもってきた問題はこのユーザーで問題登録する
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, mail, password_hash, role, created_at) FROM stdin;
1	bl18043	bl18043@cc.it-hiroshima.ac.jp	$2a$10$NA45d9Hb1EBGvYxUMqhpHuFuV5BCm0sukdPIiCq5Dw6h6nNfGBYFG	学習者	2022-01-11 02:45:36.14
47	test13	test13@test.com	$2a$10$0kg6WkfvZtMAycPQ8aTjBe3yWrJ2UwExFcc5ZlBCiUP5nacHY7GLW	学習者	2022-02-19 14:58:13.213438
44	bl20000	bl19999@cc.it-hiroshima.ac.jp	testtest	問題作成者	2022-02-19 13:43:08.607442
2	てｓｔ	てｓｔ	$2b$10$WTEWeQJ83Y70I2IjZWLybePZF8T1.D.lkALiBSIsZ4vj.0RZWu0ja	学習終了者	2022-01-11 10:37:43.019585
3	bl18008	bl18008@cc.it-hiroshima.ac.jp	$2b$10$ujr4mIKWnExJ2dG9YAFBkehW4f9dk21auEPBE3Q4.je.08.IjJU9K	学習者	2022-01-12 02:22:53.157641
4	bl18009	bl18009@cc.it-hiroshima.ac.jp	$2b$10$laKlg..4dDwC8IoWKXRRLerjTzp0ZTA2njY/VFQm4TxyoFm2tuSXK	学習者	2022-01-12 02:23:21.764959
5	bl18094	bl18094@cc.it-hiroshima.ac.jp	$2b$10$Oe1DQeao4G6YftEluevLpO598g5VzM2z9Roc7eyF811kKGJ.TJkgy	学習者	2022-01-12 02:23:50.186777
6	bl18007	bl18007@cc.it-hiroshima.ac.jp	$2b$10$IxcvxFXNAYS/pwgGQzwpSe6W3ny7wLMMXf7HoKZTBODt1cWl4Qn5S	学習者	2022-01-12 02:24:11.691605
7	bl18117	bl18117@cc.it-hiroshima.ac.jp	$2b$10$OJxm2XYHXsDHZyEzvIADqew.nLzL9vNmXPunO57inxAnY67DYVAwe	学習者	2022-01-12 02:24:33.414648
8	bl19701	bl19701@cc.it-hiroshima.ac.jp	$2b$10$vLfiNWTWyJd8XbDqcuIPkOn/Tvm5rw13ZA8gfZfyjBtjQgiki.w9u	学習者	2022-01-12 02:24:54.55924
9	bl19067	bl19067@cc.it-hiroshima.ac.jp	$2b$10$ckylmsPtFUZ0ao7czG5hTOe6lJ11HqhlRYh8nd882sPILuJ/nJdne	学習者	2022-01-12 02:25:21.257843
10	bl19009	bl19009@cc.it-hiroshima.ac.jp	$2b$10$vOfIHsPQWmeYzGIYMJtRH.daEjOK3sg8pOaFVHTxrU33.bJ1uT4x.	学習者	2022-01-12 02:25:38.356452
11	bl19036	bl19036@cc.it-hiroshima.ac.jp	$2b$10$QmMNPaQZ2CVKVInFeDiVo.pZG7HrR0sYjIS6kMeI2uZCEVEiwJHW6	学習者	2022-01-12 02:25:58.284635
12	bl19002	bl19002@cc.it-hiroshima.ac.jp	$2b$10$ZtRYLrmPJ0gzusapKcPhZO.eRxjVdiK42gSyXc3piTiAb/RatemSe	学習者	2022-01-12 02:26:13.951514
13	bl18106	bl18106@cc.it-hiroshima.ac.jp	$2b$10$eh5TGiqAPFsnbE5zchsr6uSx8wPkyWcM7fI7CHSx/qfXmq/iY9P7W	学習者	2022-01-12 02:27:11.379247
14	bl18004	bl18004@cc.it-hiroshima.ac.jp	$2b$10$ai1js4.GpXfU3EVcc9Ho2.Mel6EJvaviFcpSqthFJeMDVkmnvwAhe	学習者	2022-01-12 02:27:40.476662
15	bl18109	bl18109@cc.it-hiroshima.ac.jp	$2b$10$ZGil4ph9l/fOLF/GtfUJo.Hecs6aFrpz5wDo.B9RudsZ1Qu/6H45S	学習者	2022-01-12 02:28:03.104578
16	bl19103	bl19103@cc.it-hiroshima.ac.jp	$2b$10$woJ7FLkNeoKJIQbbUddi6uPsgB78eCMLXK3f6wkCDavnK3bsxJaJW	学習者	2022-01-12 02:28:32.046239
17	bl19115	bl19115@cc.it-hiroshima.ac.jp	$2b$10$prWaR/5fgcz5gxl.Up29UOk.yAIxPUghw.8/TcuoypFBtQrulXpW2	学習者	2022-01-12 02:28:45.426324
18	bl19114	bl19114@cc.it-hiroshima.ac.jp	$2b$10$gejEeEWsb3n9OgLP3hWbf.8Go5e692pNnXfq6l8hnCZM6YwxmlNsW	学習者	2022-01-12 02:28:56.934498
19	bm20026	bm20026@cc.it-hiroshima.ac.jp	$2b$10$JiJWM3QZlD7tPUZJXIY5pO4PhZbet3kTVEmV6nYA6aFDCl0g8.wQy	学習者	2022-01-12 02:29:19.674715
20	bm20051	bm20051@cc.it-hiroshima.ac.jp	$2b$10$LttkhbIl5WYNO2mh..QFx.4Fk2sQ97GFwWWSSHHws97BCVHWuoQvG	学習者	2022-01-12 02:29:43.092821
21	bm20010	bm20010@cc.it-hiroshima.ac.jp	$2b$10$uYROmTw3wgmRrs2xNtSerOQjxA4hmvaPF4Yo2RjEQmJnT51nXsxiq	学習者	2022-01-12 02:30:00.572564
22	bk20080	bk20080@cc.it-hiroshima.ac.jp	$2b$10$VxTJBu4fWPBiwJYO9PyOx.wj6WkpoKXleBSH72KAPgd70QoeTPGiW	学習者	2022-01-12 02:34:04.498147
48	r_okayama	r_okayama@test.co.jp	testtest	問題作成者	2022-02-24 16:57:29.491122
23	kirby	test@test.com	testtest	学習終了者	2022-02-10 11:22:32.569976
24	test1	test1@test.com	$2b$10$Q2XvBFwEW.cHXfqk81GdI.ioOvwbd9eky.B1F.LKGj0SCA0PorNkm	教授者	2022-02-12 11:13:23.847296
25	test4	test4@test.com	$2b$10$K5NJWFbCDm82eu/u7eM6tuNQOPk.2FO4NsfnFw74qKNZIZhoYFfPy	問題作成者	2022-02-12 11:13:24.073021
26	test2	test2@test.com	$2b$10$exiC1li6nWjxoPXtDYfca.b5v/dYY1ehAUoV1rmexV7vE.aEsELn6	学習者	2022-02-12 11:13:24.077132
27	test3	test3@test.com	$2b$10$CX/lLWeQ0EQs66b24x3J2Om2Hce9CEZSBS13VDuLSJkrwNeiqBRCu	学習終了者	2022-02-12 11:13:24.07919
28	test5	test5@test.com	$2b$10$VXsPTcaQiUy0C3lb6R7JU.GfNxwCaZwmPcDv1PwldcAP2JBS1rXWO	教授者	2022-02-12 11:47:15.307667
29	test6	test6@test.com	$2b$10$eF82bJNv6YQvEZ6UzXrtaO/A6NtB2a5vO7YJvEiSYQ3ooZCzgS4Pe	学習者	2022-02-12 11:47:15.309398
30	test7	test7@test.com	$2b$10$sAMFspRfmEp2jfeEq.lm9OmR1HH0M7s.sp.IFZJvob4HJCnj9VsCG	学習終了者	2022-02-12 11:47:15.310442
31	test8	test8@test.com	$2b$10$vZg/HWkKHpDPiMTlPQ8P1OJBjjQGFAlLKmT8mbMnFu7aG/mE3YyS2	問題作成者	2022-02-12 11:47:15.312857
40	test9	test9@test.com	$2b$10$MNseopkfOqA0XSjOx4xqqOJBxArLliv9cRN5XN4skdtgcfv9ov.Fy	教授者	2022-02-12 11:54:06.707119
41	test10	test10@test.com	$2b$10$ORlOVqZR84WzxwjgQcTykeuzOFrl/1aj6igwnksQxbmdCwyvrkF7O	教授者	2022-02-12 12:01:11.531651
42	test11	test11@test.com	$2b$10$Dm.8oanwiJisNwSRyEjdEuzQUt4GbIvp7pGaOvqR.APGGSMCR9Rs6	教授者	2022-02-12 12:18:57.002479
43	bl18019	bl18019@cc.it-hiroshima.ac.jp	$2b$10$MOCozLTtRWRGLSrHcTWHlO7pE3yz1zv8rB.fe/U7vBRtG8nCoWKyO	教授者	2022-02-19 06:21:42.942784
45	bl99999	bl99999@cc.it-hiroshima.ac.jp	$2a$10$w4dlyq2JTvyMA2aYfcDXJuM3vuHVCi6LdVYC5H2t.fs70nBxyaHJe	学習者	2022-02-19 13:58:33.033581
46	test12	test12@test.com	$2a$10$JdAw6da82yfAGEuZAnk4Ne4fjWsv3IpkGnhpZmGe97NXhEWX/.HKa	学習者	2022-02-19 14:53:43.51011
49	r_okayamasaaa	r_okayama@test.com	testtest	問題作成者	2022-02-24 17:06:32.769796
50	test99999	test99999@test.com	testtest	問題作成者	2022-02-24 17:13:37.618968
51	bl19999	bl19999@cc.it-hiroshima.ac.jpffff	$2a$10$Bo6e5yiGrq5TczPvw3qr1eBHOucfK54SkKVYiyTCOkfmu2Xxv1b6y	教授者	2022-03-04 04:24:55.406432
52	bl19999	test9999@testtest.com	$2a$10$wc7HFmqD/7oshlxaZKrml.7S17boSHOiM6HLCCd1ZwMYLiHvMyndy	教授者	2022-03-04 04:27:59.951749
53	bl19999	test4444@example.com	$2a$10$P.nTO.hI.pCjUwKbyeJGD.SttBdDHn8gYRvGvaiVvmQp.iPsumSjK	教授者	2022-03-04 04:29:43.046571
54	testuser_000000	test000000@test.com	testtest	学習終了者	2022-03-07 14:12:09.713494
\.


--
-- Name: archive_questions_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archive_questions_archive_id_seq', 1, false);


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_book_id_seq', 31, true);


--
-- Name: card_detail_logs_card_detail_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_detail_logs_card_detail_log_id_seq', 612, true);


--
-- Name: detail_logs_detail_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detail_logs_detail_log_id_seq', 1, false);


--
-- Name: groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_group_id_seq', 13, true);


--
-- Name: information_logs_information_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.information_logs_information_log_id_seq', 65, true);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 54, true);


--
-- Name: archive_questions archive_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions
    ADD CONSTRAINT archive_questions_pkey PRIMARY KEY (archive_id);


--
-- Name: blank_question_hints blank_question_hints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_question_hints
    ADD CONSTRAINT blank_question_hints_pkey PRIMARY KEY (hint_type);


--
-- Name: blank_select_archives blank_select_archives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_archives
    ADD CONSTRAINT blank_select_archives_pkey PRIMARY KEY (archives_id);


--
-- Name: blank_select_questions blank_select_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_questions
    ADD CONSTRAINT blank_select_questions_pkey PRIMARY KEY (question_id);


--
-- Name: books books_name_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_name_user_id_key UNIQUE (name, user_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: card_detail_logs card_detail_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_detail_logs
    ADD CONSTRAINT card_detail_logs_pkey PRIMARY KEY (card_detail_log_id);


--
-- Name: card_question_hints card_question_hints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_question_hints
    ADD CONSTRAINT card_question_hints_pkey PRIMARY KEY (hint_type);


--
-- Name: card_questions card_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_questions
    ADD CONSTRAINT card_questions_pkey PRIMARY KEY (question_id);


--
-- Name: coding_archives coding_archives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_archives
    ADD CONSTRAINT coding_archives_pkey PRIMARY KEY (archives_id);


--
-- Name: coding_questions coding_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_questions
    ADD CONSTRAINT coding_questions_pkey PRIMARY KEY (question_id);


--
-- Name: collection collection_group_id_book_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_group_id_book_id_key UNIQUE (group_id, book_id);


--
-- Name: detail_logs detail_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_logs
    ADD CONSTRAINT detail_logs_pkey PRIMARY KEY (detail_log_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (group_id);


--
-- Name: information_logs information_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_logs
    ADD CONSTRAINT information_logs_pkey PRIMARY KEY (information_log_id);


--
-- Name: judge_formats judge_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.judge_formats
    ADD CONSTRAINT judge_formats_pkey PRIMARY KEY (judge_format);


--
-- Name: membership membership_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: mirror_questions mirror_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mirror_questions
    ADD CONSTRAINT mirror_questions_pkey PRIMARY KEY (mirror_question_id);


--
-- Name: programing_languages programing_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programing_languages
    ADD CONSTRAINT programing_languages_pkey PRIMARY KEY (language);


--
-- Name: question_formats question_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_formats
    ADD CONSTRAINT question_formats_pkey PRIMARY KEY (format);


--
-- Name: question_modes question_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_modes
    ADD CONSTRAINT question_mode_pkey PRIMARY KEY (mode);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


--
-- Name: record record_book_id_question_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_book_id_question_id_key UNIQUE (book_id, question_id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (result_type);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role);


--
-- Name: users users_mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_mail_key UNIQUE (mail);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: archive_questions archive_question_formats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions
    ADD CONSTRAINT archive_question_formats_fkey FOREIGN KEY (format) REFERENCES public.question_formats(format) ON UPDATE CASCADE;


--
-- Name: archive_questions archive_question_mode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions
    ADD CONSTRAINT archive_question_mode_fkey FOREIGN KEY (mode) REFERENCES public.question_modes(mode) ON UPDATE CASCADE;


--
-- Name: archive_questions archive_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions
    ADD CONSTRAINT archive_questions_question_id_fkey FOREIGN KEY (mirror_question_id) REFERENCES public.mirror_questions(mirror_question_id);


--
-- Name: archive_questions archive_questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_questions
    ADD CONSTRAINT archive_questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: blank_select_archives blank_select_archives_archives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_archives
    ADD CONSTRAINT blank_select_archives_archives_id_fkey FOREIGN KEY (archives_id) REFERENCES public.mirror_questions(mirror_question_id) ON UPDATE CASCADE;


--
-- Name: blank_select_questions blank_select_questions_hint_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_questions
    ADD CONSTRAINT blank_select_questions_hint_type_fkey FOREIGN KEY (hint_type) REFERENCES public.blank_question_hints(hint_type) ON UPDATE CASCADE;


--
-- Name: blank_select_archives blank_select_questions_hint_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_archives
    ADD CONSTRAINT blank_select_questions_hint_type_fkey FOREIGN KEY (hint_type) REFERENCES public.blank_question_hints(hint_type) ON UPDATE CASCADE;


--
-- Name: blank_select_questions blank_select_questions_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_questions
    ADD CONSTRAINT blank_select_questions_language_fkey FOREIGN KEY (language) REFERENCES public.programing_languages(language) ON UPDATE CASCADE;


--
-- Name: blank_select_archives blank_select_questions_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_archives
    ADD CONSTRAINT blank_select_questions_language_fkey FOREIGN KEY (language) REFERENCES public.programing_languages(language) ON UPDATE CASCADE;


--
-- Name: blank_select_questions blank_select_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank_select_questions
    ADD CONSTRAINT blank_select_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id) ON UPDATE CASCADE;


--
-- Name: books books_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: card_detail_logs card_detail_logs_information_log_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_detail_logs
    ADD CONSTRAINT card_detail_logs_information_log_id_fkey FOREIGN KEY (information_log_id) REFERENCES public.information_logs(information_log_id) ON UPDATE CASCADE;


--
-- Name: card_detail_logs card_detail_logs_result_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_detail_logs
    ADD CONSTRAINT card_detail_logs_result_type_fkey FOREIGN KEY (result_type) REFERENCES public.results(result_type) ON UPDATE CASCADE;


--
-- Name: card_questions card_questions_hints_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_questions
    ADD CONSTRAINT card_questions_hints_type_fkey FOREIGN KEY (hint_type) REFERENCES public.card_question_hints(hint_type) ON UPDATE CASCADE;


--
-- Name: card_questions card_questions_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_questions
    ADD CONSTRAINT card_questions_language_fkey FOREIGN KEY (language) REFERENCES public.programing_languages(language) ON UPDATE CASCADE;


--
-- Name: card_questions card_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_questions
    ADD CONSTRAINT card_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id) ON UPDATE CASCADE;


--
-- Name: coding_archives coding_archives_archives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_archives
    ADD CONSTRAINT coding_archives_archives_id_fkey FOREIGN KEY (archives_id) REFERENCES public.mirror_questions(mirror_question_id) ON UPDATE CASCADE;


--
-- Name: coding_questions coding_questions_judge_format_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_questions
    ADD CONSTRAINT coding_questions_judge_format_fkey FOREIGN KEY (judge_format) REFERENCES public.judge_formats(judge_format) ON UPDATE CASCADE;


--
-- Name: coding_archives coding_questions_judge_format_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_archives
    ADD CONSTRAINT coding_questions_judge_format_fkey FOREIGN KEY (judge_format) REFERENCES public.judge_formats(judge_format) ON UPDATE CASCADE;


--
-- Name: coding_questions coding_questions_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_questions
    ADD CONSTRAINT coding_questions_language_fkey FOREIGN KEY (language) REFERENCES public.programing_languages(language) ON UPDATE CASCADE;


--
-- Name: coding_archives coding_questions_language_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_archives
    ADD CONSTRAINT coding_questions_language_fkey FOREIGN KEY (language) REFERENCES public.programing_languages(language) ON UPDATE CASCADE;


--
-- Name: coding_questions coding_questions_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coding_questions
    ADD CONSTRAINT coding_questions_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id) ON UPDATE CASCADE;


--
-- Name: collection collection_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: collection collection_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


--
-- Name: detail_logs detail_logs_information_log_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_logs
    ADD CONSTRAINT detail_logs_information_log_id_fkey FOREIGN KEY (information_log_id) REFERENCES public.information_logs(information_log_id) ON UPDATE CASCADE;


--
-- Name: detail_logs detail_logs_result_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_logs
    ADD CONSTRAINT detail_logs_result_type_fkey FOREIGN KEY (result_type) REFERENCES public.results(result_type) ON UPDATE CASCADE;


--
-- Name: groups groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: information_logs information_logs_formats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_logs
    ADD CONSTRAINT information_logs_formats_fkey FOREIGN KEY (format) REFERENCES public.question_formats(format) ON UPDATE CASCADE;


--
-- Name: information_logs information_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.information_logs
    ADD CONSTRAINT information_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: membership membership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


--
-- Name: membership membership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membership
    ADD CONSTRAINT membership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: questions question_formats_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT question_formats_fkey FOREIGN KEY (format) REFERENCES public.question_formats(format) ON UPDATE CASCADE;


--
-- Name: questions question_modes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT question_modes_fkey FOREIGN KEY (mode) REFERENCES public.question_modes(mode) ON UPDATE CASCADE;


--
-- Name: questions questions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: record record_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);


--
-- Name: record record_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: users users_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_fkey FOREIGN KEY (role) REFERENCES public.roles(role) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

