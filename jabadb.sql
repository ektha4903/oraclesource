--JAVADB 안에 테이블 생성
--테이블 명 - userTBL
--NO정수형(4) PRIMARY KEY 제약조건명 pk_userTBL
--username 가변형 문자열(20) not null
--birthYear 정수형(4) not null
--addr 가변형 문자열(15) not null
--mobile 가변형 문자열(12)
CREATE TABLE userTBL(no number(4) CONSTRAINT PK_USERTBL PRIMARY KEY,
                     USERNAME VARCHAR2(20) NOT NULL,
                     BIRTHYEAR NUMBER(4) NOT NULL,
                     ADDR  VARCHAR2(15) NOT NULL,
                     MOBILE VARCHAR2(12));
                     
select * from usertbl;

--시퀀스 생성하기 -user_seq
CREATE SEQUENCE USER_SEQ;
--userTBL 안에 NO는 SEQUENCE 값으로 생성하여 테스트 데이터 5개 정도 삽입하기.
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'홍길동',1994,'SEOUL','01012345678');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'박길동',1993,'BUSAN','01012345671');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'최길동',1992,'SEOUL','01012345672');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'김길동',1996,'ULSAN','01012345673');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'주길동',1994,'YEOSU','01012345674');
commit;
SELECT * FROM USER_SEQ;