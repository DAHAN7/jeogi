package com.bitc.jeogi.accommodation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.accommodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.review.vo.ReviewVO;

@Mapper
public interface AccommodationDAO {

	@Select("SELECT count(*) FROM accommodation")
	int getTotalCount();

	@Select("SELECT * FROM accommodation ORDER BY accommodation_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<AccommodationVO> selectList(Criteria cri);

	@Select("SELECT * FROM accommodation WHERE accommodation_num = #{accommodation_num}")
	AccommodationVO accommodation_detail(int accommodation_num);

	@Insert("INSERT INTO accommodation (accommodation_name, accommodation_address, accommodation_description, accommodation_type, accommodation_price, accommodation_mainimages, accommodation_images1, accommodation_images2) "
			+ "VALUES (#{accommodation_name}, #{accommodation_address}, #{accommodation_description}, "
			+ "#{accommodation_type}, #{accommodation_price}, #{accommodation_mainimages}, "
			+ "#{accommodation_images1}, #{accommodation_images2})")
	void insert(AccommodationVO ac);

	@Update("UPDATE accommodation SET " + "accommodation_name = #{accommodation_name}, "
			+ "accommodation_address = #{accommodation_address}, "
			+ "accommodation_description = #{accommodation_description}, "
			+ "accommodation_type = #{accommodation_type}, " + "accommodation_price = #{accommodation_price}, "
			+ "accommodation_mainimages = #{accommodation_mainimages}, "
			+ "accommodation_images1 = #{accommodation_images1}, " + "accommodation_images2 = #{accommodation_images2} "
			+ "WHERE accommodation_num = #{accommodation_num}")
	int accommodation_update(AccommodationVO av);

	@Delete("DELETE FROM accommodation WHERE accommodation_num = #{accommodation_num}")
	void accommodation_delete(int accommodation_num);

	@Select("SELECT * FROM accommodation WHERE accommodation_num = #{accommodation_num}")
	AccommodationVO findMemberId(int accommodation_num);

	@Select("SELECT * FROM accommodation ORDER BY accommodation_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<AccommodationVO> getPopularAccommodations(Criteria criteria);

	@Select("SELECT * FROM review WHERE accommodation_num = #{accommodation_num} ORDER BY created_at DESC")
	List<ReviewVO> getReviewsByAccommodation(int accommodation_num);

	AccommodationVO getAccommodationById(int accommodation_num);
}