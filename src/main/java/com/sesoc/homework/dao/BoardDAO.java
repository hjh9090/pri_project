package com.sesoc.homework.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.homework.vo.CatVO;
import com.sesoc.homework.vo.DogVO;
import com.sesoc.homework.vo.EtcVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession session;
	
	
	
	public ArrayList<DogVO> dogBoard () {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<DogVO> list = null;
		try {
			list = mapper.dogBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertDog(DogVO dog) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = mapper.insertDog(dog);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public DogVO goDog(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		DogVO dog = mapper.goDog(boardnum);
		return dog;
	}
	public int deleteDog (int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.deleteDog(boardnum);
		return result;
	}
	
	public int updateDog (DogVO dog) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.updateDog(dog);
		return result;
	}
	
	// 강아지 게시판
	
	public ArrayList<CatVO> catBoard () {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<CatVO> list = null;
		try {
			list = mapper.catBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int insertCat(CatVO cat) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = mapper.insertCat(cat);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public CatVO goCat(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		CatVO cat = mapper.goCat(boardnum);
		return cat;
	}
	public int deleteCat (int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.deleteCat(boardnum);
		return result;
	}
	
	public int updateCat (CatVO cat) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.updateCat(cat);
		return result;
	}
	
	
	// 고양이
	
	public ArrayList<EtcVO> etcBoard () {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		ArrayList<EtcVO> list = null;
		try {
			list = mapper.etcBoard();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int insertEtc(EtcVO etc) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		try {
			result = mapper.insertEtc(etc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public EtcVO goEtc(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		EtcVO etc = mapper.goEtc(boardnum);
		return etc;
	}
	public int deleteEtc (int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.deleteEtc(boardnum);
		return result;
	}
	
	public int updateEtc (EtcVO etc) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int result = 0;
		result = mapper.updateEtc(etc);
		return result;
	}
	
	
	
	
	// 그 외 동물들
	
	
	
	
//	public int insertdog(BoardVO board) {
//		BoardMapper mapper = session.getMapper(BoardMapper.class);
//		int result = 0;
//		try {
//			result = mapper.insertdog(board);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
}
