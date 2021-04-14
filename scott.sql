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