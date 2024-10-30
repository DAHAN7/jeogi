 CREATE SCHEMA jeogi;
 SELECT * FROM member;
 USE jeogi;
DROP TABLE IF EXISTS member;
-- 1. 사용자 테이블
CREATE TABLE member(
	member_num INT PRIMARY KEY AUTO_INCREMENT,			-- 회원 번호
    member_id VARCHAR(200) NOT NULL UNIQUE,				-- 회원 아이디
    member_pw VARCHAR(100) NOT NULL,					-- 비밀번호
	member_name  VARCHAR(100) NOT NULL,					-- 이름
    member_phone  VARCHAR(100) NOT NULL,				-- 전화번호
	member_email VARCHAR(100) NOT NULL,					-- 이메일
    member_birth VARCHAR(20)		               	-- 생년월일(19820607)
);

-- 2. 숙소 테이블 생성
CREATE TABLE accommodation (
    accommodation_num INT AUTO_INCREMENT PRIMARY KEY,     			-- 숙소 번호
    accommodation_name VARCHAR(255) NOT NULL,                         -- 숙소 이름
    accommodation_address VARCHAR(255) NOT NULL,                     -- 숙소 주소
    accommodation_description TEXT NOT NULL,                          -- 숙소 설명
    accommodation_type VARCHAR(50) NOT NULL,                          -- 숙소 유형 (호텔, 모텔, 펜션 등)
    accommodation_price varchar(255) NOT NULL,                        -- 숙소 가격
    
    accommodation_mainimages VARCHAR(500),                            -- 숙소 이미지 주소값
    accommodation_images1 VARCHAR(500),                               -- 숙소 이미지 주소값
    accommodation_images2 VARCHAR(500)                               -- 숙소 이미지 주소값
);
create table review(
   review_id INT AUTO_INCREMENT PRIMARY KEY,              -- 리뷰 고유 ID
    member_num INT NOT NULL,                               -- 리뷰 작성자 ID (User 테이블 외래 키)
    accommodation_num INT NOT NULL,                        -- 리뷰 대상 숙소 ID (Accommodation 테이블 외래 키)
    rating INT,                                           -- 평점
    content TEXT,                                         -- 리뷰 내용
    created_at DATETIME NOT NULL DEFAULT NOW(),          -- 리뷰 작성 일시
    images VARCHAR(500) NOT NULL,                         -- 리뷰 이미지 주소값
    FOREIGN KEY (member_num) REFERENCES member(member_num),
    FOREIGN KEY (accommodation_num) REFERENCES accommodation(accommodation_num)
);

-- 4. 문의 테이블 생성
CREATE TABLE inquiry (
    inquiry_id INT AUTO_INCREMENT PRIMARY KEY,             -- 문의 고유 ID
    member_id INT NOT NULL,                               -- 문의 작성자 ID (User 테이블 외래 키)
    title VARCHAR(255),                                   -- 문의 제목
    content TEXT,                                         -- 문의 내용
    created_at DATETIME NOT NULL DEFAULT NOW(),          -- 문의 작성 일시
    status VARCHAR(20),                                   -- 문의 상태 (답변 대기, 답변 완료 등)
    FOREIGN KEY (member_num) REFERENCES member(member_num)
);

ALTER TABLE inquiry ADD COLUMN member_id INT;

-- 5. 예약 테이블 생성

CREATE TABLE reservation (
    reservation_num INT AUTO_INCREMENT PRIMARY KEY,       -- 예약 고유 ID
    reservation_checkin_date DATE NOT NULL,              -- 체크인 날짜
    reservation_checkout_date DATE NOT NULL,              -- 체크아웃 날짜
    reservation_guests_num INT NOT NULL,                  -- 숙박 인원 수
    reservation_price INT NOT NULL,                        -- 예약 가격
    reservation_status VARCHAR(20) NOT NULL,              -- 예약 상태
    member_num INT NOT NULL,                              -- 회원 번호 (외래 키)
    accommodation_num INT NOT NULL,                       -- 숙소 번호 (외래 키)
    FOREIGN KEY (member_num) REFERENCES member(member_num),
    FOREIGN KEY (accommodation_num) REFERENCES accommodation(accommodation_num)
);

-- 테이블 구조 확인
DESCRIBE review;
DESCRIBE member;

-- 사용 중인 스키마 확인
USE jeogi;
SHOW TABLES;