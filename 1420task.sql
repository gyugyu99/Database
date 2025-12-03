-- 1. employees 테이블을 생성!
-- CREATE TABLE employees (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100),
--     position VARCHAR(100),
--     salary DECIMAL(10, 2)
-- );

-- USE task_database;

-- 2. 직원 데이터를 employees에 추가하기!
-- INSERT INTO employees(name, position, salary) 
-- VALUES 
-- 	('혜린', 'PM', 90000),
--  ('은우', 'Frontend', 80000),
--  ('가을', 'Backend', 92000),
--  ('지수', 'Frontend', 7800),
--  ('민혁', 'Frontend', 96000),
--  ('하온', 'Backend', 130000);

-- 3. 모든 직원의 이름과 연봉 정보만을 조회하는 쿼리를 작성해주세요
-- SELECT name, salary FROM employees;

-- 	3-1. `Frontend` 직책을 가진 직원 중에서 연봉이 90000 이하인 직원의 이름과 연봉을 조회하세요.
-- SELECT name, salary FROM employees WHERE position = 'Frontend'and salary <= 90000;


-- 	3-2. `PM` 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.
-- SET SQL_SAFE_UPDATES = 0; ## 안전모드 해제
-- UPDATE employees SET salary = salary * 110 WHERE position = 'PM';
-- SELECT * FROM employees WHERE position = 'PM';


-- 	3-3. 모든 `Backend`' 직책을 가진 직원의 연봉을 5% 인상하세요.
-- UPDATE employees SET salary = salary * 1.05 WHERE position = 'Backend';
-- SELECT * FROM employees WHERE position = 'Backend';

-- 	3-4. 민혁 사원의 데이터를 삭제하세요
-- DELETE FROM employees WHERE name = '민혁';
-- SELECT * FROM employees;

-- 	3-5. 모든 직원을 `position` 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요.
-- SELECT position, AVG(salary) FROM employees GROUP BY position;
##백엔드 만세~

-- 	3-6. `employees` 테이블을 삭제하세요.
DROP TABLE employees;