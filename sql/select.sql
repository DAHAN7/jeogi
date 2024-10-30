SELECT * FROM reservation;

SELECT * FROM accommodation;

SELECT * FROM review;

SELECT * FROM reservation ORDER BY reservation_num DESC LIMIT 0, 10;
select * from member;

select * from inquiry;

SELECT * 
FROM inquiry 
WHERE title LIKE '%keyword%' OR content LIKE '%keyword%' 
ORDER BY created_at DESC 
LIMIT startRow, perPageNum;

SELECT *  FROM inquiry  WHERE title LIKE '%keyword%' OR content LIKE '%keyword%'  ORDER BY created_at DESC  LIMIT 10, 5;

SELECT * FROM inquiry WHERE 1=1    
AND (CASE          WHEN 'keyword' IS NOT NULL AND 'keyword' <> '' 
THEN title LIKE CONCAT('%', 'keyword', '%') OR content LIKE CONCAT('%', 'keyword', '%')
 ELSE 1=1         END) ORDER BY created_at DESC LIMIT 10, 5;
SELECT *  FROM inquiry  WHERE title LIKE '%test%' OR content LIKE '%test%'  ORDER BY created_at DESC  LIMIT 10, 5;

SELECT * FROM inquiry WHERE 1=1    
AND (CASE          WHEN 'test' IS NOT NULL AND 'test' <> '' 
THEN title LIKE CONCAT('%', 'test', '%') OR content LIKE CONCAT('%', 'test', '%')          
ELSE 1=1         
END) ORDER BY created_at DESC LIMIT 10, 5;


SELECT * FROM inquiry;


INSERT INTO inquiry (member_id, title, content, created_at, status) VALUES (1, '테스트 제목', '테스트 내용', NOW(), '답변 대기');

SELECT * FROM inquiry;

SELECT * FROM inquiry WHERE title LIKE '%1%' OR content LIKE '%1%' ORDER BY created_at DESC LIMIT 0, 10;


