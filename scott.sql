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




