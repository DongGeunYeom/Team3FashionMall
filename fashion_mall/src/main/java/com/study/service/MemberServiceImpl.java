package com.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.AuthDTO;
import com.study.dto.MemberDTO;
import com.study.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

//	// 아이디 중복체크 위해서 만든 리파지토리
//	@Autowired
//	private MemberRepository memberRepository;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
		
	@Transactional
	@Override
	public boolean register(MemberDTO register) {
		
		// 사용자가 입력한 비밀번호를 암호화
		register.setPassword(encoder.encode(register.getPassword()));
		
		// 주민번호 뒷자리 암호화
		// register.setPerson_num2(encoder.encode(register.getPerson_num2()));
		
		// 회원가입
		boolean result = mapper.insert(register)==1?true:false;
		
		// AuthDTO auth = new AuthDTO(register.getUser_id(), "ROLE_ADMIN");
		// mapper.registerAuth(auth);
		
		// 권한 부여
		AuthDTO auth = new AuthDTO(register.getUser_id(), "ROLE_USER");
		mapper.registerAuth(auth);
		
		return result;
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String userid) {
		int cnt = mapper.idCheck(userid);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	
	// -----------------------------------------------
	
	
   //아이디 찾기
   @Override
   public MemberDTO findId(String name, int person_num1) {
      return mapper.findId(name, person_num1);
   }

   //비밀번호 찾기
   @Override
   public MemberDTO findPwd(String name, int person_num1, String userid) {
      return mapper.findPwd(name, person_num1, userid);
   }

   // 비밀번호 수정
   @Override
   public boolean pwdModify(String userid, String password) {
      
      //다시 암호화 해주기
      password = encoder.encode(password);
      
      return mapper.pwdmodify(userid, password);
   }
   
   //회원정보 가져오기 위한 service
	@Override
	public MemberDTO myinfo(String userid) {
		return mapper.myinfo(userid);
	}

	//회원 탈퇴
	@Override
	public boolean delete(String userid) {
		return mapper.delete(userid) == 1 ? true: false;
	}




}
