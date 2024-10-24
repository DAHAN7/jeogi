package com.bitc.jeogi.customer.service;

import java.util.Map;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.customer.vo.InquiryVO;

public interface InquiryService {
	// 문의 목록 조회
	Map<String, Object> list(SearchCriteria cri) throws Exception;

	// 문의 상세 조회
	InquiryVO getInquiry(int inquiry_id) throws Exception;

	// 문의 수정
	String modify(InquiryVO vo) throws Exception;

	// 조회수 증가
	void incrementViewCount(int inquiry_id) throws Exception;

	String delete(int inquiry_id) throws Exception; // 삭제 메서드 추가

	String regist(InquiryVO vo, RedirectAttributes rttr) throws Exception;
}