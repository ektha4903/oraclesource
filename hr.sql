-- hr�� �ִ� ��� ���̺� Ȯ��
select * from tab;

--employees ��� ���̺� Ȯ��
select * from employees;

--employees ���̺��� first_name,last_name,j0b_id�� ��ȸ
select first_name,last_name,job_id from employees;

--�����ȣ�� 176�� ����� LAST_NAME�� �μ���ȣ�� ��ȸ�Ѵ�
select last_name,department_id from employees where employee_id=176;
--������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
select last_name,salary from employees where salary>=12000;
--������ 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
select last_name,salary from employees where salary<5000 or salary>12000;

--20��, 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ������� ��ȸ(��������)
SELECT LAST_NAME,DEPARTMENT_ID FROM employees WHERE department_id IN (20, 50) ORDER BY LAST_NAME,department_id;
--Ŀ�̼�(COMMISSION)�� ���� ��� ������� LAST_NAME,SALARY,COMMISSION_PCT�� ��ȸ
--SALARY,COMMISSION_PCT ������������ ����
SELECT LAST_NAME,SALARY,COMMISSION_PCT FROM employees WHERE COMMISSION_PCT>=0 ORDER BY SALARY,COMMISSION_PCT DESC;
--SALARY�� 2500,3500,7000�� �ƴϸ� ������ SA-REP Ȥ�� ST_CLERK�� ��� ��ȸ
SELECT * FROM employees WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA-REP', 'ST_CLERK');
--������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� LAST_NAME,EMPLOYEE_ID,HIRE_DATE�� ��ȸ�� �� ������� ������������ ����
--(��¥ �����ʹ� ''���̿� �־ ó��)
SELECT LAST_NAME,EMPLOYEE_ID,HIRE_DATE FROM employees WHERE '2008-02-20'<= hire_date AND hire_date<='2008-05-01' ORDER BY hire_date DESC;
--2004�⵵�� ���� ������� LAST_NAME,HIRE_DATE�� ��ȸ�� �� �Ի��� �������� ������������
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date>='2004-01-01' AND hire_date<'2005-01-01' ORDER BY hire_date;