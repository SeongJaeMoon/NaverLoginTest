# NaverLoginTest
네이버 아이디로 로그인 테스트

임시 mysql 쿼리문

```sql
/*회원 아이디, 비밀번호*/
CREATE TABLE LOGIN(
    id VARCHAR(20),
    pw VARCHAR(20)
);
ALTER TABLE LOGIN
ADD CONSTRAINT login_id_pk PRIMARY KEY (id);


/*기존 회원 정보*/
CREATE  TABLE USERS (
  idx VARCHAR(10) NOT NULL, 
  name_ VARCHAR(50) NULL ,
  email VARCHAR(100) NULL ,
  nickname VARCHAR(50) NULL ,
  phone VARCHAR(20) NULL ,
  regDate DATETIME NULL, 
  id VARCHAR(20)
);
ALTER TABLE USERS
ADD CONSTRAINT users_idx_pk PRIMARY KEY (idx);

ALTER TABLE USERS 
ADD CONSTRAINT users_id_fk FOREIGN KEY (id) REFERENCES LOGIN (id);

/*네아로 로그인 정보*/
CREATE TABLE `SNS_INFO` (
  idx VARCHAR(10) NOT NULL,
  email VARCHAR(255) NOT NULL,
  age VARCHAR(10)  NULL,
  nickname VARCHAR(255)  NULL,
  profile_image VARCHAR(255)  NULL,
  gender VARCHAR (255) NULL,
  birthday  VARCHAR(10)  NULL,
  KEY `idx01_id` (idx),
  KEY `idx02_sns_id` (email)
)ENGINE =InnoDB DEFAULT CHARSET = utf8; /* 한글 설정을 위해 필요.*/

SELECT * FROM LOGIN;
SELECT * FROM USERS;
SELECT * FROM SNS_INFO;

INSERT INTO LOGIN (id, pw) VALUES ('master', 'master123!');

INSERT INTO USERS (idx, name_, email, nickname, phone, regDate, id) 
VALUES ('','seongjaemoon', 'clear219@naver.com', 'moon', '01012341234', DATE_FORMAT(now(), '%y-%m-%d'), 'master');

INSERT INTO USERS (idx, name_, email, nickname, phone, regDate, id) 
VALUES ('testID', 'tester', 'seongjae.m@gmail.com', 'test1', '01012341234', DATE_FORMAT(now(), '%y-%m-%d'), 'sjmoon0221');

SELECT idx,  id, pw, name_, email, nickname, phone, regDate FROM LOGIN INNER JOIN USERS USING(id);

CREATE VIEW loginView
AS
SELECT idx,  id, pw, name_, email, nickname, phone, regDate FROM LOGIN INNER JOIN USERS USING(id);

SELECT * FROM loginView;

INSERT INTO SNS_INFO(idx, email, age, nickname, profile_image,  gender, birthday) VALUES (?, ?, ?, ?, ?, ?, ?);
```
