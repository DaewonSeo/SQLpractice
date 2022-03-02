-- 고양이와 개는 몇 마리 있을까
-- 아래 구문 중 1은 SELECT문 내 첫번째 컬럼 즉 ANIMAL_TYPE을 가리킴
-- SELECT ANIMAL_TYPE, COUNT(*) as 'count' FROM ANIMAL_INS GROUP BY 1 ORDER BY 1;
SELECT ANIMAL_TYPE, COUNT(*) AS 'count' FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE;

-- 동명 동물 수 세기
SELECT NAME, COUNT(NAME) AS 'COUNT' FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME ASC;

-- 입양 시각 구하기(1)

SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS 'COUNT' FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR BETWEEN 9 AND 19
ORDER BY HOUR ASC;

-- 입양 시각 구하기(2)
-- sql 쿼리문 순서가 where --> select 순이기 때문에 where절 내 alias를 쓰면 에러가 난다.
-- 하지만, order by group by는 select 명령어 상 가장 마지막에 실행되기 때문에 alias를 사용할 수 있다. 
SET @hour := -1;

SELECT (@hour := @hour + 1) AS HOUR,
(SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @hour) as COUNT
FROM ANIMAL_OUTS
WHERE @hour < 23;

