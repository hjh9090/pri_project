package com.sesoc.homework.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	
	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	} 
	
	
	
	
}
