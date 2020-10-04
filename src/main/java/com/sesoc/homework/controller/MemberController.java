package com.sesoc.homework.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.homework.dao.MemberDAO;
import com.sesoc.homework.vo.MemberVO;

@Controller
public class MemberController {

	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDAO dao;
	
	@GetMapping("joinForm")
	public String gojoin() {
		logger.info("회원가입 창에 이동하였습니다");
		return "member/joinForm";
	}
	
	@ResponseBody
	@PostMapping(value = "checkId", produces = "applications/json;charset=UTF-8")
	public String checkId (String id) {
		 int result = dao.getMember(id);
		 if(result >=  1) {
			 return "이미 존재하는 ID입니다";
		 }
		 return "사용가능 한 ID 입니다";
	}
	
	@PostMapping("join")
	public String join (MemberVO member) {
		logger.info("전달 된 객체 : {}", member);
		String id = member.getId();
		if(dao.getMember(id) >= 1) {
			return "errorPage";
		}
		dao.insertMember(member);
		return "redirect:/";
	}
	
	@GetMapping("loginForm")
	public String goLogin () {
		logger.info("로그인 페이지에 들어왔습니다");
		
		return "member/loginForm";
	}
	
	@ResponseBody
	@PostMapping("login")
	public String login(String id, String password, HttpSession httpsession) {
		MemberVO member = new MemberVO(id, password);
		
		if(dao.loginMember(member)) {
			httpsession.setAttribute("sessionid", id);
			httpsession.setAttribute("sessionpass", password);
//			return "redirect:/";
			return "true";
		}
			return "false";
	}
	
//	@ResponseBody
	@GetMapping("logout")
	public String logout(HttpSession httpsession) {
		httpsession.invalidate();
		logger.debug("로그아웃 버튼이 실행 되었습니다");
		return "redirect:/";
	}
	
	@GetMapping("deleteForm")
	public String godelete() {
		logger.info("회원 탈퇴 페이지로 이동하였습니다.");
		return "member/deleteForm";
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String delete(String password, HttpSession httpsession) {
		MemberVO member = dao.allMember((String)httpsession.getAttribute("sessionid")); // 멤버가 나와야됨
		
		if(member.getPassword().equals(password)) {
			httpsession.invalidate();
			dao.deleteMember(member);
			return "redirect:/";
		}
		return "errorPage";
	}
	
	@GetMapping("updateForm")
	public String goUpdate(HttpSession httpsession, Model model) {
		logger.info("회원 정보 수정 페이지로 이동했습니다");
		String id = (String)httpsession.getAttribute("sessionid");
		MemberVO member = dao.allMember(id);
		model.addAttribute("member", member);
		
		return "member/updateForm";
	}
	
	@ResponseBody
	@PostMapping("update")
	public String update (HttpSession httpsession, MemberVO member) {
		String id = (String)httpsession.getAttribute("sessionid");
		member.setId(id);
		if(dao.updateMember(member) == 1) {
			return "true"; 
		}
		return "false";
	}
}
