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