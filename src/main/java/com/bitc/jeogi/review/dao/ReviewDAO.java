package com.bitc.jeogi.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.review.vo.ReviewVO;

@Mapper
public interface ReviewDAO {

	// 리뷰 추가
	@Insert("INSERT INTO review (accommodation_num, member_num, rating, content, images, created_at) "
			+ "VALUES (#{accommodation_num}, #{member_num}, #{rating}, #{content}, #{images}, NOW())")
	void insert(ReviewVO review);

	// 리뷰 조회
	@Select("SELECT * FROM review WHERE review_id = #{review_id}")
	ReviewVO selectById(int review_id);

	// 리뷰 업데이트
	@Update("UPDATE review SET rating = #{rating}, content = #{content}, images = #{images} WHERE review_id = #{review_id}")
	void update(ReviewVO review);
	
	@Update("UPDATE review SET  content = #{content} WHERE review_id = #{review_id}")
	void updateContent(ReviewVO rv);

	// 리뷰 삭제
	@Delete("DELETE FROM review WHERE review_id = #{review_id}")
	void delete(int review_id);

	// 리뷰 목록 조회
	@Select("SELECT * FROM review WHERE accommodation_num = #{accommodation_num} " + "ORDER BY created_at DESC")
	List<ReviewVO> selectList(Criteria cri);

	// 총 리뷰 수 조회
	@Select("SELECT COUNT(*) FROM review WHERE accommodation_num = #{accommodation_num}")
	int countByAccommodationId();

	// 모든 리뷰 조회
	@Select("SELECT * FROM review")
	List<ReviewVO> getAllList();

	@Select("SELECT * FROM review WHERE review_id = #{review_id}")
	ReviewVO findMemberId(int review_id);

	@Select("SELECT * FROM review WHERE review_id = #{review_id}")
	ReviewVO getById(int review_id);

	@Select("SELECT COUNT(*) FROM review")
	int getTotalCount();

	// 페이징된 리뷰 조회
	@Select("SELECT * FROM review ORDER BY review_id DESC LIMIT #{startRow}, #{perPageNum}")
	List<ReviewVO> getPageReview(Criteria cri);

	// 특정 숙소에 대한 리뷰 조회
	@Select("SELECT * FROM review WHERE accommodation_num = #{accommodation_num} ORDER BY created_at DESC")
	List<ReviewVO> getReviewsByAccommodation(int accommodation_num);

	
}
