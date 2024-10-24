package com.bitc.jeogi.reservation.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {

	private int reservation_num;
	private String reservation_checkin_date;
	private String reservation_checkout_date;
	private int reservation_guests_num;
	private int reservation_price;
	private String reservation_status;
	private int member_num;
	private int accommodation_num;

}
