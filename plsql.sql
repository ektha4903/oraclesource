--PL/SQL
 --ȭ�����
SET SERVEROUTPUT ON;
BEGIN 
 DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL');
END;

create table dept_record;
CREATE TABLE DEPT_RECORD AS SELECT * FROM SCOTT.DEPT;


--Ŀ�� : select�� �Ǵ� ������ ������ ���� sql�� ����� �ش� sql���� ó���ϴ� ������ ������ �޸� ������ ����Ű�� ������
--����� Ŀ��/ ������ Ŀ��
DECLARE
    V_DEPT_ROW SCOTT.DEPT
BEGIN
END;


--���� - ������ ���� / ���� ���� / ��Ÿ�� ���� 

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
    OUT_ENAME OUT SCOTT.EMP.ENAME%TYPE, --OUT(���ν���
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

execute register_user('������','1996','�λ��','01012345678');
SELECT * FROM USERTBL;
