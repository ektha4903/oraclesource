--scott ������ ��� ���̺��� ��ȸ
select * from tab;

--bonus ���̺��� ��� ������ ��ȸ
select * from bonus; 

--emp ���̺��� ��� ������ ��ȸ
select * from emp;

--emp ���̺��� empno, ename�� ��ȸ
SELECT empno,ename from emp;

--emp ���̺��� empno,job,hiredate ��ȸ
select empno,job,hiredate from emp;

--�ߺ��� �� ���� : DISTINCT
select deptno from emp;
select distinct deptno from emp;

--��Ī
select empno from emp;
select empno as �����ȣ from emp;
select empno �����ȣ from emp;
select empno "�����ȣ" from emp;
select empno as "�����ȣ" from emp;


select ename,sal,sal*12+comm,comm from emp;
select ename,sal,sal*12+comm as ����,comm from emp;

--ename(�����),job(��å) ��Ī�� ���� �� emp ��ȸ
select ename as �����,job as ��å from emp;

-- ���� : ORDER BY �����ϰ��� �ϴ� �� �̸� + ���Ŀɼ�(ASC��������,DESC��������)
-- �ɼ� �� ���� �ڵ����� ��������
-- ename,sal ��ȸ(sal ��������)
select ename,sal from emp order by sal DESC;
select ename,sal from emp order by sal;

--��ü �����͸� ��ȸ�� �� SAL ��������
select * from emp order by sal DESC;

--empno,ename,job ��ȸ�� �� empno ��������
select empno,ename,job from emp order by empno ASC;

--�μ���ȣ�� ���������� �޿��� �������� �����ϱ�
select * from emp order by deptno ASC,sal DESC;


select empno as "EMPLOYEE_NO",ename as "EMPLOYEE_NAME",MGR AS "MANAGER",SAL AS "SALARY",COMM AS "COMMISSION", DEPTNO AS "DEPARTMENT_NO",JOB,HIREDATE FROM EMP
ORDER BY DEPTNO DESC,ENAME ASC;

--WHERE : ���ǿ� ���缭 ��ȸ
--�μ� ��ȣ�� 30���� ��� ��ȸ
select * from emp where deptno=30;
--��� ��ȣ�� 7782�� ��� ���� ��ȸ
select * from emp where empno=7782;
--�μ���ȣ�� 30�̰� �����å�� salesman�� ��� ��ȸ
select * from emp where deptno=30 and job='SALESMAN';
--�μ� ��ȣ�� 30�̰ų� �����å�� CLERK�� ��� ��ȸ
select * from emp where deptno=30 or job='clerk';

--��������� : * / + -
-- sal*12�� ���� 36000�� ��� ��ȸ
select * from emp where sal*12 = 36000;

--�񱳿����� : >, <, >=, <=
--sal�� ���� 3000�̻��� ��� ��ȸ
select * from emp where sal >= 3000;

--�޿��� 2500�̻��̰�, ������ analyst�� ��� ��ȸ
select * from emp where sal>=2500 and job='ANALYST';

--��� �̸��� ù���ڰ� F�� ���ų� ������ �͸� ��ȸ
select * from emp where ename >= 'F';

--������ MANAGER,SALESMAN,CLERK�� ��� ��ȸ
SELECT * FROM EMP WHERE JOB='MANAGER' OR JOB='SALESMAN' OR JOB='CLERK';

--��񱳿�����
-- = (����), !=(���� �ʴ�), <>(���� �ʴ�), ^=(���� �ʴ�)
--SAL�� 3000�� �ƴ� ��� ���� ��ȸ
SELECT * FROM EMP WHERE SAL !=3000;
SELECT * FROM EMP WHERE SAL <>3000;
SELECT * FROM EMP WHERE SAL ^=3000;

--�� ���� ������ : NOT
SELECT * FROM EMP WHERE NOT SAL=3000;

--IN : =
SELECT * FROM EMP WHERE JOB='MANAGER' OR JOB='SALESMAN' OR JOB='CLERK';
SELECT * FROM EMP WHERE JOB IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM EMP WHERE JOB!='MANAGER' AND JOB^='SALESMAN' AND JOB<>'CLERK';
SELECT * FROM EMP WHERE JOB NOT IN('MANAGER','SALESMAN','CLERK');

--�μ� ��ȣ�� 10,20 ��� ��ȸ(IN)
SELECT * FROM EMP WHERE DEPTNO in (10, 20);


--BETWEEN A AND B : Ư�� ������ �����͸� ��ȸ
--SAL 2000�̻� 3000����
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
--SAL 2000�̻� 3000���ϰ� �ƴ� ��� ��ȸ
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;


