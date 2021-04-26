--JAVADB �ȿ� ���̺� ����
--���̺� �� - userTBL
--NO������(4) PRIMARY KEY �������Ǹ� pk_userTBL
--username ������ ���ڿ�(20) not null
--birthYear ������(4) not null
--addr ������ ���ڿ�(15) not null
--mobile ������ ���ڿ�(12)
CREATE TABLE userTBL(no number(4) CONSTRAINT PK_USERTBL PRIMARY KEY,
                     USERNAME VARCHAR2(20) NOT NULL,
                     BIRTHYEAR NUMBER(4) NOT NULL,
                     ADDR  VARCHAR2(15) NOT NULL,
                     MOBILE VARCHAR2(12));
                     
select * from usertbl;

--������ �����ϱ� -user_seq
CREATE SEQUENCE USER_SEQ;
--userTBL �ȿ� NO�� SEQUENCE ������ �����Ͽ� �׽�Ʈ ������ 5�� ���� �����ϱ�.
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'ȫ�浿',1994,'SEOUL','01012345678');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'�ڱ浿',1993,'BUSAN','01012345671');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'�ֱ浿',1992,'SEOUL','01012345672');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'��浿',1996,'ULSAN','01012345673');
INSERT INTO userTBL(NO,USERNAME,BIRTHYEAR,ADDR,MOBILE) VALUES(user_seq.NEXTVAL,'�ֱ浿',1994,'YEOSU','01012345674');
commit;
SELECT * FROM USER_SEQ;