package com.bitc.jeogi.review.service;

import com.bitc.jeogi.review.dto.MemberDTO;

public interface MemberService {
	MemberDTO login(String id, String password);

	void updateMember(MemberDTO member);

	MemberDTO getMemberByNum(int member_num);

	boolean registerMember(MemberDTO member);
}
