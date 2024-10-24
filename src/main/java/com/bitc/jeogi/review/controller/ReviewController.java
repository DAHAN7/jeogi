package com.bitc.jeogi.review.controller;

import java.net.http.HttpHeaders;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.FileUtil;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.dto.MemberDTO;
import com.bitc.jeogi.review.service.ReviewService;
import com.bitc.jeogi.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("review/")
@Slf4j
@RequiredArgsConstructor
public class ReviewController {

	private final ReviewService reviewService;

	/**
	 * 페이징 처리 된 리뷰 목록 페이지
	 */
	@GetMapping("list")
	public void listPage(Criteria cri, Model model) throws Exception {
		log.info("리뷰 목록 페이지 요청됨");
		int totalCount = reviewService.getTotalCount();
		PageMaker pm = new PageMaker(cri, totalCount);
		List<ReviewVO> reviewList = reviewService.getPageReview(cri);

		model.addAttribute("reviews", reviewList);
		model.addAttribute("pm", pm);
	}

	@GetMapping("write")
	public void write() throws Exception {
		log.info("리뷰작성 페이지 요청됨");
	}

	/**
	 * 리뷰 등록 요청 처리
	 */
	@PostMapping("write")
	public String write(ReviewVO review, MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes)
			throws Exception {
		System.out.println("Review: " + review);
		System.out.println("File: " + file);
		// 세션에서 맴버 정보 불어 옴.
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if (member == null) {
			redirectAttributes.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/member/login";
		}

		try {
			review.setMember_num(member.getMember_num());
			review.setAccommodation_num(1);
			reviewService.write(review, file);
			redirectAttributes.addFlashAttribute("msg", "리뷰가 성공적으로 등록되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "리뷰 등록 중 오류가 발생했습니다.");
			e.printStackTrace();
		}

		return "redirect:/review/list?accommodation_num=" + review.getAccommodation_num();
	}

	/**
	 * 리뷰 상세보기 페이지
	 */
	@GetMapping("detail")
	public void detail(int review_id, Model model) throws Exception {
		System.out.println("이지누1");
		log.info("리뷰 상세보기 페이지 요청됨: review_id = {}", review_id);

		// 리뷰 상세 조회
		ReviewVO vo = reviewService.detail(review_id);
		model.addAttribute("review", vo);
	}

	/**
	 * 리뷰 수정 페이지 요청 - 리뷰 수정 화면 출력
	 */
	@GetMapping("update")
	public String update(int review_id, Model model, HttpSession s) throws Exception {

		ReviewVO vo = reviewService.findMemberId(review_id);
		MemberDTO member = (MemberDTO) s.getAttribute("member");
		log.info("다한" + member);

		if (member != null) {
			if (vo.getMember_num() == member.getMember_num()) {
				log.info("리뷰 수정 페이지 요청됨: review_id = {}", review_id);
				ReviewVO review = reviewService.getById(review_id);
				model.addAttribute("review", review);
				return "review/update";
			} else {
				log.warn("로그인 불일치: review_id = {}, member_num = {}", review_id, member.getMember_num());
				return "redirect:/review/detail?review_id=" + review_id;
			}
		} else {
			return "redirect:/review/detail?review_id=" + review_id;
		}

	}

	/**
	 * 리뷰 수정 처리 요청
	 */
	@PostMapping("update")
	public String update(Model model, ReviewVO review, MultipartFile file, HttpSession s, RedirectAttributes rttr)
			throws Exception {
		log.info("리뷰 수정 요청됨: review = {}", review);
		log.info("ftuyfrytfruytfytfytfytfuj         " + file);
		String msg = reviewService.update(review, file);
		model.addAttribute("msg", msg);
		return "redirect:/review/list";

	}

//    @PostMapping("update")
//    public String update(ReviewVO vo, RedirectAttributes rttr) throws Exception {
//        log.info("리뷰 수정 요청됨: ReviewVO = {}", vo);
//
//        // 리뷰 수정 처리
//        String result = reviewService.update(vo);
//        rttr.addAttribute("review_id", vo.getReview_id());
//        rttr.addFlashAttribute("msg", result);
//        return "redirect:/review/detail";
//    }

	/**
	 * 리뷰 삭제 처리
	 */
	@PostMapping("delete")
	public String remove(int review_id, HttpSession s, RedirectAttributes rttr) throws Exception {
		log.info("리뷰 삭제 요청됨: review_id = {}", review_id);

		// 리뷰 삭제 처리
		MemberDTO loginMember = (MemberDTO) s.getAttribute("member");
		ReviewVO writer = reviewService.findMemberId(review_id);
		if (loginMember != null) {
			if (loginMember.getMember_num() == writer.getMember_num()) {

				String msg = reviewService.delete(review_id);
				rttr.addFlashAttribute("msg", msg);
				return "redirect:/review/list";

			} else {
				rttr.addFlashAttribute("msg", "글 작성자가 아니잔아요.");
				return "redirect:/review/list";
			}
		} else {
			rttr.addFlashAttribute("msg", "로그인안되어잇어요.");
			return "redirect:/review/list";
		}

	}

//	@PostMapping("reviews")
//	@ResponseBody
//	public ResponseEntity<String> reviews(ReviewVO vo, HttpSession session) {
//		System.out.println("AJAX 요청 받음");
//		System.out.println("rest - ReviewVO : " + vo);
//		MemberDTO member = (MemberDTO) session.getAttribute("member");
//		ResponseEntity<String> entity = null;
//		if (member == null) {
//			entity = new ResponseEntity<>("로그인 해주세요", HttpStatus.BAD_REQUEST);
//		}
//		vo.setMember_num(member.getMember_num());
//		
//		try {
//		System.out.println("ReviewVO : " + vo);
//		reviewService.write(vo);
//		entity = new ResponseEntity<>("작성 성공", HttpStatus.OK);
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		
//		
//		return entity;
//		
//	}
}
