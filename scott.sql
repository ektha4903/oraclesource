--scott 소유의 모든 테이블을 조회
select * from tab;

--bonus 테이블의 모든 내용을 조회
select * from bonus; 

--emp 테이블의 모든 내용을 조회
select * from emp;

--emp 테이블의 empno, ename만 조회
SELECT empno,ename from emp;

--emp 테이블의 empno,job,hiredate 조회
select empno,job,hiredate from emp;

--중복된 값 제거 : DISTINCT
select deptno from emp;
select distinct deptno from emp;

--별칭
select empno from emp;
select empno as 사원번호 from emp;
select empno 사원번호 from emp;
select empno "사원번호" from emp;
select empno as "사원번호" from emp;


select ename,sal,sal*12+comm,comm from emp;
select ename,sal,sal*12+comm as 연봉,comm from emp;

--ename(사원명),job(직책) 별칭을 붙인 후 emp 조회
select ename as 사원명,job as 직책 from emp;

-- 정렬 : ORDER BY 정렬하고자 하는 열 이름 + 정렬옵션(ASC오름차순,DESC내림차순)
-- 옵션 안 쓰면 자동으로 오름차순
-- ename,sal 조회(sal 내림차순)
select ename,sal from emp order by sal DESC;
select ename,sal from emp order by sal;

--전체 데이터를 조회할 때 SAL 내림차순
select * from emp order by sal DESC;

--empno,ename,job 조회할 때 empno 오름차순
select empno,ename,job from emp order by empno ASC;

--부서번호의 오름차순과 급여의 내림차순 정렬하기
select * from emp order by deptno ASC,sal DESC;


select empno as "EMPLOYEE_NO",ename as "EMPLOYEE_NAME",MGR AS "MANAGER",SAL AS "SALARY",COMM AS "COMMISSION", DEPTNO AS "DEPARTMENT_NO",JOB,HIREDATE FROM EMP
ORDER BY DEPTNO DESC,ENAME ASC;

--WHERE : 조건에 맞춰서 조회
--부서 번호가 30번인 사원 조회
select * from emp where deptno=30;
--사원 번호가 7782인 사원 정보 조회
select * from emp where empno=7782;
--부서번호가 30이고 사원직책이 salesman인 사원 조회
select * from emp where deptno=30 and job='SALESMAN';
--부서 번호가 30이거나 사원직책이 CLERK인 사원 조회
select * from emp where deptno=30 or job='clerk';

--산술연산자 : * / + -
-- sal*12의 값이 36000인 사원 조회
select * from emp where sal*12 = 36000;

--비교연산자 : >, <, >=, <=
--sal의 값이 3000이상인 사원 조회
select * from emp where sal >= 3000;

--급여가 2500이상이고, 직업이 analyst인 사원 조회
select * from emp where sal>=2500 and job='ANALYST';

--사원 이름의 첫문자가 F와 같거나 뒤쪽인 것만 조회
select * from emp where ename >= 'F';

--직무가 MANAGER,SALESMAN,CLERK인 사원 조회
SELECT * FROM EMP WHERE JOB='MANAGER' OR JOB='SALESMAN' OR JOB='CLERK';

--등가비교연산자
-- = (동등), !=(같지 않다), <>(같지 않다), ^=(같지 않다)
--SAL이 3000이 아닌 사원 정보 조회
SELECT * FROM EMP WHERE SAL !=3000;
SELECT * FROM EMP WHERE SAL <>3000;
SELECT * FROM EMP WHERE SAL ^=3000;

--논리 부정 연산자 : NOT
SELECT * FROM EMP WHERE NOT SAL=3000;

--IN : =
SELECT * FROM EMP WHERE JOB='MANAGER' OR JOB='SALESMAN' OR JOB='CLERK';
SELECT * FROM EMP WHERE JOB IN('MANAGER','SALESMAN','CLERK');

SELECT * FROM EMP WHERE JOB!='MANAGER' AND JOB^='SALESMAN' AND JOB<>'CLERK';
SELECT * FROM EMP WHERE JOB NOT IN('MANAGER','SALESMAN','CLERK');

--부서 번호가 10,20 사원 조회(IN)
SELECT * FROM EMP WHERE DEPTNO in (10, 20);


--BETWEEN A AND B : 특정 범위의 데이터를 조회
--SAL 2000이상 3000이하
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;
--SAL 2000이상 3000이하가 아닌 사원 조회
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;


--LIKE 연산자와 와일드카드
--와일드 카드 : _(어떤 문자든 한 개의 문자를 의미),%(길이와 상관없는 모든 문자)
--사원 이름이 S로 시작하는 사원 조회
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
--사원 이름의 두번째 글자가 L인 사원을 조회
SELECT * FROM EMP WHERE ENAME LIKE '_L%';
--사원 이름에 AM이 포함되어 있는 사원 조회
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';


--IS NULL
--NULL : 값이 존재하지 않음/ 해당사항 없음/ 확정되지 않은 값
SELECT * FROM EMP WHERE comm is null;
select * from emp where mgr is null;
select * from emp where not mgr is null;
select * from emp where mgr is not null;


