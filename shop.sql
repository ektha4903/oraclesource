CREATE TABLE MEMBER(
        userNo number(8) not null primary key,
        userName varchar2(20) not null);
        
CREATE SEQUENCE MEMBER_SEQ;

SELECT MEMBER_SEQ.CURRVAL FROM DUAL;

SELECT * FROM MEMBER;