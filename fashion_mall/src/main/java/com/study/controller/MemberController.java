package com.study.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
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
import com.study.service.EmailSend;
import com.study.service.MailSendService;
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
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private EmailSend senderService;
	
	@GetMapping("/regist")
	public void getRegister() {
		log.info("regist() 회원가입 폼 호출");
	}
		
	@PostMapping("/regist")
	public String register(MemberDTO regist, String userEmail1, String userEmail2) {
		log.info("회원가입 요청 " + regist);
		
		String email = userEmail1 + userEmail2; 
		
		regist.setEmail(email); 
		
		if(service.register(regist)) {	// 회원가입 성공 시 
			return "redirect:/member/login";	// 로그인 페이지 보여주기
		}
		return "/member/register";
	}
	
	
	//이메일 인증 아이디 찾기 / 비번 찾기
	@GetMapping("/mailCheck1")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return senderService.sendEmail(email);
	}
		
	// 로그인
	@GetMapping("/login")
	public void getLogin() {
		log.info("login() 로그인 폼 호출");
	}
	
	// 네이버 로그인
	@GetMapping("/naverlogin")
	public void naverlogin() {
		log.info("네이버 로그인");
	}
	
	// 네이버 콜백
	@GetMapping("/naverlogin_callback")
	public void naverlogin_callback() {
		log.info("네이버 콜백");
	}

	// 로그인 오류시
	@PostMapping("/login-error")
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
	public String findidPost(MemberDTO memberDto, Model model, RedirectAttributes rttr, String userEmail1, String userEmail2) {
		
		//이메일 인증으로 바꿔주기
		String email = userEmail1 + userEmail2;
		
		log.info("아이디 찾기 폼 요청 "+memberDto.getName()+" "+ email);
		
		MemberDTO findid = service.findId(memberDto.getName(), email);
		
		if(findid != null) {				
			rttr.addFlashAttribute("name", memberDto.getName());
			rttr.addFlashAttribute("user_id", findid.getUser_id());
			return "redirect:/member/findSid";					
		}
		
		//입력정보가 틀렸다고 정보 띄워주기
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
	public String findpwdPost(MemberDTO memberDto, RedirectAttributes rttr, String userEmail1, String userEmail2) {
		
		//이메일 인증으로 바꿔주기
		String email = userEmail1 + userEmail2;
		
		log.info("비밀번호 찾기 폼 요청 "+memberDto.getName()+" "+memberDto.getUser_id()+" "+email);
			
		MemberDTO findpwd = service.myinfo(memberDto.getUser_id());
		
		log.info(findpwd.toString());
		
		//현재 내가 친 이메일과 db상 이메일이 맞는지 확인
		if(findpwd.getEmail() != email) {
			//아이디 보내는 이유 input hidden으로 하여금 아이디와 일치하는 비밀번호를 바꿔주기 위함
			rttr.addFlashAttribute("user_id", memberDto.getUser_id());
			return "redirect:/member/pwdmodify";
			
		}
		
		//입력정보가 틀리면 다시 찾기 페이지로
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
		log.info("비밀번호 수정 요청"+user_id);
		
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
	public ResponseEntity<Boolean> deleteMyinfo(String user_id, String password, HttpSession session) {
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
