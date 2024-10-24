package com.bitc.jeogi.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	
	private int review_id; // 리뷰 ID
	private int member_num; // 사용자 num (정수형)
	private int accommodation_num; // 숙소 ID (정수형)
	private int rating; // 평점
	private String content; // 내용
	// 파일 이름
	private String images; // 이미지
	private String created_at; // 생성일

	public String fileName() {
		return images.substring(images.lastIndexOf("_") + 1);
	}
}
