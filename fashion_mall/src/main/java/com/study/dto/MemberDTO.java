package com.study.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDTO {
	
	private String user_id;
	private String password;
	private String name;
//	private int person_num1;
//	private String person_num2;
	private String email;
	private String phone_num;
	private String address;
	private String reg_date;
	
	//한명에게 여러가지 권한이 있을수도 있기에 리스트로 생성
	private List<AuthDTO> authList;

}
