package com.sesoc.homework.dao;

import com.sesoc.homework.vo.MemberVO;

public interface MemberMapper {

	//회원 가입 
	public int insertMember(MemberVO member);
	
	//ID 중복 체크
	public int getMember(String id);
	
	//로그인 정보 확인 후 로그인
	public int loginMember(MemberVO member);
	
	//회원 탈퇴
	public int deleteMember(MemberVO member);
	
	//DB에서 맴버를 가지고 올 때
	public MemberVO allMember (String id);
	
	//회원정보 수정
	public int updateMember (MemberVO member);
	
}
