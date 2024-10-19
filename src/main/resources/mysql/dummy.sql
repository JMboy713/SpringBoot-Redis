-- 높은 재귀(반복) 횟수를 허용하도록 설정
-- 아래에서 생성할 더미 데이터의 개수와 맞춰서 작성
SET SESSION cte_max_recursion_depth = 1000000;

-- boards 테이블에 더미 데이터 삽입
INSERT INTO boards (title, content, created_at)
WITH RECURSIVE cte (n) AS
    (
SELECT 1
                           UNION ALL
                           SELECT n + 1
                           FROM cte
                           WHERE n < 1000000 -- 생성하고 싶은 더미 데이터의 수
)
SELECT CONCAT('Title', LPAD(n, 7, '0'))  AS title,
       CONCAT('Concat', LPAD(n, 7, '0')) AS content, TIMESTAMP (DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*3650+1) DAY)+ INTERVAL FLOOR(RAND()*86400) SECOND) AS created_at
FROM cte;
