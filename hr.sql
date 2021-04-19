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

--실습4
SELECT LAST_NAME,SALARY,DECODE(TRUNC(SALARY/2000,0),0,0.00,1,0.09,2,0.20,3,0.30,4,0.40,5,0.42,6,0.44,0.45) AS TEX_RATE FROM employees WHERE DEPARTMENT_ID=80;

--회사 내의 최대 연봉 및 최소 연봉의 차이 조회
SELECT MAX(SALARY)-MIN(SALARY) AS SAL_GAP FROM employees;
--매니저로 근무하는 사원들의 총 수를 조회
SELECT COUNT(DISTINCT MANAGER_ID) AS 매니저 FROM employees;

--부서별 직원의 수를 구하여, 부서번호의 오름차순으로 출력
SELECT DEPARTMENT_ID FROM employees;
SELECT DEPARTMENT_ID, COUNT(*) FROM employees GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;
--부서별 급여의 평균 연봉을 출력하기(부서번호, 편균 연봉이 나오도록 하고 부서번호별 오름차순 조회
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) FROM employees GROUP BY DEPARTMENT_ID  ORDER BY DEPARTMENT_ID;
--동일한 직업을 가지 사원들의 수를 조회
SELECT JOB_ID,COUNT(employee_id) FROM employees GROUP BY JOB_ID ORDER BY JOB_ID;


--문)매니저 별 사원들 중 최소 연봉을 받는 사원의 연봉 조회, 매니저가 없는 사람 제외/최소 연봉이 6000미만 제외/연봉기준 역순 출력
SELECT MANAGER_ID,MIN(SALARY) FROM employees WHERE MANAGER_ID IS NOT NULL GROUP BY MANAGER_ID HAVING MIN(SALARY)>=6000 ORDER BY MIN(SALARY) DESC;
SELECT MANAGER_ID,MIN(SALARY) FROM employees GROUP BY MANAGER_ID HAVING MANAGER_ID IS NOT NULL AND MIN(SALARY)>=6000 ORDER BY MIN(SALARY) DESC;


--JOIN 실습
SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM employees;
--Q) 자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 HIRE_DATE, LAST_NAME, MANAGER_ID 출력 EMPLOYEES 테이블 SELF JOIN
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.MANAGER_ID FROM employees E1, employees E2 WHERE e1.manager_id = e2.employee_id AND E1.HIRE_DATE<E2.HIRE_DATE;
SELECT E1.HIRE_DATE, E1.LAST_NAME, E1.MANAGER_ID FROM employees E1 JOIN employees E2 ON e1.manager_id = e2.employee_id AND E1.HIRE_DATE<E2.HIRE_DATE;
--Q) 도시 이름이 T로 시작하는 지역에 사는 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID 출력
--(DEPARTMENTS의 LOCATION_ID와 LOCATIONS의 LOCATION_ID 연결 후 CITY명 알아내기)
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, l.city FROM employees E, LOCATIONS L, departments D WHERE d.location_id = l.location_id AND E.DEPARTMENT_ID = D.DEPARTMENT_ID AND L.CITY LIKE 'T%';
--Q) 위치 ID가 1700이고, 사원들의 EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, SALARY 조회 DEPARTMENTS 테이블과 EMPLOYEES 조인
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND d.location_id=1700;
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY FROM employees E JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID AND d.location_id=1700;
--Q) DEPARTMENT_NAME, LOCATION_ID, 각 부서별 사원 총 수, 각 부서별 평균 연봉 조회하기, 평균 연봉은 소수점 2자리까지만 표현
SELECT DEPARTMENT_NAME, LOCATION_ID, COUNT(*), ROUND(AVG(SALARY),2) FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME, LOCATION_ID ORDER BY LOCATION_ID;
SELECT DEPARTMENT_NAME, LOCATION_ID, COUNT(*), ROUND(AVG(SALARY),2) FROM employees E JOIN departments D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID GROUP BY DEPARTMENT_NAME, LOCATION_ID ORDER BY LOCATION_ID;
--Q) EXECUTIVE 부서에서 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID 조회
SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID FROM employees E, departments D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Executive';
--Q) 각 사원 별 소속 부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 DEPARTMENT_ID, FIRST_NAME과 LAST_NAME 조회
-- FIRST_NAME과 LAST_NAME 두 열은 합해서 하나로 출력한다.
SELECT E1.DEPARTMENT_ID, E1.FIRST_NAME||' '||E1.LAST_NAME AS NAME FROM employees E1, employees E2 WHERE e1.DEPARTMENT_id = e2.department_id AND e1.salary<e2.salary AND e1.hire_date<e2.hire_date ORDER BY e1.department_id;


