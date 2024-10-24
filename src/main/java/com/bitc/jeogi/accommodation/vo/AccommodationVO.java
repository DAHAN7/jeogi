package com.bitc.jeogi.accommodation.vo;

import lombok.Data;

@Data
public class AccommodationVO {
	private int accommodation_num; // 테이블의 'accommodation_id'에 해당 (숙소 고유 ID)
	private String accommodation_name; // 테이블의 'name'에 해당 (숙소 이름)
	private String accommodation_address; // 테이블의 'address'에 해당 (숙소 주소)
	private String accommodation_description; // 테이블의 'description'에 해당 (숙소 설명)
	private String accommodation_type; // 테이블의 'type'에 해당 (숙소 유형: 호텔, 모텔 등)
	private int accommodation_price; // 테이블의 'price'에 해당 (숙소 가격)
	private String accommodation_mainimages; // 테이블의 'mainimages'에 해당 (주 이미지 경로)
	private String accommodation_images1; // 테이블의 'images1'에 해당 (추가 이미지 경로 1)
	private String accommodation_images2; // 테이블의 'images2'에 해당 (추가 이미지 경로 2)
	private int Member_num;
}
