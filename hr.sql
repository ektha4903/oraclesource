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

--�ǽ�4
SELECT LAST_NAME,SALARY,DECODE(TRUNC(SALARY/2000,0),0,0.00,1,0.09,2,0.20,3,0.30,4,0.40,5,0.42,6,0.44,0.45) AS TEX_RATE FROM employees WHERE DEPARTMENT_ID=80;

--ȸ�� ���� �ִ� ���� �� �ּ� ������ ���� ��ȸ
SELECT MAX(SALARY)-MIN(SALARY) AS SAL_GAP FROM employees;
--�Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ
SELECT COUNT(DISTINCT MANAGER_ID) AS �Ŵ��� FROM employees;

--�μ��� ������ ���� ���Ͽ�, �μ���ȣ�� ������������ ���
SELECT DEPARTMENT_ID FROM employees;
SELECT DEPARTMENT_ID, COUNT(*) FROM employees GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;
--�μ��� �޿��� ��� ������ ����ϱ�(�μ���ȣ, ��� ������ �������� �ϰ� �μ���ȣ�� �������� ��ȸ
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) FROM employees GROUP BY DEPARTMENT_ID  ORDER BY DEPARTMENT_ID;
--������ ������ ���� ������� ���� ��ȸ
SELECT JOB_ID,COUNT(employee_id) FROM employees GROUP BY JOB_ID ORDER BY JOB_ID;


--��)�Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ���� ��ȸ, �Ŵ����� ���� ��� ����/�ּ� ������ 6000�̸� ����/�������� ���� ���
SELECT MANAGER_ID,MIN(SALARY) FROM employees WHERE MANAGER_ID IS NOT NULL GROUP BY MANAGER_ID HAVING MIN(SALARY)>=6000 ORDER BY MIN(SALARY) DESC;
SELECT MANAGER_ID,MIN(SALARY) FROM employees GROUP BY MANAGER_ID HAVING MANAGER_ID IS NOT NULL AND MIN(SALARY)>=6000 ORDER BY MIN(SALARY) DESC;


--JOIN �ǽ�
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;
--Q) �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� HIRE_DATE, LAST_NAME, MANAGER_ID ��� EMPLOYEES ���̺� SELF JOIN
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.MANAGER_ID FROM employees E1, employees E2 WHERE e1.manager_id = e2.employee_id AND E1.HIRE_DATE<E2.HIRE_DATE;
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.MANAGER_ID FROM employees E1 JOIN employees E2 ON e1.manager_id = e2.employee_id AND E1.HIRE_DATE<E2.HIRE_DATE;
--Q) ���� �̸��� T�� �����ϴ� ������ ��� ������� EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID ���
--(DEPARTMENTS�� LOCATION_ID�� LOCATIONS�� LOCATION_ID ���� �� CITY�� �˾Ƴ���)
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, l.city FROM employees E, LOCATIONS L, departments D WHERE d.location_id = l.location_id AND E.DEPARTMENT_ID = D.DEPARTMENT_ID AND L.CITY LIKE 'T%';
--Q) ��ġ ID�� 1700�̰�, ������� EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY ��ȸ DEPARTMENTS ���̺�� EMPLOYEES ����
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND d.location_id=1700;
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY FROM employees E JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND d.location_id=1700;
--Q) DEPARTMENT_NAME, LOCATION_ID, �� �μ��� ��� �� ��, �� �μ��� ��� ���� ��ȸ�ϱ�, ��� ������ �Ҽ��� 2�ڸ������� ǥ��
SELECT DEPARTMENT_NAME, LOCATION_ID, COUNT(*), ROUND(AVG(SALARY),2) FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME, LOCATION_ID ORDER BY LOCATION_ID;
SELECT DEPARTMENT_NAME, LOCATION_ID, COUNT(*), ROUND(AVG(SALARY),2) FROM employees E JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME, LOCATION_ID ORDER BY LOCATION_ID;
--Q) EXECUTIVE �μ����� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID ��ȸ
SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Executive';
--Q) �� ��� �� �Ҽ� �μ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� DEPARTMENT_ID, FIRST_NAME�� LAST_NAME ��ȸ
-- FIRST_NAME�� LAST_NAME �� ���� ���ؼ� �ϳ��� ����Ѵ�.
SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME FROM employees E1, employees E2 WHERE e1.DEPARTMENT_id = e2.department_id AND e1.salary<e2.salary AND e1.hire_date<e2.hire_date ORDER BY e1.department_id;


