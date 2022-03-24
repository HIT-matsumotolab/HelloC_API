-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2022-03-17 08:05:43
-- サーバのバージョン： 10.4.22-MariaDB
-- PHP のバージョン: 8.1.2

-- SET FOREIGN_KEY_CHECKS=0;
-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: helloc
--

--
-- テーブルのデータのダンプ groups
--

INSERT INTO groups (group_id, name, user_id, summary, access_key, created_at) VALUES
(1, 'sample1', 1, 'サンプル1', 'kagi', '2018-07-03 15:37:30'),
(2, 'sample2', 1, 'サンプル2', 'kagi', '2018-07-04 03:28:06'),
(3, 'sample3', 1, 'サンプル3', 'kagi', '2018-07-12 06:22:26'),
(5, 'sample4', 1, 'サンプル4', 'kagi', '2018-07-12 07:41:57'),
(8, 'sample5', 1, 'サンプル5', 'kagi', '2018-07-30 03:32:00'),
(9, 'feedback_pureTest', 4, '北海道実験puretesut', '$2y$10$lNo5JgV4M78upkIIyeM.2ugbNG3Et/wjPLEX5wsvgFPVu7e44CJB6', '2018-08-23 04:24:47'),
(10, 'JSISEPureTest', 4, '北海道プレテスト', '$2y$10$sv9JxHIyebod8jae26wQ2uMQGRyQMbeFFzXeInVMg0LRodTMav6I6', '2018-08-23 04:38:05'),
(11, 'jsisePostTest', 4, '北海道で使用するポストテスト', '$2y$10$S6QLWx9tR55Cy0CoEWkLgeYsCPMC4L0bfK7OXbNHqBpr9r5ftmJN.', '2018-08-23 04:49:28'),
(12, 'sample6', 1, 'サンプル6', 'kagi', '2018-09-18 06:39:41'),
(16, '2018algo2', 1, '2018年後期授業アルゴリズム基礎2\n専用クラス', 'IceCream', '2018-09-27 10:02:55'),
(17, '2018prog2', 1, '2018年後期授業プログラミング基礎2 専用クラス', 'SoftCream', '2018-10-03 04:34:19'),
(18, 'CreateTest', 31, '作成用テスト', 'kagi', '2018-10-03 09:18:07'),
(19, '2018test', 1, '2018年に行ったプログラミング基礎2，アルゴリズム基礎2の課題を出す前のテスト用クラスです', 'test', '2018-10-04 06:44:46'),
(20, 'ProjectEuler', 1, '2018年、実験用', 'okonomiyaki', '2018-11-06 15:47:13'),
(21, 'bl18462_jikken', 180, '村上濱田実験', 'okonomiyaki', '2018-11-20 09:36:18'),
(22, '2018algoprogtest', 1, '2018年アルゴリズムプログラミング基礎2の問題確認用クラスです', 'kick', '2018-11-22 12:41:16'),
(23, 'AROBExperiment', 4, 'AROBの実験(トグル再実験)', 'arob', '2018-11-26 15:09:02'),
(24, '2018_hamada_zikken', 179, '濱田実験用', 'okonomiyaki', '2018-11-27 14:28:30'),
(25, 'morinagaJikkenTest', 4, '森永さんの実験の際の確認用テストクラスです．基本公開禁止', 'usiheiriibei', '2018-11-27 15:18:39'),
(26, '2018alabJikken', 189, 'alab用実験です', 'samuine', '2018-12-11 12:23:18'),
(27, 'muraodaPre', 179, '村上君、小田君のプレテスト', 'okonomiyaki', '2019-01-07 14:09:35'),
(28, 'murakami_tousei', 179, '村上君の実験（統制群）', 'okonomiyaki', '2019-01-21 18:34:02'),
(29, 'murakami_zikken', 179, '村上君の実験（実験群）', 'okonomiyaki', '2019-01-21 18:35:27'),
(30, 'murakami_Post', 179, '村上君のポストテスト', 'okonomiyaki', '2019-01-21 19:36:41'),
(31, 'oda_tousei', 179, '小田君の実験（統制群）', 'okonomiyaki', '2019-01-22 11:09:06'),
(32, 'oda_zikken', 179, '小田君の実験（実験群）', 'okonomiyaki', '2019-01-22 11:10:52'),
(33, 'oda_Post', 179, '小田君のポストテスト', 'okonomiyaki', '2019-01-22 11:18:57'),
(36, 'HajimetenoAlgorithm', 1, '初めてのアルゴリズムの問題集です', 'QZnTAQfy6Z', '2019-04-02 16:54:29'),
(37, '2019algo1', 1, '2019年前期授業アルゴリズム基礎1専用クラス', 'ChipStar', '2019-04-10 19:05:55'),
(38, '2019prog1', 1, '2019年前期授業プログラミング基礎1専用クラス', 'DARS', '2019-04-10 19:21:30'),
(39, '2019prog1yamagishi', 297, '2019年プログラミング基礎1の山岸先生のクラスです', 'kirinlemon', '2019-04-25 11:28:31'),
(40, 'ErrorJikkenOhshita', 298, '大下のエラーの実験ようクラス', 'kuroneko', '2019-05-08 15:48:13'),
(41, 'SubTest', 1, '公開前の問題提出用クラスです', 'IcePenguin', '2019-05-13 13:11:38'),
(42, 'kurazi', 321, 'カード演習実験', 'takoyaki25', '2019-07-01 11:13:01'),
(43, 'jikkentest', 1, 'テストです', 'testdesu', '2019-07-03 12:25:12'),
(44, 'kurapre', 321, 'カード演習実験/プレテスト', 'kurapre', '2019-07-07 00:34:15'),
(45, 'kurapost', 321, 'カード演習システム/ポストテスト', 'takoyaki07', '2019-07-16 15:46:28'),
(46, 'HelloCUseFul', 298, 'Hello Cの有用性実験用クラスです', 'abc', '2019-09-20 11:59:32'),
(47, '2019algo2', 1, '2019年後期授業アルゴリズム基礎2専用クラス', 'Ajinomoto', '2019-09-24 11:11:35'),
(48, '2019prog2', 1, '2019年後期授業プログラミング基礎2専用クラス', 'Mono', '2019-09-24 11:12:14'),
(49, '2019prog2yamagishi', 297, '2019年プログラミング基礎2の山岸先生のクラスです', 'Boss', '2019-09-24 13:59:10'),
(50, 'templatetest', 1, 'テンプレート配信専用のテストです', 'temp', '2019-10-04 13:12:30'),
(51, 'QuestionsBeforeOpening', 1, '解放前の問題集です', 'questions', '2019-10-10 03:19:06'),
(52, '2019SyntaxError', 1, '2019年シンタックスエラー修正実験のためのクラスです', 'komeda', '2019-12-06 12:51:52'),
(53, 'kurapre2', 321, 'カード演習実験2/プレテスト', 'kurapre2', '2019-12-06 16:14:14'),
(54, 'kuratousei', 321, 'カード演習実験/統制群用トレーニング問題', 'kuratousei', '2019-12-13 18:05:36'),
(55, '2019SyntaxErrorBefore', 1, 'シンタックスエラーの課題提出前のクラスです', 'else', '2019-12-17 12:00:01'),
(56, 'kurapost2', 321, '日本語対応実験のポストテストクラス', 'kurapost2', '2020-01-07 17:49:36'),
(57, 'oda2020', 339, '小田実験用', 'oda2020', '2020-01-22 22:14:33'),
(58, '2020', 1, 'md19001が行う動作確認', 'test', '2020-05-17 10:22:40'),
(59, '2020dousakakunin', 1, '動作確認', 'karaage', '2020-06-11 17:08:56'),
(60, '2021_programming_intro', 1, '2021_プログラミング入門\r\n2021_プログラミング基礎\r\n2020_プログラミング基礎2', '2021_programming_intro', '2020-06-25 16:22:28'),
(61, '2020_algorithm_basic1', 1, '2020年アルゴリズム基礎2の講義用', '2020_algorithm_basic1', '2020-07-06 12:49:09'),
(62, '2020sikakegaku', 1, '仕掛学によるシンタックスエラー修正学習', 'pepsi0', '2020-10-30 10:50:41'),
(63, '2020.02.19', 1, 'bl18008の確認テスト', 'test', '2021-02-19 14:56:06'),
(64, '2021.02.23-1111', 1, 'bl18008のテストその2-1desu', 'test', '2021-02-23 13:22:29'),
(65, '没', 1, 'こっちは使わないで', '2021_programming_basic2', '2021-05-18 16:40:45'),
(66, '2021.shigematsu_test', 1, 'test', 'test', '2021-06-07 14:31:31'),
(67, 'final-exam', 1, '期末テスト用問題です', 'matsumotolab', '2021-07-13 15:38:50'),
(68, 'muratest', 1, '村上の確認テスト', 'test', '2021-09-21 13:09:26'),
(69, '2021_programming_intro_ex', 1, '2021_プログラミング入門 ', '2021_programming_intro_ex', '2021-10-23 12:43:23'),
(70, 'ppapnopuretesuto', 1, 'pappのぷれてすとです', 'ppap', '2021-11-23 14:43:30'),
(71, 'ppappretest', 1, 'ppapのプレテストです', 'ppap', '2021-11-23 16:30:04'),
(72, '没', 1, '没', '1234', '2021-11-25 15:15:14'),
(73, '2021_shigematsu_pre', 1, 'プレテスト', '1234', '2021-11-25 17:21:48'),
(74, '没2', 1, 'a', '1234', '2022-01-04 20:06:38'),
(75, '没1', 1, 'post', 'ppap', '2022-01-10 11:42:03'),
(76, 'ppaptest', 1, 'a', 'ppap', '2022-01-10 13:01:03'),
(77, '没', 1, '実験', 'test', '2022-01-10 14:03:06'),
(78, 'shigematsu_test', 1, '実験', 'test', '2022-01-10 14:49:04'),
(79, 'shigematsu_posttest', 1, 'posttest', 'test', '2022-01-10 16:16:22');
-- SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
