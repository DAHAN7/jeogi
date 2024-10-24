package com.bitc.jeogi.common.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitc.jeogi.accommodation.service.AccommodationService;
import com.bitc.jeogi.accommodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {

	private final AccommodationService accommodationService;

	@GetMapping("/")
	public String home(Criteria criteria, Model model) throws Exception {
		List<AccommodationVO> totalAccommodations = accommodationService.getPopularAccommodations(criteria);
		System.out.println("전체 숙소 목록: " + totalAccommodations);
		PageMaker pageMaker = new PageMaker();
		List<AccommodationVO> accommodationList = accommodationService.getPageAccommodation(criteria);
		System.out.println("현재 페이지 숙소 목록: " + accommodationList);
		model.addAttribute("accommodation_list", accommodationList);
		model.addAttribute("pm", pageMaker);
		return "home";
	}
}
