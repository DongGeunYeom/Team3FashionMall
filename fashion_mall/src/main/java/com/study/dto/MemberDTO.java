package com.study.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDTO {
	
	private String user_id;
	private String password;
	private String name;
	private String person_num1;
	private String person_num2;
	private String email;
	private String phone_num;
	private String address;

}
