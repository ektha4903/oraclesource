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
--두 날짜 사이의 차이 : MONTHS_BETWEEN
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) < 540;
SELECT EMPNO,ENAME,HIREDATE,SYSDATE,MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1, MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTHS2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3 FROM EMP;
--돌아오는 요일 : NEXT_DAY, 달의 마지막 날짜 : LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE) FROM DUAL;


--자료형 변환 함수
--1) TO_CHAR() : 날짜, 숫자 데이터를 문자로 변환
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MM') AS 현재월 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON') AS 현재월 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DD') AS 현재일자 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DAY') AS 현재일자 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH:MI:SS') AS 현재시간 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH12:MI:SS') AS 현재시간 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH:MI:SS PM') AS 현재시간 FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS PM') AS 현재시간 FROM DUAL;

--2)TO_NUMBER() : 문자를 숫자 데이터 형식으로 변환
SELECT 1300-'1500', '1300'+1500 FROM DUAL;
SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;
--invalid number
--SELECT 1300-'1,500', '1,300'+1500 FROM DUAL;
--SELECT 1300-TO_NUMBER('1,500'), TO_NUMBER('1,300')+1500 FROM DUAL;
SELECT 1300-TO_NUMBER('1,500','999,999'), TO_NUMBER('1,300','999,999')+1500 FROM DUAL;

--3)TO_DATE() : 문자 데이터를 날짜형 데이터로 변환
SELECT TO_DATE('2021-04-16') AS TODATE1, TO_DATE('20210416') AS TODATE2 FROM DUAL;
SELECT TO_DATE('2021-04-16') - TO_DATE('2021-04-12') FROM DUAL;

--4)널처리 함수 - NVL(),NVL2()
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) FROM EMP;
-- NVL2(널 열,널이 아닐경우 반환할 값,널일 경우 반환할 값)
SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM,'O','X'), SAL+NVL2(COMM,SAL*12+COMM,SAL*12) FROM EMP;

--5) DECODE 함수
SELECT EMPNO,ENAME,JOB,SAL,DECODE(JOB,
                                  'MANAGER', SAL*1.1,
                                  'SALESMAN',SAL*1.05,
                                  'ANALYST', SAL,
                                  SAL*1.03) AS UPSAL FROM EMP;
                                  
--6) CASE (DECODE 보다 범용성이 높다)
SELECT EMPNO,ENAME,JOB,SAL,CASE JOB
                                WHEN 'MANAGER' THEN SAL*1.1
                                WHEN 'SALESMAN' THEN SAL*1.05
                                WHEN 'ANALYST' THEN SAL
                                ELSE  SAL*1.03
                                END AS UPSAL FROM EMP;
SELECT EMPNO,ENAME,JOB,SAL,CASE WHEN COMM IS NULL THEN '해당사항 없음'
                                WHEN COMM = 0 THEN '수당 없음'
                                WHEN COMM > 0 THEN '수당 : ' || COMM
                                END AS COMM_TEXT FROM EMP;
                                
-- [실습문제]

-- EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점 반올림하시오.
SELECT EMPNO,ENAME,SAL, TRUNC(SAL/21.5,2) AS DAY_PAY, ROUND(SAL/21.5/8,1) AS TIME_PAYFROM EMP;
--EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 
--같이 출력하시오. 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,NVL(TO_CHAR(COMM),'N/A') AS COMM FROM EMP;
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,NVL2(COMM,TO_CHAR(COMM),'N/A') AS COMM FROM EMP;
SELECT EMPNO,ENAME,HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB, CASE WHEN COMM IS NULL THEN 'N/A'
                                                                                     WHEN COMM IS NOT NULL THEN ''|| COMM
                                                                                     END AS COMM FROM EMP;
       
SELECT COMM, NVL(TO_CHAR(COMM),'N/A') FROM EMP;
SELECT COMM, NVL(COMM,'0') FROM EMP;

--실습3
--EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력
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
                             
-- 다중행 함수 : SUM,COUNT, MAX, MIN, AVERAGE
SELECT SUM(COMM) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*) FROM EMP WHERE DEPTO=30;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(DISTINCT SAL),COUNT(SAL) FROM EMP;
SELECT MAX(SAL), MIN(SAL) FROM EMP;
SELECT MAX(HIREDATE), MIN(HIREDATE) FROM EMP;

--부서 번호가 20인 사원중 가장 오래 근무한 사람 조회
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20;

SELECT AVG(SAL) FROM EMP;

--GROUP BY : 결과 값을 원하는 열로 묶어서 출력
SELECT DEPTNO,AVG(SAL) FROM EMP GROUP BY DEPTNO;
--부서번호, 직책별 평균 급여 구하기
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB;
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB;

