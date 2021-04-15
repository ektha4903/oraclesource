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

--BETWEEN
--20��,50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME,SALARY�� ��ȸ ��, �޿��� 5000~12000������ ����� ��ȸ�Ѵ�.
SELECT LAST_NAME,SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IN (20,50) AND SALARY BETWEEN 5000 AND 12000;
--������ 5000~12000 ���� �̿��� ������� LAST_NAME,SALARY�� ��ȸ
SELECT LAST_NAME,SALARY FROM employees WHERE SALARY NOT BETWEEN 5000 AND 12000;
--������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� LAST_NAME,EMPLOYEE_ID,HIRE_DATE�� ��ȸ�� �� ������� ������������ ����
--(��¥ �����ʹ� ''���̿� �־ ó��)
SELECT LAST_NAME,EMPLOYEE_ID,HIRE_DATE FROM employees WHERE hire_date BETWEEN '2008-02-20' AND '2008-05-01' ORDER BY hire_date DESC;
--2004�⵵�� ���� ������� LAST_NAME,HIRE_DATE�� ��ȸ�� �� �Ի��� �������� ������������
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

--LIKE
--2004�⵵�� ���� ��� ������� LAST_NAME �� HIRE_DATE�� ��ȸ�Ͽ� �Ի��� �������� �������� ����
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date;
--LAST_NAME�� u�� ���ԵǴ� ������� EMPLOYEE_ID,LAST_NAME�� ��ȸ�Ѵ�
SELECT EMPLOYEE_ID,LAST_NAME FROM employees WHERE LAST_NAME LIKE '%u%';
--LAST_NAME�� �� ��° ���ڰ� a�� ������� LAST_NAME ��ȸ
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '___a%';
--LAST_NAME�� A Ȥ�� E ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ORDER BY LAST_NAME;
--LAST_NAME�� A�� E ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%e' or LAST_NAME LIKE '%e%a%' ORDER BY LAST_NAME DESC;

--IS NULL
--�Ŵ����� ���� ������� LAST_NAME,JOB_ID ��ȸ
SELECT LAST_NAME,JOB_ID FROM employees WHERE MANAGER_ID IS NULL;
--ST_CLERK�� JOB_ID�� ���� ����� ���� �μ�ID ��ȸ, �� �μ���ȣ�� NULL�� ���� ����
SELECT DISTINCT DEPARTMENT_ID FROM employees WHERE JOB_ID NOT IN('ST_SLERK') AND DEPARTMENT_ID IS NOT NULL;
--COMMISSION_PCT�� NULL�� �ƴ� ����� �߿��� COMMISSION=SALARY*COMMISSION_PCT�� ���Ͽ� EMPLOYEE_ID,FIRST_NAME,JOB_ID ���
SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,SALARY*COMMISSION_PCT AS COMMISSION FROM employees WHERE COMMISSION_PCT IS NOT NULL;


--���ڿ� �Լ�
--FIRST_NAME�� Curtis�� ����� FIRST_NAME,LAST_NAME,PHONE_NUMBER,JOB_ID ��ȸ ��,JOB_ID ����� �ҹ��ڷ� ���
SELECT FIRST_NAME, LAST_NAME, phone_number, LOWER(JOB_ID) FROM employees WHERE FIRST_NAME='Curtis';
--�μ� ��ȣ�� 60,70,80,90�� ������� EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,JOB_ID ��ȸ 
--��, JOB_ID�� IT_PROG�� ����� ��� ���α׷��ӷ� ��ȯ�ؼ� ���
SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,REPLACE(job_id,'IT_PROG','���α׷���') FROM employees WHERE DEPARTMENT_ID IN (60,70,80,90);
--JOB_ID�� AD_PRES,PU_CLERK�� ������� EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,JOB_ID ��ȸ,\
--��, ������� FIRST_NAME�� LAST_NAME�� �����Ͽ� ���.
SELECT employee_id,FIRST_NAME||' '||LAST_NAME,DEPARTMENT_ID,JOB_ID FROM employees WHERE JOB_ID IN ('AD_PRES','PU_CLERK');