package com.study.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.MemberDTO;
import com.study.dto.ProductAttachDTO;
import com.study.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/regist")
	public void getRegister() {
		log.info("regist() 회원가입 폼 호출");
	}
		
	@PostMapping("/regist")
	public String register(MemberDTO regist) {
		log.info("회원가입 요청 " + regist);
		
		if(service.register(regist)) {	// 회원가입 성공 시 
			return "redirect:/member/login";	// 로그인 페이지 보여주기
		}
		return "/member/register";
	}
	
	
	// 로그인
	@GetMapping("/login")
	public void getLogin() {
		log.info("login() 로그인 폼 호출");
	}
	
	
	// 로그인 오류시
	@GetMapping("/login-error")
	public String loginError(Model model) {
		model.addAttribute("loginError", "아이디나 비밀번호를 확인해 주세요");
		return "/member/login";
	}
	
		
	// regist10.jsp 아이디 중복 체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String userid) {
		int cnt = service.idCheck(userid);
		return cnt;
	}
	
	// --------------------------------------------------------------
	
	// 아이디 찾기
	@GetMapping("/findid")
	public void findidGet() {
		log.info("아이디 찾기 사이트 요청");
	}
	
	//아이디 찾기
	@PostMapping("/findid")
	public String findidPost(MemberDTO memberDto, Model model, RedirectAttributes rttr) {
		
		log.info("아이디 찾기 폼 요청 "+memberDto.getName()+" "+memberDto.getPerson_num1()+" "+memberDto.getPerson_num2());
		
		MemberDTO findid = service.findId(memberDto.getName(), memberDto.getPerson_num1());
		
		if(findid != null) {
			
			log.info("주민번호 뒷자리 확인");
			log.info("db에서 불러 온거 "+findid.getPerson_num2()+" 지금 받은거 : "+memberDto.getPerson_num2());
			if(encoder.matches(memberDto.getPerson_num2(), findid.getPerson_num2())) {
				
				rttr.addFlashAttribute("name", memberDto.getName());
				rttr.addFlashAttribute("user_id", findid.getUser_id());
				return "redirect:/member/findSid";
			}
			
			//입력정보가 틀렸다고 정보 띄워주기
			rttr.addFlashAttribute("check", "false");
			return "redirect:/member/findid";
					
		}
		
		//입력정보가 틀렸다고 정보 띄워주기
		rttr.addFlashAttribute("check", "false");
		return "redirect:/member/findid";
	}
	
	@GetMapping("/findSid")
	public void findSidGet() {
		log.info("찾은 아이디 확인");
	}
	
	@GetMapping("/findpwd")
	public void findpwdGet() {
		log.info("비밀번호 찾기 요청");
	}
	
	//비밀번호 찾기
	@PostMapping("/findpwd")
	public String findpwdPost(MemberDTO memberDto, RedirectAttributes rttr) {
		log.info("비밀번호 찾기 폼 요청 "+memberDto.getName()+" "+memberDto.getPerson_num1()+" "+memberDto.getPerson_num1()+" "+memberDto.getUser_id());
			
		MemberDTO findpwd = service.findPwd(memberDto.getName(), memberDto.getPerson_num1(), memberDto.getUser_id());
		
		if(findpwd != null) {
			
			if(encoder.matches(memberDto.getPerson_num2(), findpwd.getPerson_num2())) {	
				//널이 아니라면 일단은 수정 페이지로
				log.info(memberDto.getUser_id());
				rttr.addFlashAttribute("user_id", memberDto.getUser_id());
				return "redirect:/member/pwdmodify";
			}
			
			//입력정보가 틀리면 다시 찾기 페이지로
			rttr.addFlashAttribute("check", "false");
			return "redirect:/member/findid";
		}
		
		//입력정보가 틀리면 다시 찾기 페이지로
		rttr.addFlashAttribute("check", "false");
		return "redirect:/member/findpwd";
	}
	
	//비밀번호 수정
	@GetMapping("/pwdmodify")
	public void pwdmodifyGet() {
		log.info("비밀번호 수정 폼 요청");
	}
	
	//비밀번호 수정
	@PostMapping("/pwdmodify")
	public String pwdmodifyPost(String user_id, String password) {
		log.info("비밀번호 수정 요청");
		
		service.pwdModify(user_id, password);
		
		return "/member/login";
	}

	//마미페이지 들어가기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myinfo")
	public void myinfo_Get(Principal principal, Model model, RedirectAttributes rttr) {
		log.info("회원정보수정 or 구매내역조회 페이지로 들어가기 "+principal);
		
		//여기 받은 아이디를 통해서 회원 정보 가져오기
		MemberDTO myinfo = service.myinfo(principal.getName());
		
		model.addAttribute("MemberDto", myinfo);
		model.addAttribute("user_id", principal.getName());
	}
	
	//내정보 가져오기
	@GetMapping("/getMyinfo")
	public ResponseEntity<MemberDTO> getMyinfo(String user_id){
		
		log.info("내 정보 가져오기 json");
		
		return new ResponseEntity<MemberDTO>(service.myinfo(user_id), HttpStatus.OK);
	}
	
	//회원 정보 삭제
	@GetMapping("/deleteMyinfo")
	public ResponseEntity<Boolean> deleteMyinfo(String user_id, String password,HttpSession session) {
		log.info("딜리트 삭제");
		
		//비밀번호 확인을 위해 한번 더 불러줌
		MemberDTO myInfodto = service.myinfo(user_id);
		
		log.info(myInfodto.toString());
		
		//비밀번호 일치시 첫번 째 확인 -> 확인 안할시 비밀번호가 달라도 삭제 되어버림
		if(encoder.matches(password, myInfodto.getPassword())) {
			//그리고 나서 받은 이름과 아이디로 삭제 
			if(service.delete(user_id)) {
				session.invalidate();
				return new ResponseEntity<Boolean>(true, HttpStatus.OK);
			}
			return new ResponseEntity<Boolean>(false, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	//회원 정보 수정으로 들어가기 직전 비밀번호 검사
	@GetMapping("/pwdmodifyTest")
	public ResponseEntity<Boolean> pwdModifyTest(Principal principal, String password) {
		log.info("비밀번호 변경 폼으로 들어가기");
		
		log.info(principal.getName());
		MemberDTO myInfodto = service.myinfo(principal.getName());
		
		if(encoder.matches(password, myInfodto.getPassword())) {
			return new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}
		return new ResponseEntity<Boolean>(false, HttpStatus.OK);
	}
	
	//회원 정보 수정에서 비밀 번호 수정
	@GetMapping("/myInfoPwdModify")
	public ResponseEntity<Boolean> pwdModify(Principal principal, String password) {
		log.info("비밀번호 수정해주기");
		
		//비밀번호 찾기 때 있던 비밀번호 수정 재 사용
		service.pwdModify(principal.getName(), password);
		
		return new ResponseEntity<Boolean>(true, HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
