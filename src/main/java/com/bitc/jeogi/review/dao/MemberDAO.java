package com.bitc.jeogi.review.dao;

import com.bitc.jeogi.review.dto.MemberDTO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberDAO {

	@Select("SELECT * FROM member WHERE member_id = #{member_id}")
	MemberDTO findById(String member_id);

	@Select("SELECT * FROM member WHERE member_email = #{member_email}")
	MemberDTO findByEmail(String member_email);

	// 맴버 NUM으로 맴버 정보 반환
	@Select("SELECT * FROM member WHERE member_num = #{member_num}")
	MemberDTO getMemberByNum(int member_num);

	// 회원가입
	@Insert("INSERT INTO member (member_id, member_email, member_pw, member_name, member_phone,member_birth) "
			+ "VALUES (#{member_id}, #{member_email}, #{member_pw}, #{member_name}, #{member_phone},#{member_birth})")
	int insertMember(MemberDTO member);

	// 회원 정보 수정
	@Update("UPDATE member SET member_email=#{member_email}, member_pw=#{member_pw}, member_name=#{member_name}, "
			+ "member_phone=#{member_phone} member_birth=#{member_birth}WHERE member_id = #{member_id}")
	int updateMember(MemberDTO member);
}
