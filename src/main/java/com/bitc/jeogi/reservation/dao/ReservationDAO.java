package com.bitc.jeogi.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.reservation.vo.ReservationVO;

@Mapper
public interface ReservationDAO {

	@Insert("INSERT INTO reservation (reservation_checkin_date, reservation_checkout_date, reservation_guests_num, reservation_price, reservation_status, member_num, accommodation_num) "
			+ " VALUES (#{reservation_checkin_date}, #{reservation_checkout_date}, #{reservation_guests_num}, #{reservation_price}, 'pending', #{member_num}, #{accommodation_num})")
	boolean reservation_writer(ReservationVO reser);

	@Select("SELECT count(*) FROM reservation")
	int getTotalCount();

	@Select("SELECT * FROM reservation " + "ORDER BY reservation_num DESC LIMIT #{startRow}, #{perPageNum}")
	List<ReservationVO> selectList(Criteria cri);

	@Select("SELECT * FROM reservation WHERE reservation_num = #{reservation_num}")
	ReservationVO reservation_detail(int reservation_num);
}


