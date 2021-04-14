-- hr에 있는 모든 테이블 확인
select * from tab;

--employees 모든 테이블 확인
select * from employees;

--employees 테이블의 first_name,last_name,j0b_id만 조회
select first_name,last_name,job_id from employees;

--사원번호가 176인 사람의 LAST_NAME과 부서번호를 조회한다
select last_name,department_id from employees where employee_id=176;
--연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select last_name,salary from employees where salary>=12000;
--연봉이 5000에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회한다.
select last_name,salary from employees where salary<5000 or salary>12000;

--20번, 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳순으로 조회(오름차순)
SELECT LAST_NAME,DEPARTMENT_ID FROM employees WHERE department_id IN (20, 50) ORDER BY LAST_NAME,department_id;
--커미션(COMMISSION)을 버는 모든 사원들의 LAST_NAME,SALARY,COMMISSION_PCT를 조회
--SALARY,COMMISSION_PCT 내림차순으로 정렬
SELECT LAST_NAME,SALARY,COMMISSION_PCT FROM employees WHERE COMMISSION_PCT>=0 ORDER BY SALARY,COMMISSION_PCT DESC;
--SALARY이 2500,3500,7000이 아니며 직업이 SA-REP 혹은 ST_CLERK인 사원 조회
SELECT * FROM employees WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA-REP', 'ST_CLERK');
--고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 LAST_NAME,EMPLOYEE_ID,HIRE_DATE를 조회한 후 고용일자 내림차순으로 정렬
--(날짜 데이터는 ''사이에 넣어서 처리)
SELECT LAST_NAME,EMPLOYEE_ID,HIRE_DATE FROM employees WHERE '2008-02-20'<= hire_date AND hire_date<='2008-05-01' ORDER BY hire_date DESC;
--2004년도에 고용된 사람들의 LAST_NAME,HIRE_DATE를 조회한 후 입사일 기준으로 오름차순정렬
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date>='2004-01-01' AND hire_date<'2005-01-01' ORDER BY hire_date;