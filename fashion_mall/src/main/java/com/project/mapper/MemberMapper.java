package com.project.mapper;

import org.apache.ibatis.annotations.Param;

import com.project.dto.AuthDTO;
import com.project.dto.MemberDTO;

public interface MemberMapper {
	
	//회원 가입
	public boolean register(MemberDTO registerDto);
	public int registerAuth(AuthDTO auth);
	
	//로그인
	public MemberDTO read(String userid);
	
	//아이디 중복확인
	public String dupId(String userid);

	//아이디 찾기 전 비밀번호 끌어오기
	public MemberDTO beforeFindId(@Param("name") String name, @Param("personnum1") int personnum1);
	
	//아이디 찾기
	public int findId(@Param("name") String name, @Param("personnum1") int personnum1, @Param("personnum2") String personnum2);
	
	//비밀번호 찾기
	public String findPwd(@Param("name") String name, @Param("personnum1") int personnum1, @Param("personnum2") String personnum2, @Param("userid") String userid);
	
	
}