--LIKE �����ڿ� ���ϵ�ī��
--���ϵ� ī�� : _(� ���ڵ� �� ���� ���ڸ� �ǹ�),%(���̿� ������� ��� ����)
--��� �̸��� S�� �����ϴ� ��� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
--��� �̸��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '_L%';
--��� �̸��� AM�� ���ԵǾ� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';


--IS NULL
--NULL : ���� �������� ����/ �ش���� ����/ Ȯ������ ���� ��
SELECT * FROM EMP WHERE comm is null;
select * from emp where mgr is null;
select * from emp where not mgr is null;
select * from emp where mgr is not null;


--���� ������ : ������ - UNION(�ߺ��� ���� ���ŵ�), UNION ALL, ������ - MINUS, ������ - INTERSECT
--10���μ��� 20���μ� ��ȸ
SELECT * FROM EMP WHERE DEPTNO=10 UNION SELECT * FROM EMP WHERE DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO=10 UNION ALL SELECT * FROM EMP WHERE DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO=10 UNION SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP WHERE DEPTNO=10 UNION ALL SELECT * FROM EMP WHERE DEPTNO=10;

SELECT * FROM EMP MINUS SELECT * FROM EMP WHERE DEPTNO=10;

SELECT * FROM EMP INTERSECT SELECT * FROM EMP WHERE DEPTNO=10;

--20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ����� ���� �����ڸ� ����ؼ� ��ȸ�ϱ�
SELECT * FROM EMP WHERE DEPTNO IN (20,30) INTERSECT SELECT * FROM EMP WHERE SAL>2000;


--�Լ�
--�����Լ� : ����Ŭ���� �⺻���� �����ϴ� �Լ�
--����� ���� �Լ�

--���� �Լ� 1)��ҹ���
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
--ORACLE,oracle,Oracle => �Է°� �پ�
--where lower(title) like '%oracle%'

--���� �Լ� 2)����
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;
--ENAME�� ���̸� ���ϰ� ����
SELECT ENAME, LENGTH(ENAME) FROM EMP;
--ENAME ���̰� 5�̻��� ��� ��ȸ
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

--���� �Լ� 3) ���ڿ� ����
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5) FROM EMP;
--EMP ���̺��� ��� ��� �̸��� ����° ���ں��� ������ ����ϱ�(�� �̸�, ����°~)
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;

--���� �Լ� 4) Ư�� ���� ��ġ ã��
SELECT INSTR('HELLO, ORACLE!','L') AS ù��°, INSTR('HELLO, ORACLE!','L',5) AS �ι�°, INSTR('HELLO, RACLE!','L',2,2) AS ����° FROM DUAL;
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�.','�̰�') from dual;
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�.','�̰�',2) from dual;
SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�.','�̰�',2) from dual;
--��� �̸��� S�� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE INSTR(ENAME,'S')>0;

--���ڿ� �Լ� 5) ���ڿ� ��ü
SELECT REPLACE('�̰��� Oracle�̴�', '�̰���', 'This is') FROM DUAL;
--010-1234-5678, 010 1234 5678, 01012345678
SELECT '010-1234-5678', REPLACE('010-1234-5678','-',' '),REPLACE('010-1234-5678','-') FROM DUAL;

--���ڿ� �Լ� 6) ���ڿ� ����
--CONCAT() == ||
SELECT CONCAT(EMPNO,ENAME),CONCAT(EMPNO,CONCAT(':',ENAME)) FROM EMP WHERE ENAME='SMITH';
SELECT EMPNO||ENAME,EMPNO||':'||ENAME FROM EMP WHERE ENAME='SMITH';

--���ڿ� �Լ� 7) Ư�� ���� ���� - TRIM, LTRIM, RTRIM
SELECT '            �̰���             ',TRIM('       �̰���      ') FROM DUAL;
SELECT '            �̰���             ',LTRIM('       �̰���      ') FROM DUAL;
SELECT '[' || TRIM(' __ORACLE__ ') || ']' AS TRIM, '[' || LTRIM(' __ORACLE__ ') || ']' AS LTRIM, '[' || RTRIM(' __ORACLE__ ') || ']' AS RTRIM FROM DUAL;
SELECT '            �̰���             ',RTRIM('       �̰���      ') FROM DUAL;

--���ڿ� �Լ� 8) ���ڿ� �ݴ�� ó��
SELECT REVERSE('ORACLE') FROM DUAL;


