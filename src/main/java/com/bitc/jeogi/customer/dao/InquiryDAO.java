package com.bitc.jeogi.customer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.customer.vo.InquiryVO;

public interface InquiryDAO {
	// 문의 목록 조회
	@Select("SELECT * FROM inquiry WHERE title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%') ORDER BY created_at DESC LIMIT #{startRow}, #{perPageNum}")
	List<InquiryVO> list(SearchCriteria cri) throws Exception;

	// 문의 등록
	@Insert("INSERT INTO inquiry (member_id, title, content, created_at, status) VALUES (#{member_id}, #{title}, #{content}, NOW(), '답변 대기')")
	void regist(InquiryVO vo) throws Exception;

	// 문의 상세 조회
	@Select("SELECT * FROM inquiry WHERE inquiry_id = #{inquiry_id}")
	InquiryVO getInquiry(int inquiry_id) throws Exception;

	// 문의 수정
	@Update("UPDATE inquiry SET title = #{title}, content = #{content}, status = #{status} WHERE inquiry_id = #{inquiry_id}")
	void modify(InquiryVO vo) throws Exception;

	// 문의 삭제
	@Delete("DELETE FROM inquiry WHERE inquiry_id = #{inquiry_id}")
	void delete(int inquiry_id) throws Exception;

	// 조회수 증가
	@Update("UPDATE inquiry SET view_count = view_count + 1 WHERE inquiry_id = #{inquiry_id}")
	void incrementViewCount(int inquiry_id) throws Exception;

	// 문의 총 개수
	@Select("SELECT COUNT(*) FROM inquiry WHERE title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%')")
	int getAllList(SearchCriteria cri) throws Exception;

	// 특정 사용자의 문의 총 개수
	@Select("SELECT COUNT(*) FROM inquiry WHERE member_id = #{member_id}")
	int countInquiriesByMember(int member_id) throws Exception;
}
