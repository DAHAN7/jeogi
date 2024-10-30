package com.bitc.jeogi.review.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.vo.ReviewVO;

public interface ReviewService {
	void write(ReviewVO review, MultipartFile file) throws Exception;

	ReviewVO detail(int review_id) throws Exception;

	String delete(int review_id) throws Exception;

	List<ReviewVO> listCriteria(Criteria cri) throws Exception;

	PageMaker getPageMaker(Criteria cri, int totalCount) throws Exception;

	int countByAccommodationId() throws Exception;

	List<ReviewVO> getAllList();

	ReviewVO findMemberId(int review_id);

	ReviewVO getById(int review_id);

	int getTotalCount();

	List<ReviewVO> getPageReview(Criteria cri);

	String update(ReviewVO review, MultipartFile file) throws Exception;

	List<ReviewVO> getReviewsByAccommodation(int accommodationNum);

	void write(ReviewVO vo);

	void update(ReviewVO rv);
}