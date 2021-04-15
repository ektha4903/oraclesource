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

--BETWEEN
--20번,50번 부서에서 근무하는 모든 사원들의 LAST_NAME,SALARY를 조회 단, 급여는 5000~12000사이의 사원만 조회한다.
SELECT LAST_NAME,SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IN (20,50) AND SALARY BETWEEN 5000 AND 12000;
--연봉이 5000~12000 범위 이외인 사람들의 LAST_NAME,SALARY를 조회
SELECT LAST_NAME,SALARY FROM employees WHERE SALARY NOT BETWEEN 5000 AND 12000;
--고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 LAST_NAME,EMPLOYEE_ID,HIRE_DATE를 조회한 후 고용일자 내림차순으로 정렬
--(날짜 데이터는 ''사이에 넣어서 처리)
SELECT LAST_NAME,EMPLOYEE_ID,HIRE_DATE FROM employees WHERE hire_date BETWEEN '2008-02-20' AND '2008-05-01' ORDER BY hire_date DESC;
--2004년도에 고용된 사람들의 LAST_NAME,HIRE_DATE를 조회한 후 입사일 기준으로 오름차순정렬
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY hire_date;

--LIKE
--2004년도에 고용된 모든 사람들의 LAST_NAME 및 HIRE_DATE를 조회하여 입사일 기준으로 오름차순 정렬
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date;
--LAST_NAME에 u가 포함되는 사원들의 EMPLOYEE_ID,LAST_NAME을 조회한다
SELECT EMPLOYEE_ID,LAST_NAME FROM employees WHERE LAST_NAME LIKE '%u%';
--LAST_NAME에 네 번째 글자가 a인 사원들의 LAST_NAME 조회
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '___a%';
--LAST_NAME에 A 혹은 E 글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME으로 오름차순
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ORDER BY LAST_NAME;
--LAST_NAME에 A와 E 글자가 있는 사원들의 LAST_NAME을 조회하여 LAST_NAME으로 내림차순
SELECT LAST_NAME FROM employees WHERE LAST_NAME LIKE '%a%e' or LAST_NAME LIKE '%e%a%' ORDER BY LAST_NAME DESC;

--IS NULL
--매니저가 없는 사람들의 LAST_NAME,JOB_ID 조회
SELECT LAST_NAME,JOB_ID FROM employees WHERE MANAGER_ID IS NULL;
--ST_CLERK인 JOB_ID를 가진 사원이 없는 부서ID 조회, 단 부서번호가 NULL인 값은 제외
SELECT DISTINCT DEPARTMENT_ID FROM employees WHERE JOB_ID NOT IN('ST_SLERK') AND DEPARTMENT_ID IS NOT NULL;
--COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION=SALARY*COMMISSION_PCT를 구하여 EMPLOYEE_ID,FIRST_NAME,JOB_ID 출력
SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,SALARY*COMMISSION_PCT AS COMMISSION FROM employees WHERE COMMISSION_PCT IS NOT NULL;


--문자열 함수
--FIRST_NAME이 Curtis인 사람의 FIRST_NAME,LAST_NAME,PHONE_NUMBER,JOB_ID 조회 단,JOB_ID 결과는 소문자로 출력
SELECT FIRST_NAME, LAST_NAME, phone_number, LOWER(JOB_ID) FROM employees WHERE FIRST_NAME='Curtis';
--부서 번호가 60,70,80,90인 사원들의 EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,JOB_ID 조회 
--단, JOB_ID가 IT_PROG인 사원의 경우 프로그래머로 변환해서 출력
SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,REPLACE(job_id,'IT_PROG','프로그래머') FROM employees WHERE DEPARTMENT_ID IN (60,70,80,90);
--JOB_ID가 AD_PRES,PU_CLERK인 사원들의 EMPLOYEE_ID,FIRST_NAME,LAST_NAME,DEPARTMENT_ID,JOB_ID 조회,\
--단, 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력.
SELECT employee_id,FIRST_NAME||' '||LAST_NAME,DEPARTMENT_ID,JOB_ID FROM employees WHERE JOB_ID IN ('AD_PRES','PU_CLERK');