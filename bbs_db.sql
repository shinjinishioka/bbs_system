#Cドライブ直下に配置した上で、下の命令を実行
#\. c:\bbs_db.sql
DROP DATABASE bbs_db;
CREATE DATABASE bbs_db;
USE bbs_db;
CREATE TABLE bbs_tbl(
	thread_id int,
	speaker   varchar(255), 
	content   text,
	ymdhms    datetime
);
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','おめでとう！','2016-01-28 10:00:00');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','接続できましたね！','2016-01-28 10:00:01');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','これは４個目の発言です。','2016-01-28 10:00:03');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','これは３個目の発言です。','2016-01-28 10:00:02');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','順番通りに出てますか？','2016-01-28 10:00:04');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','6','2016-01-28 10:00:06');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','7','2016-01-28 10:00:07');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','8','2016-01-28 10:00:08');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','9','2016-01-28 10:00:09');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','10','2016-01-28 10:00:10');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','11','2016-01-28 10:00:11');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','12','2016-01-28 10:00:12');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','13','2016-01-28 10:00:13');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','14','2016-01-28 10:00:14');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','15','2016-01-28 10:00:15');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','16','2016-01-28 10:00:16');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','17','2016-01-28 10:00:17');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','18','2016-01-28 10:00:18');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','19','2016-01-28 10:00:19');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','20','2016-01-28 10:00:20');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
1,'福田信之','21番目の発言ですよ','2016-01-28 10:00:21');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１','2016-01-28 10:00:01');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２','2016-01-28 10:00:02');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３','2016-01-28 10:00:03');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の４','2016-01-28 10:00:04');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の５','2016-01-28 10:00:05');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の６','2016-01-28 10:00:06');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の７','2016-01-28 10:00:07');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の８','2016-01-28 10:00:08');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の９','2016-01-28 10:00:09');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１０','2016-01-28 10:00:10');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１１','2016-01-28 10:00:11');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１２','2016-01-28 10:00:12');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１３','2016-01-28 10:00:13');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１４','2016-01-28 10:00:14');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１５','2016-01-28 10:00:15');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１６','2016-01-28 10:00:16');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１７','2016-01-28 10:00:17');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１８','2016-01-28 10:00:18');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の１９','2016-01-28 10:00:19');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２０','2016-01-28 10:00:20');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２１','2016-01-28 10:00:21');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２２','2016-01-28 10:00:22');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２３','2016-01-28 10:00:23');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２４','2016-01-28 10:00:24');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２５','2016-01-28 10:00:25');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２６','2016-01-28 10:00:26');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２７','2016-01-28 10:00:27');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２８','2016-01-28 10:00:28');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の２９','2016-01-28 10:00:29');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３０','2016-01-28 10:00:30');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３１','2016-01-28 10:00:31');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３２','2016-01-28 10:00:32');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３３','2016-01-28 10:00:33');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３４','2016-01-28 10:00:34');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３５','2016-01-28 10:00:35');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３６','2016-01-28 10:00:36');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３７','2016-01-28 10:00:37');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３８','2016-01-28 10:00:38');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の３９','2016-01-28 10:00:39');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の４０','2016-01-28 10:00:40');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
2,'福田信之','スレ２の４１','2016-01-28 10:00:41');
#
# ※実際には無いケースだが、システム上対応なされているべきデータ※
#　　（時系列とデータ順が逆になっているパターン）
#
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
3,'静舘るよ','こっちが２件目','2016-01-29 11:00:41');
INSERT INTO bbs_tbl(thread_id,speaker,content,ymdhms) VALUES(
3,'静舘るよ','こっちがスレトップ','2016-01-29 11:00:40');
