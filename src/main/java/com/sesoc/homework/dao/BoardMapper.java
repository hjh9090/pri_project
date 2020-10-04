package com.sesoc.homework.dao;

import java.util.ArrayList;

import com.sesoc.homework.vo.CatVO;
import com.sesoc.homework.vo.DogVO;
import com.sesoc.homework.vo.EtcVO;

public interface BoardMapper {

	//개랑 강아지
	public ArrayList<DogVO> dogBoard ();
	
	public int insertDog(DogVO dog);
	
	public DogVO goDog(int boardnum);
	
	public int deleteDog(int boardnum);

	public int updateDog (DogVO dog);
	
	// 고양이
	public ArrayList<CatVO> catBoard();
	
	public int insertCat(CatVO cat);
	
	public CatVO goCat(int boardnum);
	
	public int deleteCat(int boardnum);
	
	public int updateCat (CatVO cat);
	//그 외
	public ArrayList<EtcVO> etcBoard ();
	
	public int insertEtc(EtcVO etc);
	
	public EtcVO goEtc(int boardnum);
	
	public int deleteEtc(int boardnum);
	
	public int updateEtc (EtcVO etc);
	

	
}
