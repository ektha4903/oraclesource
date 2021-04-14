-- hr에 있는 모든 테이블 확인
select * from tab;

--employees 모든 테이블 확인
select * from employees;

--employees 테이블의 first_name,last_name,j0b_id만 조회
select first_name,last_name,job_id from employees;

--중복된 값 제거
select deptno from
