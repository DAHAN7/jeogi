package com.bitc.jeogi.reservation.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.reservation.service.ReservationService;
import com.bitc.jeogi.reservation.vo.ReservationVO;
import com.bitc.jeogi.review.dto.MemberDTO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("reservation/")
public class ReservationController {

    private final ReservationService rs;

    @GetMapping("")
    public String redirectToList() {
        return "redirect:/reservation/reservation_list";
    }

    @GetMapping("reservation_detail")
    public void reservation_detail(int reservation_num, Model model) throws Exception {
        ReservationVO vo = rs.reservation_detail(reservation_num);
        model.addAttribute("reservation", vo);
    }

    @GetMapping("reservation_list")
    public void reservation_list(Criteria cri, Model model) throws Exception {
        int totalCount = rs.getTotalCount(cri);
        PageMaker pm = new PageMaker(cri, totalCount);
        List<ReservationVO> reservation_list = rs.getPageReservation(cri);
        model.addAttribute("reservation_list", reservation_list);
        model.addAttribute("pm", pm);
    }

    @GetMapping("reservation_writer")
    public String reservation_writer() {
        return "/reservation/reservation_writer";
    }

    @PostMapping("reservation_writer")
    public String reservation_writer(ReservationVO reser, HttpSession session, String accommodation_num) {
        int accommodationNum = 1;

        try {
            if (accommodation_num != null && !accommodation_num.isEmpty()) {
                accommodationNum = Integer.parseInt(accommodation_num);
            }
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("accommodation_num 변환 오류", e);
        }

        MemberDTO member = (MemberDTO) session.getAttribute("member");
        if (member == null) {
            throw new NullPointerException("세션에 'member' 객체가 없습니다.");
        }

        if (reser == null) {
            throw new NullPointerException("ReservationVO 객체가 null입니다.");
        }

        boolean isWriter = rs.reservation_writer(reser, member.getMember_num(), accommodationNum);
        return "redirect:/reservation/reservation_list";
    }
}
