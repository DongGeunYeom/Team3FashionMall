package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dto.AuthDTO;
import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	@Override
	public boolean register(MemberDTO memberDto) {
		
		//사용자가 입력한 비밀번호를 암호화
		memberDto.setPassword(encoder.encode(memberDto.getPassword()));
		
		//주민번호 뒷자리 암호화
		memberDto.setPersonnum2(encoder.encode(memberDto.getPersonnum2()));

		//회원가입
		boolean result = mapper.register(memberDto);
		
		//권한부여
		AuthDTO auth = new AuthDTO(memberDto.getUserid(), "ROLE_USER");
		mapper.registerAuth(auth);
		
		//관리자 권한
		//auth = new AuthDTO(memberDto.getUserid(), "ROLE_ADMIN");
		//mapper.registerAuth(auth);
		
		return result;
	}

	@Override
	public boolean registerAuth(AuthDTO auth) {
		return false;
	}
	
	//아이디 중복확인
	@Override
	public String dupId(String userid) {
		return mapper.dupId(userid);
	}


	// 아이디 찾기 전 작업
	@Override
	public MemberDTO beforeFindId(String name, int personnum1) {
		return mapper.beforeFindId(name, personnum1);
	}
	
	//아이디 찾기
	@Override
	public int findId(String name, int personnum1, String personnum2) {
		return mapper.findId(name, personnum1, personnum2);
	}

	//비밀번호 찾기
	@Override
	public String findPwd(String name, int personnum1, String personnum2, String userid) {
		return mapper.findPwd(name, personnum1, personnum2, userid);
	}


	
	
	

}
