package com.bitc.jeogi.review.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	private int member_num; // 사용자 고유 ID
	private String member_id; // 사용자 ID
	private String member_pw; // 사용자 비밀번호
	private String member_name; // 사용자 이름
	private String member_phone; // 사용자 전화번호
	private String member_email; // 사용자 이메일
	private String member_birth; // 사용자 생년월일
}
