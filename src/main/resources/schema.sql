CREATE DATABASE IF NOT EXISTS ssafydb;

USE ssafydb;

DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `board`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `relationships`;


CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) UNIQUE NOT NULL,
  `age` int NOT NULL,
  `img` varchar(120) DEFAULT NULL,
  `registDate` varchar(100) NOT NULL,
  `gender` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `board` (
  `no` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(500) NOT NULL,
  `id` varchar(40) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `generatedDate` varchar(120) NOT NULL,
  `modifiedDate` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `comments`(
	`commentNo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`boardNo` INT NOT NULL,
    `id` VARCHAR(100) NOT NULL,
    `content` VARCHAR(1000) NOT NULL,
	`generatedDate` varchar(120) NOT NULL,
	`modifiedDate` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `relationships`(
	`idA` VARCHAR(100) NOT NULL,
    `idB` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO relationships(idA, idB)
VALUES
("ssafy", "catbirdseat"),
("ssafy", "administrator");


INSERT INTO users (id, password, name, email, age, registDate, gender) 
VALUES 
("ssafy", "1234", "김싸피", "ssafy.kim@ssafy.com", 20, "2023.01.15 00:00:00", "y"),
("administrator", "1", "관리자", "catbirdseat@naver.com", 999, "0000.00.00 00:00:00", "x"),
("catbirdseat", "qkrwoals", "박재민", "catbirdseat9708@gmail.com", 27, "0000.00.00 00:00:00", "y"),
("boyeon", "1234", "김보연", "kkbbyy1113@gmail.com", 29, "0000.00.00 00:00:00", "x"),
("younprize", "1234", "조윤상", "yesGay@naver.com", 28, "2023.02.28 00:00:00", "y"),
("hohee", "1234", "권소희", "mStone@naver.com", 25, "2023.03.19 00:00:00", "x"),
("choonsik", "1234", "춘식이", "choonsik@naver.com", 3, "2023.01.09 00:00:00", "y"),
("bmincoffee", "1234", "민병기", "bmincoffee@naver.com", 26, "2023.02.08 00:00:00", "y"),
("minyoung", "1234", "정민영", "minyoung@naver.com", 28, "2023.04.12 00:00:00", "y"),
("seoJoon", "1234", "채현종", "unluckSeoJoon@naver.com", 27, "2023.03.21 00:00:00", "y"),
("iceBear", "1234", "박동건", "iceBear@naver.com", 26, "2023.02.04 00:00:00", "y"),
("silverStone", "1234", "이은석", "silverStone@naver.com", 25, "2023.01.08 00:00:00", "y"),
("alsxo0824", "1234", "김민태", "alsxo0824@naver.com", 26 ,"2023.04.27 00:00:00", "y"),
("edujihye21", "1234", "오지혜", "edujihye21@gmail.com", 28, "2023.01.04 00:00:00", "x"),
("alwaysWY", "1234", "장원영", "alwaysWY@naver.com", 20, "2023.04.28 00:00:00", "x");

INSERT INTO board(no, title, id, content, generatedDate, modifiedDate)
VALUES
(0, "수비드 하는법", "catbirdseat", "소고기 안심 기준 56도 1시간", "2023.03.28 00:00:00", "2023.03.28 00:00:00"),
(0, "식단 좀 알려줄 사람", "silverStone", "건강하게 벌크업하고 싶은데 식단 좀 알려줄 형님들", "2023.04.05 01:00:00", "2023.04.05 01:00:00"),
(0, "여자친구 사귀는 법 강의 들어간다", "iceBear", "눈 뜨고 귀열고 들어라 강의 시작한다. - 박동건 선생님", "2022.01.05 00:00:00", "2022.01.03 03:12:00"),
(0, "챗gpt 개발자의 적군일지 아군일지", "bmincoffee", "두고봐야할듯", "2023.03.08 00:00:00", "2023.03.08 00:00:00"),
(0, "좋아하는 사람한테 고백하려구요", "boyeon", "스케치북 고백 괜찮을까요? 레스토랑에서 노래 틀고 사람들 많은 장소에서 공개 고백하면 로맨틱할까요? 고백이 처음이라 많이 서툴어요", "2023.04.26 12:00:00", "2023.04.28 02:00:00"),
(0, "요새 탑 아이돌 누구 있나?", "alwaysWY", "장원영 미만 잡 아님", "2023.04.28 00:00:00", "2023.04.28 00:00:00");
 


SELECT * FROM users;
SELECT * FROM board;
SELECT * FROM comments;
SELECT * FROM relationships;
