select * from all_users;

-- hr ������� ������ Ǯ�� ��й�ȣ�� hr�� ����
ALTER USER hr IDENTIFIED BY hr account unlock;

--shop ����(��Ű�� ����)
CREATE USER shop IDENTIFIED BY 12345;
create user javadb2 indentified by 12345;
--���� �ο�
--CONNECT => CREATE SESSION
--RESOURCE => CREATE TRIGGER,CREATE SEQUENCE,CREATE PROCEDURE, CREATE TABLE.....
GRANT CONNECT,RESOURCE TO shop;
ALTER USER JAVADB IDENTIFIED BY JAVADB account unlock;
CREATE USER javadb IDENTIFIED BY 12345;
GRANT CONNECT,RESOURCE TO JAVADB;
GRANT RESOURCE TO JAVADB;
grant sysdba to JAVADB;
--VIEW ���� �ο�
GRANT CREATE VIEW TO SCOTT;


--DBA_ : �����ͺ��̽� ���� ������ ���� ����ڸ� ��ȸ����
SELECT * FROM DBA_TABLES;



--����� ����
CREATE USER TEST IDENTIFIED BY 12345;
--user TEST lacks CREATE SESSION privilege; logon denied
GRANT CREATE SESSION TO TEST;

--����� ��й�ȣ ����
ALTER USER TEST IDENTIFIED BY 54321;
--����� ����
DROP USER TEST;
