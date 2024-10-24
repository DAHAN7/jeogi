package com.bitc.jeogi.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.reservation.dao.ReservationDAO;
import com.bitc.jeogi.reservation.vo.ReservationVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationService {

	private final ReservationDAO rd;

	public boolean reservation_writer(ReservationVO reser, int member_num, int accommodationNum) {

		reser.setAccommodation_num(accommodationNum);
		reser.setMember_num(member_num);

		return rd.reservation_writer(reser);
	}

	public int getTotalCount(Criteria cri) {
		return rd.getTotalCount();
	}

	public List<ReservationVO> getPageReservation(Criteria cri) {
		return rd.selectList(cri);
	}

	public ReservationVO reservation_detail(int reservation_num) throws Exception {
		return rd.reservation_detail(reservation_num);
	}

}
