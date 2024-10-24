package com.bitc.jeogi.customer.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.customer.service.InquiryService;
import com.bitc.jeogi.customer.vo.InquiryVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/inquiry")
@RequiredArgsConstructor
public class InquiryController {

	private final InquiryService inquiryService;

	// 문의 목록 조회
	@GetMapping("/list")
	public String list(SearchCriteria cri, Model model) throws Exception {
		log.info("문의 목록 페이지 요청");
		Map<String, Object> map = inquiryService.list(cri);
		model.addAllAttributes(map);
		log.info("모델에 추가된 데이터: {}", map);
		return "inquiry/list";
	}

	// 문의 등록 페이지 이동
	@GetMapping("register")
	public String showRegisterPage() throws Exception {
		log.info(" 문의 등록 페이지로 이동");
		return "inquiry/register";
	}

	// 문의 등록 처리
	@PostMapping("register")
	public String register(InquiryVO vo, RedirectAttributes rttr) throws Exception {
		log.info(" 문의등록");
		String msg = inquiryService.regist(vo, rttr);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/inquiry/list";
	}

	// 문의 상세 조회 (조회수 증가 후 상세보기 페이지 이동)
	@GetMapping("/readView")
	public String readView(int inquiry_id, RedirectAttributes rttr) throws Exception {
		log.info("문의 상세 조회 요청");
		inquiryService.incrementViewCount(inquiry_id); // 조회수 증가
		rttr.addAttribute("inquiry_id", inquiry_id);
		return "redirect:/inquiry/read?inquiry_id=" + inquiry_id;
	}

	// 문의 상세보기 페이지
	@GetMapping("/read")
	public String read(int inquiry_id, Model model) throws Exception {
		log.info("문의 상세보기 페이지 요청");
		InquiryVO inquiry = inquiryService.getInquiry(inquiry_id);
		model.addAttribute("inquiry", inquiry);
		return "inquiry/read";
	}

	// 문의 수정 페이지 이동
	@GetMapping("/modify")
	public String modify(int inquiry_id, Model model) throws Exception {
		log.info("문의 수정 페이지 요청");
		InquiryVO inquiry = inquiryService.getInquiry(inquiry_id);
		model.addAttribute("inquiry", inquiry);
		return "inquiry/modify";
	}

	// 문의 수정 처리
	@PostMapping("/modify")
	public String modify(InquiryVO vo, RedirectAttributes rttr) throws Exception {
		log.info("문의 수정 처리");
		String msg = inquiryService.modify(vo);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/inquiry/read?inquiry_id=" + vo.getInquiry_id();
	}

	// 문의 삭제 처리
	@PostMapping("/delete")
	public String delete(int inquiry_id, RedirectAttributes rttr) throws Exception {
		log.info("문의 삭제 요청");
		String msg = inquiryService.delete(inquiry_id);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/inquiry/list";
	}
}