--���� �Լ� : �ݿø�/�ø�/����/��������
--�ݿø�
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678,0) AS ROUND0, ROUND(1234.5678,1) AS ROUND1,
       ROUND(1234.5678,2) AS ROUND2, ROUND(1234.5678,-1) AS ROUND_MINUS, ROUND(1234.5678,-2) AS ROUND_MINUS2 FROM DUAL;
--����
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678,0) AS TRUNC0, TRUNC(1234.5678,1) AS TRUNC1,
       TRUNC(1234.5678,2) AS TRUNC2,TRUNC(1234.5678,-1) AS TRUNC_MINUS, TRUNC(1234.5678,-2) AS TRUNC_MINUS2 FROM DUAL;
--������ ���ڿ� ���� ����� ������ ã�� CEIL(ū����), FLOOR(���� ����)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;
--������
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL;


--��¥ �Լ� : SYSDATE (����Ŭ ������ ��ġ�� OS ���� ��¥�� �ð�)
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;
--�� ���� ������ ��¥ ���ϱ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;
--�Ի� 10�ֳ��� �Ǵ� ��¥ ���ϱ�
SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,120) FROM EMP;
--���� ��¥�� �������� �Ի� ��¥ 45�� �̸��� ��� ��ȸ
SELECT * FROM EMP WHERE ADD_MONTHS(HIREDATE,540)>SYSDATE;
--�� ��¥ ������ ���� : MONTHS_BETWEEN
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) < 540;
SELECT EMPNO,ENAME,HIREDATE,SYSDATE,MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1, MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3 FROM EMP;
--���ƿ��� ���� : NEXT_DAY, ���� ������ ��¥ : LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������'), LAST_DAY(SYSDATE) FROM DUAL;


--�ڷ��� ��ȯ �Լ�
--1) TO_CHAR() : ��¥, ���� �����͸� ���ڷ� ��ȯ
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS ���糯¥ FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MM') AS ����� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON') AS ����� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DD') AS �������� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DAY') AS �������� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH:MI:SS') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH12:MI:SS') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH:MI:SS PM') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS PM') AS ����ð� FROM DUAL;

--2)TO_NUMBER() : ���ڸ� ���� ������ �������� ��ȯ
SELECT 1300-'1500', '1300'+1500 FROM DUAL;
SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;
--invalid number
--SELECT 1300-'1,500', '1,300'+1500 FROM DUAL;
--SELECT 1300-TO_NUMBER('1,500'), TO_NUMBER('1,300')+1500 FROM DUAL;
SELECT 1300-TO_NUMBER('1,500','999,999'), TO_NUMBER('1,300','999,999')+1500 FROM DUAL;

--3)TO_DATE() : ���� �����͸� ��¥�� �����ͷ� ��ȯ
SELECT TO_DATE('2021-04-16') AS TODATE1, TO_DATE('20210416') AS TODATE2 FROM DUAL;
SELECT TO_DATE('2021-04-16') - TO_DATE('2021-04-12') FROM DUAL;

--4)��ó�� �Լ� - NVL(),NVL2()
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;
-- NVL2(�� ��,���� �ƴҰ�� ��ȯ�� ��,���� ��� ��ȯ�� ��)
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), SAL+NVL2(COMM,SAL*12+COMM,SAL*12) FROM EMP;

--5) DECODE �Լ�
SELECT EMPNO,ENAME,JOB,SAL,DECODE(JOB,
                                  'MANAGER', SAL*1.1,
                                  'SALESMAN',SAL*1.05,
                                  'ANALYST', SAL,
                                  SAL*1.03) AS UPSAL FROM EMP;
                                  
--6) CASE (DECODE ���� ���뼺�� ����)
SELECT EMPNO,ENAME,JOB,SAL,CASE JOB
                                WHEN 'MANAGER' THEN SAL*1.1
                                WHEN 'SALESMAN' THEN SAL*1.05
                                WHEN 'ANALYST' THEN SAL
                                ELSE  SAL*1.03
                                END AS UPSAL FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,CASE WHEN COMM IS NULL THEN '�ش���� ����'
                                WHEN COMM = 0 THEN '���� ����'
                                WHEN COMM > 0 THEN '���� : ' || COMM
                                END AS COMM_TEXT FROM EMP;
                                
-- [�ǽ�����]

