-- JOIN을 이용하여 여러 테이블을 조회 시에는 모든 컬럼에 테이블 별칭을 사용하는 것이 좋다.

-- 1. 직급이 대리이면서 아시아 지역에 근무하는 직원의 사번, 이름, 직급명, 부서명, 지역명, 급여를 조회하세요
SELECT e.EMP_ID,
       e.EMP_NAME,
       j.JOB_NAME,
       d.DEPT_TITLE,
       l.NATIONAL_CODE,
       e.SALARY
FROM EMPLOYEE e
         LEFT JOIN JOB j USING (JOB_CODE)
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
         LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE l.LOCAL_NAME LIKE 'ASIA_'
ORDER BY EMP_ID;

-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 전씨인 직원의 이름, 주민등록번호, 부서명, 직급명을 조회하세요.
SELECT e.EMP_NAME,
       e.EMP_NO,
       d.DEPT_TITLE,
       j.JOB_NAME
FROM EMPLOYEE e
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
         RIGHT JOIN JOB j USING (JOB_CODE)
WHERE e.EMP_NO LIKE '7_____-2______'
  AND e.EMP_NAME LIKE '전%';

-- 3. 이름에 '형'자가 들어가는 직원의 사번, 이름, 직급명을 조회하세요.
SELECT e.EMP_ID,
       e.EMP_NAME,
       j.JOB_NAME
FROM EMPLOYEE e
         LEFT JOIN JOB j USING (JOB_CODE)
WHERE e.EMP_NAME LIKE '%형%';

-- 4. 해외영업팀에 근무하는 직원의 이름, 직급명, 부서코드, 부서명을 조회하세요.
SELECT e.EMP_NAME,
       j.JOB_NAME,
       e.DEPT_CODE,
       d.DEPT_TITLE
FROM EMPLOYEE e
         LEFT JOIN JOB J ON e.JOB_CODE = J.JOB_CODE
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
WHERE d.DEPT_TITLE LIKE '해외영업%';

-- 5. 보너스포인트를 받는 직원의 이름, 보너스, 부서명, 지역명을 조회하세요.
SELECT e.EMP_NAME,
       e.BONUS,
       d.DEPT_TITLE,
       l.LOCAL_NAME
FROM EMPLOYEE e
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
         LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE e.BONUS IS NOT NULL;

-- 6. 부서코드가 D2인 직원의 이름, 직급명, 부서명, 지역명을 조회하세오.
SELECT e.EMP_NAME,
       j.JOB_NAME,
       d.DEPT_TITLE,
       l.LOCAL_NAME
FROM EMPLOYEE e
         LEFT JOIN JOB J ON e.JOB_CODE = J.JOB_CODE
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
         LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
WHERE e.DEPT_CODE = 'D2';

-- 7. 한국(KO)과 일본(JP)에 근무하는 직원의 이름, 부서명, 지역명, 국가명을 조회하세요.
SELECT e.EMP_NAME,
       d.DEPT_TITLE,
       l.LOCAL_NAME,
       n.NATIONAL_NAME
FROM EMPLOYEE e
         LEFT JOIN DEPARTMENT d ON e.DEPT_CODE = d.DEPT_ID
         LEFT JOIN LOCATION l ON d.LOCATION_ID = l.LOCAL_CODE
         LEFT JOIN NATION n USING (NATIONAL_CODE)
WHERE NATIONAL_CODE = 'KO'
   OR NATIONAL_CODE = 'JP';