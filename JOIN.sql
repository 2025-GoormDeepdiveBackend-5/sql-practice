-- JOIN을 이용하여 여러 테이블을 조회 시에는 모든 컬럼에 테이블 별칭을 사용하는 것이 좋다.

-- 1. 직급이 대리이면서 아시아 지역에 근무하는 직원의 사번, 이름, 직급명, 부서명, 지역명, 급여를 조회하세요
select
	   a.emp_id,
       a.emp_name,
       d.job_name,
	   b.dept_title,
       c.local_name,
       a.salary
  from employee a
  join department b on b.dept_id = a.dept_code
  join location c on b.location_id = c.local_code and c.local_name like 'ASIA%'
  join job d on d.job_name = '대리' and d.job_code = a.job_code;

-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 전씨인 직원의 이름, 주민등록번호, 부서명, 직급명을 조회하세요.
select
	   emp.emp_name,
       emp.emp_no,
       dep.dept_title,
       job.job_name
  from employee emp
  join department dep on emp.dept_code = dep.dept_id
  join job job on emp.job_code = job.job_code
 where emp.emp_no like '7______2%';

-- 3. 이름에 '형'자가 들어가는 직원의 사번, 이름, 직급명을 조회하세요.
select 
	   emp.emp_id,
       emp.emp_name,
       job.job_name
  from employee emp
  join job job on emp.job_code = job.job_code
 where emp.emp_name like '%형%';

-- 4. 해외영업팀에 근무하는 직원의 이름, 직급명, 부서코드, 부서명을 조회하세요.
select 
	   emp.emp_name,
       job.job_name,
       emp.dept_code,
       dep.dept_title
  from EMPLOYEE emp
  join DEPARTMENT dep on dep.DEPT_TITLE like '해외영업%' and dep.DEPT_ID = emp.DEPT_CODE
  join JOB job on job.JOB_CODE = emp.JOB_CODE
 order by dept_title asc, job.job_code desc;

-- 5. 보너스포인트를 받는 직원의 이름, 보너스, 부서명, 지역명을 조회하세요.
select
	   emp.emp_name,
       emp.bonus,
       dep.dept_title,
       loc.local_name
  from EMPLOYEE emp
  join department dep on dep.dept_id = emp.dept_code
  join location loc on loc.local_code = dep.location_id
 where emp.bonus is not null
 order by emp.bonus asc;

-- 6. 부서코드가 D2인 직원의 이름, 직급명, 부서명, 지역명을 조회하세오.
select 
	   emp.emp_name,
       job.job_name,
       dep.dept_title,
       loc.local_name
  from employee emp
  join department dep on dep.dept_id = emp.dept_code
  join job job on job.job_code = emp.job_code
  join location loc on loc.local_code = dep.location_id
 where emp.dept_code = 'D2';

-- 7. 한국(KO)과 일본(JP)에 근무하는 직원의 이름, 부서명, 지역명, 국가명을 조회하세요.
select 
	   emp.emp_name,
       dep.dept_title,
       loc.local_name,
       nat.national_name
  from employee emp
  join department dep on dep.dept_id = emp.dept_code
  join location loc on loc.local_code = dep.location_id
  join nation nat on nat.national_code in ('KO', 'JP') and nat.national_code = loc.national_code
 order by nat.national_code asc;
