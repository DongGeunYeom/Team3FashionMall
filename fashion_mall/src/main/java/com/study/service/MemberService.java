package com.study.service;

import com.study.dto.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public boolean register(MemberDTO register);

	// 아이디 중복 체크
	public int idCheck(String userid);
	
	// --------------------------------------------

   //아이디 찾기
   public MemberDTO findId(String name, int person_num1);

   //비밀번호 찾기
   public MemberDTO findPwd(String name, int person_num1, String userid);
   
   //비밀번호 수정
   public boolean pwdModify(String userid, String password);
	
   //회원정보 가져오기
   public MemberDTO myinfo(String userid);
   
   //회원 탈퇴
   public boolean delete(String userid);
}