-- EMP ���̺��� ������� �� ��� �ٹ��ϼ��� 21.5���̴�. �Ϸ� �ٹ� �ð��� 8�ð����� ������ �� ������� �Ϸ� �޿�(DAY_PAY)�� �ñ�(TIME_PAY)�� ����Ͽ� ����� ����Ѵ�. 
-- ��, �Ϸ� �޿��� �Ҽ��� ��° �ڸ����� ������, �ñ��� �� ��° �Ҽ��� �ݿø��Ͻÿ�.
SELECT EMPNO,ENAME,SAL, TRUNC(SAL/21.5,2) AS DAY_PAY, ROUND(SAL/21.5/8,1) AS TIME_PAYFROM EMP;
--EMP ���̺��� ������� �Ի���(HIREDATE)�� �������� 3������ ���� �� ù �����Ͽ� �������� �ȴ�. ������� �������� �Ǵ� ��¥(R_JOB)�� YYYY-MM-DD �������� �Ʒ��� 
--���� ����Ͻÿ�. ��, �߰�����(COMM)�� ���� ����� �߰� ������ N/A�� ����Ͻÿ�.
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������') AS R_JOB,NVL(TO_CHAR(COMM),'N/A') AS COMM FROM EMP;
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������') AS R_JOB,NVL2(COMM,TO_CHAR(COMM),'N/A') AS COMM FROM EMP;
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������') AS R_JOB, CASE WHEN COMM IS NULL THEN 'N/A'
                                                                                     WHEN COMM IS NOT NULL THEN ''|| COMM
                                                                                     END AS COMM FROM EMP;
       
SELECT COMM, NVL(TO_CHAR(COMM),'N/A') FROM EMP;
SELECT COMM, NVL(COMM,'0') FROM EMP;

--�ǽ�3
--EMP ���̺��� ��� ����� ������� ���� ����� ��� ��ȣ(MGR)�� ������ ���� ������ �������� ��ȯ�ؼ� CHG_MGR ���� ����Ͻÿ�.
--���ӻ���� ��� ��ȣ�� �������� ���� ��� : 0000
--���ӻ���� ��� ��ȣ �� ���ڸ��� 75�� ��� : 5555
--���ӻ���� ��� ��ȣ �� ���ڸ��� 76�� ��� : 6666
--���ӻ���� ��� ��ȣ �� ���ڸ��� 77�� ��� : 7777
--���ӻ���� ��� ��ȣ �� ���ڸ��� 78�� ��� : 8888
--�� �� ���� ��� ��� ��ȣ�� ��� : ���� ���� ����� �����ȣ �״�� ���
SELECT EMPNO,ENAME,MGR,DECODE(SUBSTR(TO_CHAR(MGR),1,2),
                        NULL,'0000',
                        '75','5555',
                        '76','6666',
                        '77','7777',
                        '78','8888',
                        SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR FROM EMP;
SELECT EMPNO,ENAME,MGR, CASE WHEN MGR IS NULL THEN '0000'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
                             WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
                             ELSE TO_CHAR(MGR)
                             END AS CHG_MGR FROM EMP;
                             
-- ������ �Լ� : SUM,COUNT, MAX, MIN, AVERAGE
SELECT SUM(COMM) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*) FROM EMP WHERE DEPTO=30;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(DISTINCT SAL),COUNT(SAL) FROM EMP;
SELECT MAX(SAL), MIN(SAL) FROM EMP;
SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;

--�μ� ��ȣ�� 20�� ����� ���� ���� �ٹ��� ��� ��ȸ
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20;

SELECT AVG(SAL) FROM EMP;

--GROUP BY : ��� ���� ���ϴ� ���� ��� ���
SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO;
--�μ���ȣ, ��å�� ��� �޿� ���ϱ�
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB;
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB;

--HAVING �� : GROUP BY ���� ������ �� �� ���
--�� �μ��� ��å�� ��� �޿��� ���ϵ�, ��� �޿��� 2000�̻��� �׷� ���
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;
--�μ��� ��å�� ��� �޿��� 500 �̻��� ������� �μ���ȣ, ��å, �μ��� ��å�� ��ձ޿� ��ȸ
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=500 ORDER BY DEPTNO,JOB;
--WHERE�� �׷쳻�� ������ �� �� ����. WHERE�� ��¹��� ������ �ɾ� �ִ� ��
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP WHERE AVG(SAL)>=500 GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB;

-- ��) �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ����� ����ϱ� ��,��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ����� ���
SELECT DEPTNO,FLOOR(AVG(SAL)),MAX(SAL),MIN(SAL),COUNT(EMPNO) FROM EMP GROUP BY DEPTNO ;
-- ��) ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB,COUNT(EMPNO) FROM EMP GROUP BY JOB HAVING COUNT(JOB)>=3;
-- ��) ������� �Ի翬���� �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT TO_CHAR(HIREDATE,'YYYY') AS �Ի翬�� ,DEPTNO, COUNT(EMPNO) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;

SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP WHERE SAL<=3000 GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;


