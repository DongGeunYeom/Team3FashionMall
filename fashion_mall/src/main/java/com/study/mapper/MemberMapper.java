package com.study.mapper;

import org.apache.ibatis.annotations.Param;

import com.study.dto.AuthDTO;
import com.study.dto.MemberDTO;

public interface MemberMapper {
	
	public int registerAuth(AuthDTO auth);

	// 시큐리티 로그인
	public MemberDTO read(String userid);
	
	// 회원가입
	public int insert(MemberDTO register);	

	// regist10.jsp 
	// 아이디 중복 체크
	public int idCheck(String userid);
	
	// ------------------------------
	
   //아이디 찾기
   public MemberDTO findId(@Param("name") String name, @Param("person_num1") int person_num1);
   
   //비밀번호 찾기
   public MemberDTO findPwd(@Param("name") String name, @Param("person_num1") int person_num1, @Param("user_id") String userid);
   
   //비밀번호 수정
   public boolean pwdmodify(@Param("user_id") String userid, @Param("password") String password);
	
   //회원정보 가져오기 
   public MemberDTO myinfo(String userid);
   
   //회원 탈퇴
   public int delete(String userid);
   
   
	
}
