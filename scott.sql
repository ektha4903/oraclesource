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