--서브쿼리
--Q) LAST_NAME에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 LAST_NAME,EMPLOYEE_ID 조회
SELECT LAST_NAME, EMPLOYEE_ID FROM employees WHERE department_id IN (SELECT DEPARTMENT_ID FROM employees WHERE LAST_NAME LIKE '%u%');

--Q) EXEUTIVE 부서에 근무하는 모든 사원들의 DEPARTMENT_ID, LAST_NAME, JOB_ID 조회
SELECT E.DEPARTMENT_ID, LAST_NAME, JOB_ID FROM employees E WHERE (e.department_id,'Executive') IN (SELECT e.department_id,DEPARTMENT_NAME FROM departments);

--Q) 소속 부서의 평균 연봉보다 적게 버는 사원들의 LAST_NAME, 평균연봉, 부서번호, 급여 조회, 부서번호,급여의 내림차순으로 정렬 후 출력
-- 인라인 뷰로 처리(부서번호, 부서별 평균연봉)
SELECT LAST_NAME,AVG_SAL,E1.DEPARTMENT_ID,E1.SALARY 
FROM EMPLOYEES E1,(SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AS AVG_SAL FROM EMPLOYEES GROUP BY DEPARTMENT_ID) E2 
WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.SALARY<E2.AVG_SAL;

--Q) JOB_ID가 'SA_MAN'인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME,JOB_ID,SALARY 조회
SELECT LAST_NAME,JOB_ID,SALARY FROM employees WHERE SALARY>(SELECT MAX(SALARY) FROM employees WHERE JOB_ID = 'SA_MAN');

--Q) 커미션을 받는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME,DEPARTMENT_ID,SALARY 조회, 다중열 서브 쿼리로 작성
SELECT LAST_NAME,DEPARTMENT_ID,SALARY FROM employees WHERE (DEPARTMENT_ID,SALARY) IN 
(SELECT DEPARTMENT_ID,SALARY FROM employees WHERE COMMISSION_PCT IS NOT NULL);

--Q) LAST_NAME이 'Davies'인 사람보다 나중에 고용된 사원들의 LAST_NAME,HIRE_DATE 조회
SELECT LAST_NAME,HIRE_DATE FROM employees WHERE hire_date > (SELECT hire_date FROM employees WHERE LAST_NAME = 'Davies');

--Q) LAST_NAME이 'King'인 사원을 매너저로 두고 있는 모든 사원들의 LAST_NAME,SALARY 조회
SELECT LAST_NAME, SALARY FROM employees WHERE manager_id IN (SELECT employee_id FROM employees WHERE LAST_NAME = 'King');

--Q) LAST_NAME이 'Zlotkey'인 사원과 동일한 부서에서 근무하는 모든 사원들의 EMPLOYEE_ID,HIRE_DATE 조회
SELECT EMPLOYEE_ID, HIRE_DATE FROM employees WHERE DEPARTMENT_ID IN (SELECT department_id FROM employees WHERE LAST_NAME = 'Zlotkey');

--Q) LAST_NAME이 'Kochhar'인 사원과 동일한 연봉 및 커미션을 버는 사원들의 LAST_NAME, DEPARTMENT_ID,SALARY,COMMISSION_PCT 조회
--단, 'Kochhar'는 출력 결과에서 제외한다.
SELECT E.LAST_NAME, E.DEPARTMENT_ID,E.SALARY,E.COMMISSION_PCT FROM employees E WHERE (SALARY,NVL(commission_pct,0)) IN 
(SELECT SALARY,NVL(commission_pct,0) FROM employees WHERE LAST_NAME = 'Kochhar') AND LAST_NAME!='Kochhar';