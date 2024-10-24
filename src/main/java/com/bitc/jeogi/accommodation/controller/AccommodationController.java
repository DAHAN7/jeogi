package com.bitc.jeogi.accommodation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.accommodation.service.AccommodationService;
import com.bitc.jeogi.accommodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("accommodation/")
public class AccommodationController {
	private final AccommodationService as;

	@GetMapping("accommodation")
	public void accommodation() {
	}

	@GetMapping("accommodation_detail")
	public String accommodation_detail(int accommodation_num, Model model) throws Exception {
		System.out.println("");
		AccommodationVO vo = as.accommodation_detail(accommodation_num);

		if (vo == null) {
			System.out.println("Error: Accommodation not found for number: " + accommodation_num);
			return "error"; // 적절한 에러 페이지로 리다이렉트
		}

		System.out.println("vo: " + vo); // vo가 null이 아닐 경우 출력
		model.addAttribute("accommodation", vo);
		return "accommodation/accommodation_detail"; // JSP 파일 경로
	}

	@GetMapping("accommodation_list")
	public void accommodation_list(Criteria cri, Model model) throws Exception {
		int totalCount = as.getTotalCount();
		System.out.println(totalCount);
		PageMaker pm = new PageMaker(cri, totalCount);
		List<AccommodationVO> accommodation_list = as.getPageAccommodation(cri);
		System.out.println("Accommodation List: " + accommodation_list);
		model.addAttribute("accommodation_list", accommodation_list);
		model.addAttribute("pm", pm);
	}

	@GetMapping("accommodation_writer")
	public String accommodation_writer() {
		log.info("숙소작성 페이지 요청");
		return "/accommodation/accommodation_writer";
	}

	/*
	 * 숙소 등록에 대한 요청을 처리하는 메소드
	 */
	@PostMapping("accommodation_writer")
	public String accommodation_writer(AccommodationVO vo, MultipartFile[] file, HttpSession session,
			RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("AccommodationVO" + vo);
		System.out.println("file" + file);
		MemberDTO member = (MemberDTO) session.getAttribute("member");

		if (member == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login";
		}

		if (file == null) {
			redirectAttributes.addFlashAttribute("msg", "파일이 선택되지 않았습니다.");
			return "redirect:/accommodation/accommodation_writer";
		}

		// 숙소 작성
		try {
			as.accommodation_writer(vo, file);
			redirectAttributes.addFlashAttribute("msg", "숙소가 성공적으로 등록되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "리뷰 등록 중 오류가 발생했습니다.");
			log.error("숙소 등록 중 오류 발생: ", e); // 오류 로그 추가
			e.printStackTrace();
		}
		return "redirect:/accommodation/accommodation_list?";
	}

	@GetMapping("accommodation_update")
	public String update(int accommodation_num, Model model, HttpSession s) throws Exception {

		AccommodationVO vo = as.findMemberId(accommodation_num);
		MemberDTO member = (MemberDTO) s.getAttribute("member");
		log.info("회원 정보: " + member);

		if (member != null) {
			if (vo.getMember_num() == member.getMember_num()) {
				log.info("숙소 수정 페이지 요청됨: accommodation_num = {}", accommodation_num);
				AccommodationVO accommodation = as.getById(accommodation_num);
				model.addAttribute("accommodation", accommodation);
				return "accommodation/accomoodation_update";
			} else {
				log.warn("로그인 불일치: accommodation_num = {}, member_id = {}", accommodation_num, member.getMember_num());
				return "redirect:/accommodation/accommodation_detail?accommodation_num=" + accommodation_num;
			}
		} else {
			return "redirect:/accommodation/accommodation_detail?accommodation_num=" + accommodation_num;
		}
	}

	/**
	 * 숙소 수정 처리 요청
	 */
	@PostMapping("accommodation_update")
	public String update(Model model, AccommodationVO av, MultipartFile[] file, HttpSession s, RedirectAttributes rttr)
			throws Exception {
		log.info("숙소 수정 요청됨: accommodation = {}", av);
		String msg = as.accommodation_update(av, file);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/accommodation/accommodation_list";
	}

	/**
	 * 숙소 삭제 처리
	 */
	@PostMapping("accommodation_delete")
	public String remove(int accommodation_num, HttpSession s, RedirectAttributes rttr) throws Exception {
		log.info("숙소 삭제 요청됨: accommodation_num = {}", accommodation_num);

		String msg = as.accommodation_delete(accommodation_num);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/accommodation/accommodation_list";
	}
}