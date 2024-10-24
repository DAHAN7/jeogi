package com.bitc.jeogi.customer.provider;

import org.apache.ibatis.jdbc.SQL;

import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.customer.vo.InquiryVO;

public class InquiryQueryProvider {

	// 동적 문의 목록 조회 쿼리
	public String selectInquiries(SearchCriteria cri) {
		return new SQL() {
			{
				SELECT("*");
				FROM("inquiry");
				if (cri.getKeyword() != null && !cri.getKeyword().isEmpty()) {
					WHERE("(title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%'))");
				}
				ORDER_BY("created_at DESC");
				LIMIT("#{startRow}, #{perPageNum}");
			}
		}.toString();
	}

	// 동적 문의 총 개수 조회 쿼리
	public String countInquiries(SearchCriteria cri) {
		return new SQL() {
			{
				SELECT("COUNT(*)");
				FROM("inquiry");
				if (cri.getKeyword() != null && !cri.getKeyword().isEmpty()) {
					WHERE("(title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%'))");
				}
			}
		}.toString();
	}

	// 문의 수정 쿼리
	public String updateInquiry(InquiryVO vo) {
		return new SQL() {
			{
				UPDATE("inquiry");
				if (vo.getTitle() != null) {
					SET("title = #{title}");
				}
				if (vo.getContent() != null) {
					SET("content = #{content}");
				}
				if (vo.getStatus() != null) {
					SET("status = #{status}");
				}
				WHERE("inquiry_id = #{inquiry_id}");
			}
		}.toString();
	}

	// 문의 삭제 쿼리
	public String deleteInquiry(int inquiry_id) {
		return new SQL() {
			{
				DELETE_FROM("inquiry");
				WHERE("inquiry_id = #{inquiry_id}");
			}
		}.toString();
	}

	// 문의 상세 조회 쿼리
	public String selectInquiryById(int inquiry_id) {
		return new SQL() {
			{
				SELECT("*");
				FROM("inquiry");
				WHERE("inquiry_id = #{inquiry_id}");
			}
		}.toString();
	}

	// 조회수 증가 쿼리
	public String incrementViewCount(int inquiry_id) {
		return new SQL() {
			{
				UPDATE("inquiry");
				SET("view_count = view_count + 1");
				WHERE("inquiry_id = #{inquiry_id}");
			}
		}.toString();
	}

	// 특정 사용자의 문의 목록 조회 쿼리
	public String selectInquiriesByMember(int member_id, SearchCriteria cri) {
		return new SQL() {
			{
				SELECT("*");
				FROM("inquiry");
				WHERE("member_id = #{member_id}");
				if (cri.getKeyword() != null && !cri.getKeyword().isEmpty()) {
					WHERE("(title LIKE CONCAT('%', #{keyword}, '%') OR content LIKE CONCAT('%', #{keyword}, '%'))");
				}
				ORDER_BY("created_at DESC");
				LIMIT("#{startRow}, #{perPageNum}");
			}
		}.toString();
	}

	// 문의 상태 변경 쿼리
	public String updateInquiryStatus(int inquiry_id, String status) {
		return new SQL() {
			{
				UPDATE("inquiry");
				SET("status = #{status}");
				WHERE("inquiry_id = #{inquiry_id}");
			}
		}.toString();
	}
}
