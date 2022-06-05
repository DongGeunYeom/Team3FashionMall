package com.project.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDTO {
	private String userid;
	private String password;
	private String name;
	private String regdate;
	private String phonenum;
	
	//주민 번호 앞자리 뒷자리
	private int personnum1;
	private String personnum2;
	
	private boolean enabled;
	
	//한명에게 여러가지 권한이 있을수도 있기에 리스트로 생성
	private List<AuthDTO> authList;
}