--JOIN
--�����(INNER JOIN, ��������, �ܼ�����)
SELECT * FROM DEPT;
SELECT * FROM EMP;
--column ambiguously defined
SELECT EMPNO,ENAME,EMP.DEPTNO,DNAME FROM EMP,DEPT WHERE emp.deptno = dept.deptno;
--��Ī ó��
SELECT EMPNO,ENAME,E.DEPTNO,DNAME FROM EMP E,DEPT D WHERE E.deptno = D.deptno;
--ī�׽þ�(���� �� �ִ� ��� ����) ����
SELECT * FROM EMP,DEPT ORDER BY EMPNO;
--EMP ���̺��� DEPNO�� DEPT ���̺��� DEPTNO�� ��ġ�ϴ� ������� �����ȣ, �̸�, �μ���ȣ, �μ��� ��ȸ 
--��, �޿��� 3000�̻��� ��� ���
SELECT EMPNO,ENAME,EMP.deptno,DNAME FROM EMP,DEPT WHERE emp.deptno = dept.deptno AND SAL>=3000;

--EMP���̺� ��Ī�� E��, DEPT���̺� ��Ī�� D�� �Ͽ� �޿��� 2500 �̻��̰�, �����ȣ�� 9999������ ������� �������
--EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC�� ���
SELECT EMPNO,ENAME,E.SAL,E.DEPTNO,D.DNAME,D.LOC FROM EMP E, DEPT D WHERE e.deptno = d.deptno AND E.SAL>=2500 AND E.EMPNO<=9999;
--EMP ���̺� ��Ī�� E��, SALGRADE ���̺� ��Ī�� S�� �Ͽ� �� ����� ������ ����� �޿� ��� ������ ����ϱ�.
--�� ����
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,E.COMM,E.DEPTNO,S.GRADE FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN s.losal AND s.hisal ;
SELECT * FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN s.losal AND s.hisal ;

--��ü����(SELF JOIN) : ������ �� �� �ι�° ���̺��� �ڱ� �ڽ�
SELECT * FROM EMP;
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO;

--�ܺ�����
--���� �ܺ� ���� WHERE TABLE1.COL1 = TABLE2.COL1(+)
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO(+);
--������ �ܺ� ���� WHERE TABLE1.COL1(+) = TABLE2.COL1
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR(+)=E2.EMPNO;
-- + ��ȣ�� ���̴� �ܺ� ���� ����� ��ü �ܺ� ���� ���� �Ұ�

--ǥ�ع��� ���� 
-- NATURAL JOIN(�����)
SELECT E.EMPNO,E.ENAME,DEPTNO,D.DNAME FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO,E.EMPNO;
--JOIN~ON
SELECT E.EMPNO,E.ENAME,E.DEPTNO,D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO = d.deptno ORDER BY DEPTNO,E.EMPNO;
-- OUTER JOIN~ON
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1 LEFT OUTER JOIN EMP E2 
ON E1.MGR=E2.EMPNO ORDER BY E1.EMPNO;
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1 RIGHT OUTER JOIN EMP E2 
ON E1.MGR=E2.EMPNO ORDER BY E1.EMPNO;
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1 FULL OUTER JOIN EMP E2 
ON E1.MGR=E2.EMPNO ORDER BY E1.EMPNO;

--��) �� �μ��� ���(�޿�),�ִ�(�޿�),�ּ�(�޿�),������� ����ϱ� ��,�μ���ȣ,�μ���,���,�ִ�,�ּ�,����� ���·� ���
--EMP ���̺�� DEPT ���̺� ����
SELECT * FROM DEPT;
SELECT D.DEPTNO,D.DNAME, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO GROUP BY D.deptno,D.DNAME ;
SELECT D.DEPTNO,D.DNAME, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO GROUP BY D.deptno,D.DNAME ;
--��) ��� �μ������� ��� ������ �μ���ȣ,�μ���,�����ȣ,�����,����,�޿� ���·� ����ϱ�
--EMP ���̺�� DEPT ���̺� ����
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL FROM DEPT D LEFT OUTER JOIN EMP E ON D.DEPTNO=e.deptno;
--��) �޿��� 2õ �ʰ��� ������� �μ� ����, ��� ������ ����ϱ�(SQL ǥ�� �������� �ۼ�)
-- �μ���ȣ, �μ���, �����ȣ, �����, �޿� ������ ���
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E JOIN DEPT D ON E.SAL>2000;


