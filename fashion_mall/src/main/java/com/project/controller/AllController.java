package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class AllController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("/index")
	public void index() {
		log.info("인덱스 페이지 요청");
	}
	
	@GetMapping("/login")
	public void loginGet() {
		log.info("로그인 페이지 요청");
	}
	
	
	//로그인 실패시 메세지 띄우기
	@PostMapping("/login-error")
	public String loginError(Model model) {
		log.info("로그인 실패");
		model.addAttribute("loginError", "아이디나 비밀번호를 확인해 주세요.");
		return "/login";
	}
	
	@PostMapping("/regist")
	public String registPost(boolean agree, RedirectAttributes rttr, MemberDTO registerDto){
		log.info("회원가입 성공시 로그인 페이지로 넘겨줌");
		
		//약관동의를 했다면 로그인 페이지 보여주기
		if(agree) {
			
			//insert해주기
			boolean result = service.register(registerDto);
			if(result) {
				rttr.addFlashAttribute("msg", "true");
				return "redirect:/login";
			}
		}
		//안했다면 register 되돌려 보내기
		rttr.addFlashAttribute("check","false"); //체크를 안하면 check에 false담기
		return "redirect:/register";	
	}
	
	@GetMapping("/register")
	public void registerGet() {
		log.info("회원가입 페이지 요청");
	}
	
	// isAuthenticated() : 인증된 사용자인 경우 true
	@PreAuthorize("isAuthenticated()") 
	@GetMapping("/board")
	public void boardGet() {
		log.info("게시판 페이지 요청");
	}
	
	@GetMapping("/qna")
	public void qnaGet() {
		log.info("공지사항 페이지 요청");
	}
	
	@GetMapping("/findid")
	public void findidGet() {
		log.info("아이디 찾기 사이트 요청");
	}
	
	//아이디 찾기
	@PostMapping("/findid")
	public String findidPost(MemberDTO memberDto, Model model) {
		log.info("아이디 찾기 폼 요청 "+memberDto.getName()+" "+memberDto.getPersonnum1()+" "+memberDto.getPersonnum2());
		
		MemberDTO beforeFindid = service.beforeFindId(memberDto.getName(), memberDto.getPersonnum1());

		if(beforeFindid != null) {
			
			log.info("주민번호 뒷자리 확인 "+beforeFindid.getPersonnum2()+" "+memberDto.getPersonnum2());
			
			if(encoder.matches(memberDto.getPersonnum2(), beforeFindid.getPersonnum2())) {
				log.info("true 확인");
				log.info("아이디 확인 "+beforeFindid.getUserid());
				model.addAttribute(beforeFindid.getUserid());
				return "redirect:/login";
			}
			log.info("false 확인");
			return "redirect:/findid";
		}
		//입력정보가 틀렸다고 정보 띄워주기
		return "redirect:/findid";
	}
	
	@GetMapping("/findpwd")
	public void findpwdGet() {
		log.info("비밀번호 찾기 요청");
	}
	
	//비밀번호 찾기
	@PostMapping("/findpwd")
	public String findpwdPost(MemberDTO memberDto, String name, int personnum1, String personnum2, String userid) {
		log.info("비밀번호 찾기 폼 요청 "+name+" "+personnum1+" "+personnum2+" "+userid);
		String findpwd = service.findPwd(name, personnum1, personnum2, userid);
		
		if(findpwd != null) {
			//널이 아니라면 일단은 수정 페이지로
			return "redirect:/pwdmodify";
		}
		
		log.info(findpwd);
		
		//입력정보가 틀리면 다시 찾기 페이지로
		return "/findpwd";
	}
	
	//비밀번호 수정
	@GetMapping("/pwdmodify")
	public void pwdmodifyGet() {
		log.info("비밀번호 수정 폼 요청");
	}
	
	//비밀번호 수정
	@PostMapping("/pwdmodify")
	public String pwdmodifyPost() {
		log.info("비밀번호 수정 요청");
		
		//수정구문 넣기
		
		return "/login";
	}
		
	//중복 아이디 검사
	@ResponseBody // 리턴하는 값이 jsp가 아니라는걸 말해줌
	@PostMapping("checkId")
	public String checkId(String userid) {
		log.info("중복 아이디 검사 "+userid);
		
		if(service.dupId(userid) != null) {
			return "false"; // jsp 페이지가 아님
		}
		return "true";
	}
	
}
