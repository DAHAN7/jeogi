package com.bitc.jeogi.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("customer_center/")
public class CustomerCenterController {

//	@GetMapping("customer_center")
//    public String showCustomerCenter() {
//		return "customer_center/customer_center";
//    }

	@GetMapping("customer_center")
	public void showCustomerCenter() {
	}

	@GetMapping("/announcement")
	public void showAnnouncement() {
	}

	@GetMapping("/chatbot")
	public void showChatbot() {
	}

	@GetMapping("/customer-service")
	public void showCustomerService() {
	}

	@GetMapping("/faq")
	public void showFaq() {
	}
}
