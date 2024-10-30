package com.bitc.jeogi.accommodation.controller;

import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.jeogi.review.service.ReviewService;
import com.bitc.jeogi.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/reviews")
public class ReviewRestController {

	private final ReviewService rs;

	// 리뷰 작성 (파일 업로드 포함)
	@PostMapping
	public ResponseEntity<String> createReview(@RequestParam("review") ReviewVO rv,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		System.out.println("리뷰 등록 처리");
		try {
			rs.write(rv, file); // 파일 업로드를 포함한 리뷰 작성 처리
			log.info("리뷰가 성공적으로 작성되었습니다: {}", rv);
			return ResponseEntity.ok("리뷰가 성공적으로 작성되었습니다.");
		} catch (Exception e) {
			log.error("리뷰 작성 중 오류 발생: ", e);
			return ResponseEntity.status(500).body("리뷰 작성 중 오류가 발생했습니다.");
		}
	}

	// 특정 숙소에 대한 모든 리뷰 조회
	@GetMapping("/accommodation/{accommodation_num}")
	public ResponseEntity<List<ReviewVO>> getReviewsByAccommodation(@PathVariable int accommodation_num) {
		ResponseEntity<List<ReviewVO>> entity = null;

		try {
			List<ReviewVO> reviews = rs.getReviewsByAccommodation(accommodation_num);
			entity = new ResponseEntity<>(reviews, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 리뷰 수정 (파일 업로드 포함)
	@PostMapping("/{review_id}")
	public ResponseEntity<String> updateReview(
			@PathVariable(name = "review_id") 
			int review_id,
			ReviewVO rv
			) {
		System.out.println(rv);
//		ReviewVO rv = null;
//		MultipartFile file = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","text/plain;charset=utf-8");
		try {
			rv.setReview_id(review_id); // 수정할 리뷰 ID 설정
			rs.update(rv); // 파일 업로드를 포함한 리뷰 수정 처리
			log.info("리뷰가 성공적으로 수정되었습니다: {}", rv);
			return ResponseEntity.status(200).headers(headers).body("리뷰가 성공적으로 수정되었습니다.");
		} catch (Exception e) {
			log.error("리뷰 수정 중 오류 발생: ", e);
			return ResponseEntity.status(500).headers(headers).body("리뷰 수정 중 오류가 발생했습니다.");
		}
	}

	// 리뷰 삭제
	@DeleteMapping("/{review_id}")
	public ResponseEntity<String> deleteReview(@PathVariable int review_id) {
		try {
			rs.delete(review_id);
			log.info("리뷰가 성공적으로 삭제되었습니다: review_id = {}", review_id);
			return ResponseEntity.ok("리뷰가 성공적으로 삭제되었습니다.");
		} catch (Exception e) {
			log.error("리뷰 삭제 중 오류 발생: ", e);
			return ResponseEntity.status(500).body("리뷰 삭제 중 오류가 발생했습니다.");
		}
	}
}