--��������
--Q) LAST_NAME�� u�� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� LAST_NAME,EMPLOYEE_ID ��ȸ
SELECT LAST_NAME, EMPLOYEE_ID FROM employees WHERE department_id IN (SELECT DEPARTMENT_ID FROM employees WHERE LAST_NAME LIKE '%u%');

--Q) EXEUTIVE �μ��� �ٹ��ϴ� ��� ������� DEPARTMENT_ID, LAST_NAME, JOB_ID ��ȸ
SELECT E.DEPARTMENT_ID, LAST_NAME, JOB_ID FROM employees E WHERE (e.department_id,'Executive') IN (SELECT e.department_id,DEPARTMENT_NAME FROM departments);

--Q) �Ҽ� �μ��� ��� �������� ���� ���� ������� LAST_NAME, ��տ���, �μ���ȣ, �޿� ��ȸ, �μ���ȣ,�޿��� ������������ ���� �� ���
-- �ζ��� ��� ó��(�μ���ȣ, �μ��� ��տ���)
SELECT LAST_NAME,AVG_SAL,E1.DEPARTMENT_ID,E1.SALARY 
FROM EMPLOYEES E1,(SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AS AVG_SAL FROM EMPLOYEES GROUP BY DEPARTMENT_ID) E2 
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.SALARY<E2.AVG_SAL;

--Q) JOB_ID�� 'SA_MAN'�� ������� �ִ� �������� ���� �޴� ������� LAST_NAME,JOB_ID,SALARY ��ȸ
SELECT LAST_NAME,JOB_ID,SALARY FROM employees WHERE SALARY>(SELECT MAX(SALARY) FROM employees WHERE JOB_ID = 'SA_MAN');

--Q) Ŀ�̼��� �޴� ������� �μ��� ������ ������ ������� LAST_NAME,DEPARTMENT_ID,SALARY ��ȸ, ���߿� ���� ������ �ۼ�
SELECT LAST_NAME,DEPARTMENT_ID,SALARY FROM employees WHERE (DEPARTMENT_ID,SALARY) IN 
(SELECT DEPARTMENT_ID,SALARY FROM employees WHERE COMMISSION_PCT IS NOT NULL);

--Q) LAST_NAME�� 'Davies'�� ������� ���߿� ���� ������� LAST_NAME,HIRE_DATE ��ȸ
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date > (SELECT hire_date FROM employees WHERE LAST_NAME = 'Davies');

--Q) LAST_NAME�� 'King'�� ����� �ų����� �ΰ� �ִ� ��� ������� LAST_NAME,SALARY ��ȸ
SELECT LAST_NAME, SALARY FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE LAST_NAME = 'King');

--Q) LAST_NAME�� 'Zlotkey'�� ����� ������ �μ����� �ٹ��ϴ� ��� ������� EMPLOYEE_ID,HIRE_DATE ��ȸ
SELECT EMPLOYEE_ID, HIRE_DATE FROM employees WHERE DEPARTMENT_ID IN (SELECT department_id FROM employees WHERE LAST_NAME = 'Zlotkey');

--Q) LAST_NAME�� 'Kochhar'�� ����� ������ ���� �� Ŀ�̼��� ���� ������� LAST_NAME, DEPARTMENT_ID,SALARY,COMMISSION_PCT ��ȸ
--��, 'Kochhar'�� ��� ������� �����Ѵ�.
SELECT E.LAST_NAME, E.DEPARTMENT_ID,E.SALARY,E.COMMISSION_PCT FROM employees E WHERE (SALARY,NVL(commission_pct,0)) IN 
(SELECT SALARY,NVL(commission_pct,0) FROM employees WHERE LAST_NAME = 'Kochhar') AND LAST_NAME!='Kochhar';