--HAVING 절 : GROUP BY 절에 조건을 줄 때 사용
--각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹 출력
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;
--부서별 직책의 평균 급여가 500 이상인 사원들의 부서번호, 직책, 부서별 직책의 평균급여 조회
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=500 ORDER BY DEPTNO,JOB;
--WHERE을 그룹내의 조건을 줄 수 없음. WHERE은 출력문에 조건을 걸어 주는 것
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP WHERE AVG(SAL)>=500 GROUP BY DEPTNO,JOB ORDER BY DEPTNO,JOB;

-- 문) 부서번호, 평균급여, 최고급여, 최저급여, 사원수 출력하기 단,평균 급여를 출력할 떄 소수점을 제외하고 각 부서별로 출력
SELECT DEPTNO,FLOOR(AVG(SAL)),MAX(SAL),MIN(SAL),COUNT(EMPNO) FROM EMP GROUP BY DEPTNO ;
-- 문) 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB,COUNT(EMPNO) FROM EMP GROUP BY JOB HAVING COUNT(JOB)>=3;
-- 문) 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT TO_CHAR(HIREDATE,'YYYY') AS 입사연도 ,DEPTNO, COUNT(EMPNO) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY'),DEPTNO;

SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;
SELECT DEPTNO,JOB,AVG(SAL) FROM EMP WHERE SAL<=3000 GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000 ORDER BY DEPTNO,JOB;


--JOIN
--등가조인(INNER JOIN, 내부조인, 단순조인)
SELECT * FROM DEPT;
SELECT * FROM EMP;
--column ambiguously defined
SELECT EMPNO,ENAME,EMP.DEPTNO,DNAME FROM EMP,DEPT WHERE emp.deptno = dept.deptno;
--별칭 처리
SELECT EMPNO,ENAME,E.DEPTNO,DNAME FROM EMP E,DEPT D WHERE E.deptno = D.deptno;
--카테시안(나올 수 있는 모든 조합) 조인
SELECT * FROM EMP,DEPT ORDER BY EMPNO;
--EMP 테이블의 DEPNO와 DEPT 테이블의 DEPTNO가 일치하는 사원들의 사원번호, 이름, 부서번호, 부서명 조회 
--단, 급여가 3000이상인 사원 출력
SELECT EMPNO,ENAME,EMP.deptno,DNAME FROM EMP,DEPT WHERE emp.deptno = dept.deptno AND SAL>=3000;

--EMP테이블 별칭을 E로, DEPT테이블 별칭을 D로 하여 급여가 2500 이상이고, 사원번호가 9999이하인 사원들의 정보출력
--EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC를 출력
SELECT EMPNO,ENAME,E.SAL,E.DEPTNO,D.DNAME,D.LOC FROM EMP E, DEPT D WHERE e.deptno = d.deptno AND E.SAL>=2500 AND E.EMPNO<=9999;
--EMP 테이블 별칭을 E로, SALGRADE 테이블 별칭을 S로 하여 각 사원의 정보와 사원의 급여 등급 정보를 출력하기.
--비등가 조인
SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,E.COMM,E.DEPTNO,S.GRADE FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN s.losal AND s.hisal ;
SELECT * FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN s.losal AND s.hisal ;

--자체조인(SELF JOIN) : 조인을 할 때 두번째 테이블이 자기 자신
SELECT * FROM EMP;
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO;

--외부조인
--왼쪽 외부 조인 WHERE TABLE1.COL1 = TABLE2.COL1(+)
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO(+);
--오른쪽 외부 조인 WHERE TABLE1.COL1(+) = TABLE2.COL1
SELECT E1.EMPNO,E1.ENAME,E1.MGR,E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME FROM EMP E1, EMP E2 WHERE E1.MGR(+)=E2.EMPNO;
-- + 기호를 붙이는 외부 조인 방식은 전체 외부 조인 구현 불가

--표준문법 조인 
-- NATURAL JOIN(등가조인)
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

--문) 각 부서별 평균(급여),최대(급여),최소(급여),사원수를 출력하기 단,부서번호,부서명,평균,최대,최소,사원수 형태로 출력
--EMP 테이블과 DEPT 테이블 조인
SELECT * FROM DEPT;
SELECT D.DEPTNO,D.DNAME, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO GROUP BY D.deptno,D.DNAME ;
SELECT D.DEPTNO,D.DNAME, FLOOR(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*) FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO GROUP BY D.deptno,D.DNAME ;
--문) 모든 부서정보와 사원 정보를 부서번호,부서명,사원번호,사원명,직무,급여 형태로 출력하기
--EMP 테이블과 DEPT 테이블 조인
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.JOB,E.SAL FROM DEPT D LEFT OUTER JOIN EMP E ON D.DEPTNO=e.deptno;
--문) 급여가 2천 초과인 사원들의 부서 정보, 사원 정보를 출력하기(SQL 표준 문법으로 작성)
-- 부서번호, 부서명, 사원번호, 사원명, 급여 순으로 출력
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM EMP E JOIN DEPT D ON E.SAL>2000;
