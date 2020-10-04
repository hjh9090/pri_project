package com.sesoc.homework.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.homework.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public int insertMember (MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//end insert
	
	public int getMember (String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean loginMember (MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		
		try {
			result = mapper.loginMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result == 1) {
			return true;
		}
		return false;
	}
	
	public boolean deleteMember (MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.deleteMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result == 1) {
			return true;
		}
		return false;
	}
	
	public MemberVO allMember(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO member = null;
		try {
			member = mapper.allMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int updateMember (MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
