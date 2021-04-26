--PL/SQL
 --화면출력
SET SERVEROUTPUT ON;
BEGIN 
 DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL');
END;

create table dept_record;
CREATE TABLE DEPT_RECORD AS SELECT * FROM SCOTT.DEPT;


--커서 : select문 또는 데이터 조직어 같은 sql문 실행시 해당 sql문을 처리하는 정보를 저장한 메모리 공간을 가리키는 포인터
--명시적 커서/ 묵시적 커서
DECLARE
    V_DEPT_ROW SCOTT.DEPT
BEGIN
END;


--오류 - 컴파일 에러 / 문법 오류 / 런타임 에러 

CREATE OR REPLACE PROCEDURE PRO_NOPARAM_IN 
    (PARAM1 IN NUMBER, 
     PARAM2 NUMBER,
     PARAM3 NUMBER:=3,
     PARAM4 NUMBER DEFAULT 4)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('PARAM1 :'||PARAM1);
    DBMS_OUTPUT.PUT_LINE('PARAM2 :'||PARAM2);
    DBMS_OUTPUT.PUT_LINE('PARAM3 :'||PARAM3);
    DBMS_OUTPUT.PUT_LINE('PARAM4 :'||PARAM4);
END;
 /
 
 
 CREATE OR REPLACE PROCEDURE PRO_NOPARAM_OUT 
    (IN_EMPNO IN SCOTT.EMP.EMPNO%TYPE,
    OUT_ENAME OUT SCOTT.EMP.ENAME%TYPE, --OUT(프로시저
    OUT_SAL OUT SCOTT.EMP.SAL%TYPE)
IS
BEGIN
   SELECT ENAME,SAL INTO OUT_ENAME,OUT_SAL
   FROM SCOTT.EMP
   WHERE EMPNO=IN_EMPNO;
END;
 /
  DECLARE
    V_ENAME SCOTT.EMP.ENAME%TYPE;
    V_SAL SCOTT.EMP.SAL%TYPE;
 BEGIN
    PRO_PARAM_OUT(7788,V_ENAME,V_SAL);
    DBMS_OUTPUT.PUT_LINE('ENAME :'||V_ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL :'||V_SAL);
 END;
 /
 
 
 
 create OR REPLACE PROCEDURE register_user
    (
    username in usertbl.username%type,
    birthyear usertbl.birthyear%type,
    addr usertbl.addr%type,
    mobile usertbl.mobile%type
    )
is
begin
    insert into usertbl(no,username,birthyear,addr,mobile)
    values(user_seq.nextval,username,birthyear,addr,mobile);
    commit;
    dbms_output.put_line(username || birthyear || addr || mobile);
end;
/

execute register_user('대조영','1996','부산시','01012345678');
SELECT * FROM USERTBL;
