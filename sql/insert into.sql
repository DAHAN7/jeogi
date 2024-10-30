

INSERT INTO inquiry (member_id, title, content, created_at, status) VALUES (?, ?, ?, NOW(), '답변 대기');
INSERT INTO accommodation VALUES(NULL, '광안호텛' ,'광안리','광안리좋아요','호텔','1',NULL,NULL,NULL);
select * from member;
INSERT INTO reservation (
    reservation_checkin_date, 
    reservation_checkout_date, 
    reservation_guests_num, 
    reservation_price, 
    reservation_status, 
    member_num, 
    accommodation_num
) 
VALUES 
    ('2024-11-15', '2024-11-17', 2, 200000, '예약완료', 1, 1);
    
  -- 예약 번호 1: 1번 회원이 1번 숙소를 2024년 11월 10일부터 11월 12일까지 2명 예약, 가격은 600000원, 예약 완료 상태
INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) 
VALUES ('2024-11-10', '2024-11-12', 2, 600000, '예약 완료', 1, 1);

-- 예약 번호 2: 2번 회원이 2번 숙소를 2024년 12월 24일부터 12월 25일까지 4명 예약, 가격은 400000원, 예약 취소 상태
INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) 
VALUES ('2024-12-24', '2024-12-25', 4, 400000, '예약 취소', 1, 1);

-- 예약 번호 3: 3번 회원이 3번 숙소를 2025년 1월 1일부터 1월 5일까지 3명 예약, 가격은 1500000원, 체크인 완료 상태
INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) 
VALUES ('2025-01-01', '2025-01-05', 3, 1500000, '체크인 완료', 1, 1);

-- 예약 번호 4: 1번 회원이 2번 숙소를 2024년 11월 5일부터 11월 7일까지 1명 예약, 가격은 200000원, 예약 완료 상태
INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) 
VALUES ('2024-11-05', '2024-11-07', 1, 200000, '예약 완료', 1, 1);

-- 예약 번호 5: 3번 회원이 1번 숙소를 2024년 12월 30일부터 2025년 1월 2일까지 2명 예약, 가격은 900000원, 예약 완료 상태
INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) 
VALUES ('2024-12-30', '2025-01-02', 2, 900000, '예약 완료', 1, 1);