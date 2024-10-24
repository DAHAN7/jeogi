package com.bitc.jeogi.accommodation.service;

import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.jeogi.accommodation.dao.AccommodationDAO;
import com.bitc.jeogi.accommodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.FileUtil;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccommodationService {
	private final AccommodationDAO ad;
	private final String uploadDir;

	public AccommodationVO accommodation_detail(int accommodation_num) {
		return ad.accommodation_detail(accommodation_num);
	}

	public int getTotalCount() {
		return ad.getTotalCount();
	}

	public List<AccommodationVO> getPageAccommodation(Criteria cri) {

		return ad.selectList(cri);
	}

	public void accommodation_writer(AccommodationVO ac, MultipartFile[] file) throws Exception {
		// 파일 여러개 넣으면 아마 무조건 오류 날거임
		// 하지만 일단 넘어감
		if (file != null && !file[0].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[0]);
			ac.setAccommodation_mainimages(uploadedFileName);
		}
		if (file != null && !file[1].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[1]);
			ac.setAccommodation_images1(uploadedFileName);
		}
		if (file != null && !file[2].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[2]);
			ac.setAccommodation_images2(uploadedFileName);
		}
		ad.insert(ac);
	}

	public String accommodation_update(AccommodationVO ac, MultipartFile[] file) throws Exception {
		int result = ad.accommodation_update(ac);
		ad.accommodation_update(ac);
		if (file != null && !file[0].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[0]);
			ac.setAccommodation_mainimages(uploadedFileName);
		}
		if (file != null && !file[1].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[1]);
			ac.setAccommodation_images1(uploadedFileName);
		}
		if (file != null && !file[2].isEmpty()) {
			String uploadedFileName = FileUtil.uploadFile(uploadDir, file[2]);
			ac.setAccommodation_images2(uploadedFileName);
		}
		return "숙소가 성공적으로 수정되었습니다.";
	}

	public String accommodation_delete(int accommodation_num) throws Exception {
		ad.accommodation_delete(accommodation_num);
		return "숙소가 성공적으로 삭제가 되었습니다.";
	}

	public AccommodationVO findMemberId(int accommodation_num) {
		return ad.findMemberId(accommodation_num);
	}

	public List<AccommodationVO> getPopularAccommodations(Criteria criteria) {
		List<AccommodationVO> popularAccommodations = ad.getPopularAccommodations(criteria);
		if (popularAccommodations.isEmpty()) {
			System.out.println("인기 숙소가 없습니다.");
		}
		return popularAccommodations;
	}

	public AccommodationVO getById(int accommodation_num) throws NotFoundException {
		AccommodationVO accommodation = ad.getAccommodationById(accommodation_num);
		if (accommodation == null) {
			throw new NotFoundException("ID: " + accommodation_num + "에 해당하는 숙소를 찾을 수 없습니다.");
		}
		return accommodation;

	}

}