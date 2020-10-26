package com.sesoc.homework.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.homework.dao.BoardDAO;
import com.sesoc.homework.vo.CatVO;
import com.sesoc.homework.vo.DogVO;


@Controller
@RequestMapping("board")
public class BoardController {

	
	@Autowired
	private BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//강아지 게시판 관련
	@GetMapping("dogForm")
	public String godog(Model model) {
		
		logger.info("개/강아지 게시판으로 이동");
		ArrayList<DogVO> list = dao.dogBoard();
		model.addAttribute("list", list);
		return "board/dogForm";
	}
	
	@GetMapping("dogWrite")
	public String gowrite() {
		logger.info("강아지 작성으로 이동");
		return "board/dogWrite";
	}
	
	@PostMapping("writeD")
	public String writeD (DogVO dog,HttpSession httpsession) {
		dog.setId((String)httpsession.getAttribute("sessionid"));
		dao.insertDog(dog);
		return "redirect:/board/dogForm";
	}
	
	@GetMapping("readDog")
	public String readDog(int boardnum, Model model) {
		DogVO dog = dao.goDog(boardnum);
		model.addAttribute("dog", dog);
		return "board/dogRead";
	}
	
	@ResponseBody
	@GetMapping("deleteDog")
	public String deleteDog(int boardnum, Model model, HttpSession httpsession) {
		DogVO dog = dao.goDog(boardnum);
		if(dog.getId().equals(httpsession.getAttribute("sessionid"))) {
			dao.deleteDog(boardnum);
			return "true";
		}
		return "false";
	}
	
	@GetMapping("updateDog")
	public String updateDog(int boardnum, Model model) {
		
		DogVO dog = dao.goDog(boardnum);
		model.addAttribute("dog", dog);
		return "board/updateDog";
	}
	
	@PostMapping("updateD")
	public String updateD (DogVO dog,HttpSession httpsession) {
		dog.setId((String)httpsession.getAttribute("sessionid"));
		System.out.println(dao.updateDog(dog));
		if(dao.updateDog(dog) == 1) {
			return "true";
		} else {
			return "false";
		}
		
	}
	
	
	//고양이 게시판 관련
	@GetMapping("catForm")
	public String gocat() {
		
		logger.info("고양이 게시판으로 이동");
		return "board/catForm";
	}
	
	@GetMapping("catWrite")
	public String gowrite2() {
		logger.info("고양이 작성으로 이동");
		return "board/catWrite";
	}
	
	@PostMapping("writeC")
	public String writeC (CatVO cat,HttpSession httpsession) {
		cat.setId((String)httpsession.getAttribute("sessionid"));
		dao.insertCat(cat);
		return "redirect:/board/catForm";
	}
	
	@GetMapping("readCat")
	public String readCat(int boardnum, Model model) {
		CatVO cat = dao.goCat(boardnum);
		model.addAttribute("cat", cat);
		return "board/catRead";
	}
	
	@ResponseBody
	@GetMapping("deleteCat")
	public String deleteCat(int boardnum, Model model, HttpSession httpsession) {
		CatVO cat = dao.goCat(boardnum);
		if(cat.getId().equals(httpsession.getAttribute("sessionid"))) {
			dao.deleteCat(boardnum);
			return "true";
		}
		return "false";
	}
	
	@GetMapping("updateCat")
	public String updateCat(int boardnum, Model model) {
		
		
		CatVO cat = dao.goCat(boardnum);
		model.addAttribute("cat", cat);
		return "board/updateCat";
	}
	
	@PostMapping("updateC")
	public String updateC (CatVO cat,HttpSession httpsession) {
		cat.setId((String)httpsession.getAttribute("sessionid"));
		System.out.println(dao.updateCat(cat));
		if(dao.updateCat(cat) == 1) {
			return "true";
		} else {
			return "false";
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
//	@GetMapping("board/boardForm")
//	public String goBoardForm (int category, Model model) {
//		if (category == 0)
//		{
//			logger.info("강아지/개 페이지에 들어왔습니다");
//			
//		} else if (category == 1)
//		{
//			logger.info("고양이 페이지에 들어왔습니다");
//		} else 
//		{
//			logger.info("그 외 반려동물 페이지에 들어왔습니다");
//		}
//		ArrayList<BoardVO> list = dao.getBoard(category);
//		model.addAttribute("list", list);
//		model.addAttribute("category", category);
//		
//		return "board/boardForm";
//	}
//	
//	@GetMapping("board/writeForm")
//	public String goWrite(int category, Model model) {
//		logger.info("글 쓰기 페이지에 들어왔습니다");
//		ArrayList<BoardVO> list = dao.getBoard(category);
//		model.addAttribute("list", list);
//		model.addAttribute("category", category);
//		return "board/writeForm";
//	}
//	
//	@PostMapping("board/write")
//	public String write (int category, Model model,BoardVO board, HttpSession httpsession) {
//		board.setId((String)httpsession.getAttribute("sessionid"));
//		logger.debug(board.getContent());
//		dao.insertBoard(board);
//		return "redirect:/board/boardForm";
//	}
	
	
	
}