--������ ���̺� ����
--�������
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPNO_E2, E3.EMPNO AS EMPNO_E3 FROM EMP E1, EMP E2,EMP E3 WHERE E1.EMPNO = E2.EMPNO AND E2.EMPNO = E3.EMPNO;
--ǥ�ع��
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPNO_E2, E3.EMPNO AS EMPNO_E3 FROM EMP E1 JOIN EMP E2 ON E1.EMPNO = E2.EMPNO JOIN EMP E3 ON E2.EMPNO = E3.EMPNO;
--��� �μ� ������ ��� ������ �μ���ȣ, �μ���, �����ȣ, �����, ����, �Ŵ�����ȣ, �޿�, LOSAL, HISAL, GRADE, ���ӻ���� ������ ��� 
--��, �μ���ȣ, ����̸� ������ �������� ����
--��������
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME FROM EMP E, DEPT D WHERE e.deptno = D.DEPTNO ORDER BY DEPTNO;
--�ܺ�����(�������� ��������)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME FROM EMP E, DEPT D WHERE e.deptno(+) = D.DEPTNO ORDER BY DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.MGR, E.SAL, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) = D.DEPTNO AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) AND E.MGR = E2.EMPNO(+) ORDER BY D.DEPTNO, E.ENAME; 
--ǥ��
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.MGR, E.SAL, S.LOSAL, S.HISAL, S.GRADE, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E RIGHT OUTER JOIN DEPT D ON e.deptno = d.deptno LEFT OUTER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E.MGR = E2.EMPNO ORDER BY d.deptno, E.ENAME;


--���� ���� : SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� SQL�� ���ο��� ����ϴ� SELECT��
-- JONES ��� ����� �޿����� ���� �޿��� �޴� ��� ��ȸ
SELECT SAL FROM EMP WHERE ENAME='JONES'; --2975
SELECT * FROM EMP WHERE SAL>2975;
--�������� ���
SELECT * FROM EMP WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='JONES');

--ALLEN ����� �߰����纸�� ���� �߰������� �޴� ��� ��ȸ
SELECT * FROM EMP WHERE COMM>(SELECT COMM FROM EMP WHERE ENAME='ALLEN');
--WARD ���� ���� �Ի��� ��� ��ȸ
SELECT * FROM EMP WHERE hiredate<(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');
--20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ����(�����ȣ,�����,����,�޿�)�� �ҼӺμ�����(�μ���ȣ,�μ���,������ġ)�� ��ȸ
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,d.deptno, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=20 AND SAL>(SELECT AVG(SAL) FROM EMP);
--�� �μ��� �ְ� �޿��� �����ϰų� ū �޿��� �޴� ��� ������ ��ȸ
--single-row subquery returns more than one row(>= : ������ ��������) => IN, ANY, ALL, EXISTS �����
SELECT * FROM EMP WHERE SAL >=(SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
--�� �μ��� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ��ȸ
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT * FROM EMP WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
--30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�
SELECT * FROM EMP WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);
--30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

--ALL
SELECT * FROM EMP WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

--EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);
SELECT EMPNO,DEPTNO FROM EMP WHERE EXISTS (SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20,30) AND EMP.DEPTNO=DEPT.DEPTNO);

--����1) ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ������� ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.JOB,E.EMPNO,E.ENAME,E.SAL,D.DEPTNO,D.DNAME FROM EMP E, DEPT D WHERE e.deptno=d.deptno AND E.JOB = (SELECT JOB FROM EMP WHERE ENAME='ALLEN');
--����2) ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ�����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�.
--��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE FROM EMP E, DEPT D, SALGRADE S 
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.SAL > (SELECT AVG(SAL) FROM EMP) ORDER BY E.SAL DESC, E.EMPNO ASC;

--���߿� ��������
--�ڽ��� �μ� ������ �ְ� ������ ������ �޿��� �޴� ��� ����
SELECT DEPTNO,MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT * FROM EMP WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MAX(SAL) FROM EMP GROUP BY DEPTNO);

--��������(FROM ���� ����ϴ� �������� : �ζ��� ��)
--Ư�� ���̺� ��ü �����Ͱ� �ƴ� SELECT���� ���� �Ϻ� �����͸� ���� ������ �� �� ��Ī �ٿ��� ����ϴ� ���
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC 
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

--��������(SELECT ���� ����ϴ� �������� : ��Į�� ��������)
SELECT EMPNO,ENAME,JOB,SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE, DEPTNO,
                           (SELECT DNAME FROM DEPT WHERE E.DEPTNO=DEPT.DEPTNO) AS DNAME FROM EMP E;
                           
--��) 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ������� ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E1.EMPNO,E1.ENAME,E1.JOB,E1.DEPTNO,D1.DNAME,D1.LOC 
FROM EMP E1,DEPT D1 WHERE E1.DEPTNO=d1.deptno AND e1.deptno=10 AND E1.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO=30);

--��) ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ����ϴ� SQL���� �ۼ��Ͻÿ�
--��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
--������� �ʴ� ���
SELECT EMPNO,ENAME,SAL,(SELECT GRADE FROM SALGRADE WHERE E1.SAL BETWEEN LOSAL AND HISAL) AS GRADE FROM EMP E1
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN');

--������ ����
--���̺� ����(���̺� ������ ������ ��� ����)
create table dept_temp as select * from dept;
select * from dept_temp;

--INSERT ���� ����
INSERT INTO DEPT_TEMP VALUES(50,'DATABASE','SEOUL');
INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(50,'DATABASE','SEOUL');

INSERT INTO DEPT_TEMP(DEPTNO,DNAME) VALUES(60,'NETWORK');
INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(70,'WEB',NULL);
--"not enough values"
INSERT INTO DEPT_TEMP VALUES(70,'DATABASE2');
--value larger than specified precision allowed for this column
INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(800,'DATABASE','SEOUL');

--���̺� ������ ����
create table EMP_temp as select * from EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP VALUES(9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',4000,NULL,10);
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES(1111,'������','MANAGER',NULL,'2003-01-01',5000,1000,10);
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) VALUES(2222,'����ȣ','MANAGER',1111,SYSDATE,5000,NULL,10);

--EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1�� ������� EMP_TEMP �߰�
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
SELECT e.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO
FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =1; 

COMMIT;

--update : ������ ����
--update ������ ���̺� �� set ������ �� �� = ������ ��, ������ �� �� = ������ ��, ������ �� �� = ������ �� where ����(where���� �ʼ� �ƴ�)
select * from dept_temp;
--���̺��� Ư�� �� ���� ��ü ����
UPDATE DEPT_TEMP SET LOC = 'SEOUL';
--���̺��� Ư�� �� ���� ���ǿ� ���� ����
UPDATE DEPT_TEMP SET LOC = 'SEOUL' WHERE DEPTNO=80;
ROLLBACK;

SELECT * FROM EMP_TEMP;
--�޿��� 3000������ ����� �߰������� 50���� ����
UPDATE EMP_TEMP SET COMM = 50 WHERE SAL<=3000;

--���� ������ ����Ͽ� ������ ����
create table dept_temp2 as select * from dept;
select * from dept_temp2;

UPDATE DEPT_TEMP2 SET (DNAME,LOC) = (SELECT DNAME,LOC FROM DEPT WHERE DEPTNO=40)
WHERE DEPTNO=30;

ROLLBACK;

UPDATE DEPT_TEMP2 SET LOC = 'SEOUL' WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME = 'OPERATIONS');

--DELETE : ���̺� �ִ� ������ ����
--DELETE ���̺�� WHERE ��������
--DELETE FROM ���̺�� WHERE ��������

CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP2;
ROLLBACK;
--��ü ����
DELETE EMP_TEMP2;
--�κ� ����
--JOB�� MANAGER�� ��� ����
DELETE FROM EMP_TEMP2 WHERE JOB='MANAGER';
--���� ������ ����Ͽ� ������ ����
--�޿� ����� 3����̰�, 30�� �μ��� ����� ����
DELETE FROM EMP_TEMP2 WHERE EMPNO IN
(SELECT EMPNO FROM EMP_TEMP2 E,SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.grade=3 AND E.DEPTNO=30);

--EMP_TEMP2 ���̺��� �޿��� 5000 �̻��� ��� ����
DELETE FROM EMP_TEMP2 WHERE SAL>=5000;

--�ǽ�
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM EXAM_EMP;
INSERT INTO EXAM_EMP VALUES(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);
INSERT INTO EXAM_EMP VALUES(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);
INSERT INTO EXAM_EMP VALUES(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
INSERT INTO EXAM_EMP VALUES(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
INSERT INTO EXAM_EMP VALUES(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);
INSERT INTO EXAM_EMP VALUES(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);
INSERT INTO EXAM_EMP VALUES(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);
INSERT INTO EXAM_EMP VALUES(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,NULL,80);

UPDATE EXAM_EMP SET DEPTNO = 70 WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO = 50);
UPDATE EXAM_EMP SET SAL=SAL*1.1, DEPTNO=80 WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO=60);
DELETE FROM EXAM_EMP WHERE EMPNO IN (SELECT EMPNO FROM EXAM_EMP E,SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.grade=5);
COMMIT;

