package com.project.service;

import com.project.dto.AuthDTO;
import com.project.dto.MemberDTO;

public interface MemberService {
	
	//회원 가입
	public boolean register(MemberDTO registerDto);
	public boolean registerAuth(AuthDTO auth);
	
	//아이디 중복확인
	public String dupId(String userid);
	
	//아이디 찾기
	public MemberDTO beforeFindId(String name, int personnum1);

	//아이디 찾기
	public int findId(String name, int personnum1, String personnum2);

	//비밀번호 찾기
	public String findPwd(String name, int personnum1, String personnum2, String userid);
}
