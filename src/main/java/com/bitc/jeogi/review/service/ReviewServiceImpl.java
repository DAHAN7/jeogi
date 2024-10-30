package com.bitc.jeogi.review.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.FileUtil;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.review.dao.ReviewDAO;
import com.bitc.jeogi.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewServiceImpl implements ReviewService {

	private final ReviewDAO reviewDAO;
	private final String uploadDir;

	@Transactional
	@Override
	public void write(ReviewVO review, MultipartFile file) throws Exception {
		review.setImages("");
		if (file != null && !file.isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file);
			review.setImages(uploadedFileName);
		}
		reviewDAO.insert(review);
	}

	@Override
	public ReviewVO detail(int review_id) throws Exception {
		return reviewDAO.selectById(review_id);
	}

	@Override
	public String update(ReviewVO review, MultipartFile file) throws Exception {
		review.setImages("");
		if (file != null && !file.isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file);
			review.setImages(uploadedFileName);
		}
		reviewDAO.update(review);
		return "리뷰가 성공적으로 수정되었습니다.";
	}
	
	@Override
	public void update(ReviewVO rv) {
		System.out.println("수정 : " + rv);
		reviewDAO.updateContent(rv);
	}

	@Override
	public String delete(int review_id) throws Exception {
		reviewDAO.delete(review_id);
		return "리뷰가 성공적으로 삭제되었습니다.";
	}

	@Override
	public List<ReviewVO> listCriteria(Criteria cri) throws Exception {
		return reviewDAO.selectList(cri);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri, int totalCount) throws Exception {
		return new PageMaker(cri, totalCount);
	}

	@Override
	public int countByAccommodationId() throws Exception {
		return reviewDAO.countByAccommodationId();
	}

	@Override
	public List<ReviewVO> getAllList() {
		return reviewDAO.getAllList();
	}

	@Override
	public ReviewVO findMemberId(int review_id) {
		return reviewDAO.findMemberId(review_id);
	}

	@Override
	public ReviewVO getById(int review_id) {
		return reviewDAO.getById(review_id);
	}

	@Override
	public int getTotalCount() {
		return reviewDAO.getTotalCount();
	}

	@Override
	public List<ReviewVO> getPageReview(Criteria cri) {
		return reviewDAO.getPageReview(cri);
	}

	@Override
	public List<ReviewVO> getReviewsByAccommodation(int accommodation_num) {
		try {
			return reviewDAO.getReviewsByAccommodation(accommodation_num);
		} catch (Exception e) {
			log.error("숙소 ID: {}에 대한 리뷰 조회 중 오류 발생: ", accommodation_num, e);
			throw e; // 예외를 상위로 전파
		}
	}

	// 빨간줄 떠서 일단 추가
	@Override
	public void write(ReviewVO vo) {
		// TODO Auto-generated method stub

	}

}
