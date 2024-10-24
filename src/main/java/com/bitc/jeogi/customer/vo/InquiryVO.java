package com.bitc.jeogi.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquiryVO {
	private int inquiry_id; // 문의 고유 ID
	private int member_id; // 문의 작성자 ID (member 테이블 외래 키)
	private String title; // 문의 제목
	private String content; // 문의 내용
	private String created_at; // 문의 작성 일시
	private String status; // 문의 상태 (답변 대기, 답변 완료 등)
}
