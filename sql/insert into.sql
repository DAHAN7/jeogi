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

INSERT INTO accommodation VALUES(NULL, '광안호텛' ,'광안리','광안리좋아요','호텔','1',NULL,NULL,NULL);