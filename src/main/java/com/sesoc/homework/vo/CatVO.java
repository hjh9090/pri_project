package com.sesoc.homework.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CatVO {

	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private String originalfile;
	private String savedfile;
	
	
}