-- Ʈ����� : �۾� ������ �ּ� ����
-- COMMIT(�ݿ�) / ROLLBACK(���)

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;
--DML ����
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO=40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;
ROLLBACK; --���
COMMIT;   --�ݿ�

--���� : � Ȱ���� ���� �ð��̳� �Ⱓ ������ ���̽� ������ �������� ���� �����ͺ��̽����� ���� �۾��� ������ ��
--      ������ �����ϱ���� ��ü �Ⱓ

SELECT * FROM DEPT_TCL;
DELETE FROM DEPT_TCL WHERE DEPTNO=50;
COMMIT;

UPDATE DEPT_TCL SET LOC = 'SEOUL' WHERE DEPTNO=30;
COMMIT;


--������ ���Ǿ�(DDL) : ���� ��ü�� ����, ����, ���� ��� ���� => Auto commit���� (rollback �ȵ�)
--CREATE, ALTER, DROP

--���̺� ����
--CREATE TABLE ���̺��(��1 �̸� �ڷ���, ��2 �̸� �ڷ���.....);
--���̺�� ���� ��Ģ : ���ڷ� ����(����,�ѱ�,����0~9,Ư������$,_,# ����) => ���۸� ���ڷ�/���̺���� 30 BYTE ����/���� ����� ������ ���̺� �̸��� �ߺ� �ȵ�.
--                  Ű����� ���̺�� ��� �Ұ�(SELECT,DELETE ...)
CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4), 
    ENAME VARCHAR2(10), --����Ÿ��
    JOB VARCHAR2(9), 
    MGR NUMBER(4), 
    HIREDATE DATE, 
    SAL NUMBER(7,2), -- ��ü �ڸ����� 7�ڸ��ε� �� �� �Ҽ��� �ڸ����� 2�ڸ��� �ϰڴ�.
    COMM NUMBER(7,2), 
    DEPT NUMBER(2)
);

--����Ÿ�� : CHAR(10): �������� ������, NCHAR(10): �����ڵ� �������� ������, VARCHAR2(10): �������� ������(����Ʈ ����), NVARCHAR2(10): �����ڵ� �������� ������
--(N:�����ڵ�, V:Variable ����)

CREATE TABLE TEST(
    ID NUMBER(4), NAME VARCHAR2(3));
DESC TEST;
--value too large for column "SCOTT"."TEST"."NAME" (actual: 9, maximum: 3)
INSERT INTO TEST(ID,NAME) VALUES(10,'ȫ�浿');
INSERT INTO TEST(ID,NAME) VALUES(10,'JDS');

CREATE TABLE TEST2(
    ID NUMBER(4), NAME NCHAR(3)); --NCHAR : ���� �״���� ������ �ǹ�(���� ���̸� ����ϰ���)
INSERT INTO TEST2(ID,NAME) VALUES(10,'ȫ�浿');
INSERT INTO TEST2(ID,NAME) VALUES(20,'��');
SELECT * FROM TEST2 WHERE NAME = '��';


CREATE TABLE TEST3(
    ID NUMBER(4), NAME NVARCHAR2(3));--NVARCHAR2 : ���� �״���� ������ �ǹ�(���� ���̸� ����ϰ���)
INSERT INTO TEST3(ID,NAME) VALUES(10,'ȫ�浿');
INSERT INTO TEST3(ID,NAME) VALUES(20,'��');

CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT WHERE DEPTNO=30;
CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;

--DROP : ����
DROP TABLE DEPT_DDL2;

--ALTER : ����
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;
--���̺� �÷� �߰��ϱ�
ALTER TABLE EMP_ALTER ADD HP VARCHAR(20);
--�� �̸� �����ϱ�
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;
--�� �ڷ����̳� ���� �����ϱ�
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;
--Ư�� ���� ����
ALTER TABLE EMP_ALTER DROP COLUMN TEL;
--���̺��� �̸� ���� : RENAME
RENAME EMP_ALTER TO EMP_RENAME;
DESC emp_rename;

--�ǽ�
CREATE TABLE MEMBER(
    ID NCHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL NVARCHAR2(50),
    AGE NUMBER(7,2)
    );
ALTER TABLE MEMBER ADD BIGO NVARCHAR2(20);
ALTER TABLE MEMBER MODIFY BIGO NVARCHAR2(30);
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;
UPDATE MEMBER SET REMARK = '';
DROP TABLE MEMBER;
SELECT * FROM MEMBER;

INSERT INTO MEMBER(ID,NAME,ADDR,NATION,EMAIL,AGE) VALUES('hong1234','ȫ�浿','����� ���α� ������','���ѹα�','hong123@naver.com',25);



