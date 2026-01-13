--  Q1.
-- 재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호, 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
-- - 참고. 퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 ‘N’

select
	EMP_ID
	, EMP_NAME
	, PHONE
	, HIRE_DATE
	, ENT_YN
from employeedb.employee
where
	PHONE like '%2'
	and ENT_YN = 'N'
order by HIRE_DATE desc
limit 3;

--  Q2.
-- 재직 중인 ‘대리’들의 직원명, 직급명, 급여, 사원번호, 이메일, 전화번호, 입사일을 출력하세요.
-- 단, 급여를 기준으로 내림차순 출력하세요.
select 
	e.emp_name
	, j.job_name
	, e.salary
	, e.EMP_NO
	, e.EMAIL 
	, e.PHONE 
	, e.HIRE_DATE 
from employeedb.employee e
join employeedb.job j 
on j.JOB_CODE = j.JOB_CODE 
and j.JOB_NAME ='대리'
order by e.SALARY desc;

--  Q3.
-- 재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고, 마지막에는 전체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
-- 단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’, ‘급여평균’으로 출력되도록 하세요.
select
	d.DEPT_TITLE as '부서명'
	, count(*) as '인원'
	, sum(e.SALARY) as '급여합계'
	, ceil(avg(e.SALARY)) as '급여평균'
from employeedb.department d
join employeedb.employee e
	on e.DEPT_CODE  = d.DEPT_ID
where e.ent_yn = 'N'
group by d.DEPT_TITLE
with rollup;

--  Q4.
-- 전체 직원의 직원명, 주민등록번호, 전화번호, 부서명, 직급명을 출력하세요.
-- 단, 입사일을 기준으로 오름차순 정렬되도록 출력하세요.
select
	e.emp_name as '직원명'
	, e.emp_no as '주민등록번호'
	, e.phone as '전화번호'
	, d.DEPT_TITLE  as '부서명'
	, j.JOB_NAME as '직급명'
from employeedb.employee e
join employeedb.department d
	on e.DEPT_CODE = d.DEPT_ID
join employeedb.job j
	on e.JOB_CODE = j.JOB_CODE
order by e.HIRE_DATE desc;

--  Q5.
-- <1단계> 전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.
-- 참고. 연결된 관리자가 있다는 것은 관리자사번이 NULL이 아님을 의미함
select
count(*)
from employeedb.employee e
where e.MANAGER_ID is not null;
-- <2단계> 1단계에서 조회한 내용에는 문제가 조금 있습니다. 관리자사번이 존재하여 연결된 관리자가 있기는 하나, 해당 관리자가 직원 목록에 존재하지 않는 직원이 있습니다.
-- 따라서 1단계를 디벨롭하여 직원 목록에 관리자사번이 존재하는 직원의 인원을 출력하세요.
select
count(*)
from employeedb.employee e
join employeedb.employee m
	on e.MANAGER_ID = m.EMP_ID
where e.MANAGER_ID is not null
and e.MANAGER_ID in (select e2.EMP_ID from employeedb.employee e2);

-- 이렇게 inner join으로 할 수도 있음
select
count(*)
from employeedb.employee e
left join employeedb.employee m
	on e.MANAGER_ID = m.EMP_ID;
-- <3단계> 모든 직원의 직원명과 관리자의 직원명을 출력하세요.
-- 참고. ‘모든 직원’이므로 관리자가 존재하지 않는 직원도 출력되어야 합니다.
select
	e.emp_name as '직원명'
	, m.emp_name as '관리자명'
from employeedb.employee e
left join employeedb.employee m
	on e.MANAGER_ID = m.EMP_ID;
-- <4단계> 관리자가 존재하는 직원의 직원명, 부서명, 관리자의 직원명, 관리자의 부서명을 출력하세요.
select
	e.emp_name as '직원명'
	, ed.dept_title as '부서명'
	, m.emp_name as '관리자 직원명'
	, md.dept_title as '관리자 부서명'
from employeedb.employee e
join employeedb.employee m
	on e.MANAGER_ID = m.EMP_ID
join employeedb.department ed
	on ed.DEPT_ID = e.DEPT_CODE
join employeedb.department md
	on md.DEPT_ID = m.DEPT_CODE;