--집합 연산자 : 합집합 - UNION(중복된 값은 제거됨), UNION ALL, 차집합 - MINUS, 교집합 - INTERSECT
--10번부서와 20번부서 조회
SELECT * FROM EMP WHERE DEPTNO=10 UNION SELECT * FROM EMP WHERE DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO=10 UNION ALL SELECT * FROM EMP WHERE DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO=10 UNION SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP WHERE DEPTNO=10 UNION ALL SELECT * FROM EMP WHERE DEPTNO=10;

SELECT * FROM EMP MINUS SELECT * FROM EMP WHERE DEPTNO=10;

SELECT * FROM EMP INTERSECT SELECT * FROM EMP WHERE DEPTNO=10;

--20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 집합 연산자를 사용해서 조회하기
SELECT * FROM EMP WHERE DEPTNO IN (20,30) INTERSECT SELECT * FROM EMP WHERE SAL>2000;


--함수
--내장함수 : 오라클에서 기본으로 제공하는 함수
--사용자 정의 함수

--문자 함수 1)대소문자
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;
--ORACLE,oracle,Oracle => 입력값 다양
--where lower(title) like '%oracle%'

--문자 함수 2)길이
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;
--ENAME의 길이를 구하고 싶음
SELECT ENAME, LENGTH(ENAME) FROM EMP;
--ENAME 길이가 5이상인 사원 조회
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

--문자 함수 3) 문자열 추출
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5) FROM EMP;
--EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력하기(원 이름, 세번째~)
SELECT ENAME, SUBSTR(ENAME,3) FROM EMP;

--문자 함수 4) 특정 문자 위치 찾기
SELECT INSTR('HELLO, ORACLE!','L') AS 첫번째, INSTR('HELLO, ORACLE!','L',5) AS 두번째, INSTR('HELLO, RACLE!','L',2,2) AS 세번째 FROM DUAL;
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다.','이것') from dual;
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다.','이것',2) from dual;
SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다.','이것',2) from dual;
--사원 이름에 S가 있는 사원 조회
SELECT * FROM EMP WHERE INSTR(ENAME,'S')>0;

--문자열 함수 5) 문자열 대체
SELECT REPLACE('이것이 Oracle이다', '이것이', 'This is') FROM DUAL;
--010-1234-5678, 010 1234 5678, 01012345678
SELECT '010-1234-5678', REPLACE('010-1234-5678','-',' '),REPLACE('010-1234-5678','-') FROM DUAL;

--문자열 함수 6) 문자열 연결
--CONCAT() == ||
SELECT CONCAT(EMPNO,ENAME),CONCAT(EMPNO,CONCAT(':',ENAME)) FROM EMP WHERE ENAME='SMITH';
SELECT EMPNO||ENAME,EMPNO||':'||ENAME FROM EMP WHERE ENAME='SMITH';

--문자열 함수 7) 특정 문자 제거 - TRIM, LTRIM, RTRIM
SELECT '            이것이             ',TRIM('       이것이      ') FROM DUAL;
SELECT '            이것이             ',LTRIM('       이것이      ') FROM DUAL;
SELECT '[' || TRIM(' __ORACLE__ ') || ']' AS TRIM, '[' || LTRIM(' __ORACLE__ ') || ']' AS LTRIM, '[' || RTRIM(' __ORACLE__ ') || ']' AS RTRIM FROM DUAL;
SELECT '            이것이             ',RTRIM('       이것이      ') FROM DUAL;

--문자열 함수 8) 문자열 반대로 처리
SELECT REVERSE('ORACLE') FROM DUAL;


--숫자 함수 : 반올림/올림/버림/나머지값
--반올림
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678,0) AS ROUND0, ROUND(1234.5678,1) AS ROUND1,
       ROUND(1234.5678,2) AS ROUND2, ROUND(1234.5678,-1) AS ROUND_MINUS, ROUND(1234.5678,-2) AS ROUND_MINUS2 FROM DUAL;
--버림
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678,0) AS TRUNC0, TRUNC(1234.5678,1) AS TRUNC1,
       TRUNC(1234.5678,2) AS TRUNC2,TRUNC(1234.5678,-1) AS TRUNC_MINUS, TRUNC(1234.5678,-2) AS TRUNC_MINUS2 FROM DUAL;
--지정한 숫자와 가장 가까운 정수를 찾는 CEIL(큰정수), FLOOR(작은 점수)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14) FROM DUAL;
--나머지
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL;


--날짜 함수 : SYSDATE (오라클 서버가 설치된 OS 현재 날짜와 시간)
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;
--몇 개월 이후의 날짜 구하기 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM DUAL;
--입사 10주년이 되는 날짜 구하기
SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,120) FROM EMP;
--현재 날짜를 기준으로 입사 날짜 45년 미만인 사원 조회
SELECT * FROM EMP WHERE ADD_MONTHS(HIREDATE,540)>SYSDATE;
