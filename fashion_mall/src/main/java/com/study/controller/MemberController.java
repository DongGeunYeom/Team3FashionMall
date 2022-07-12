package com.study.controller;

import java.security.Principal;
import java.util.Random;

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

import javax.mail.Message;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;


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
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	
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
	
	//이메일 인증 아이디 찾기 / 비번 찾기
	@GetMapping("/mailCheck1")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return senderService.sendEmail(email);
	}
	
	
	// --------------------------------------------------------------
	// 회원가입 시 인증메일 전송
	/* 이메일 인증 */
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증 메일 주소 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 : " + checkNum);
        
        
        /* 이메일 보내기 */
        // String setFrom = "mdr111333@gmail.com";		// 아이디말고 이메일 전체 주소		ex) hong123@gmail.com
        String setFrom = "soooohyuneeee@gmail.com";		// 아이디말고 이메일 전체 주소		ex) hong123@gmail.com
        
        String toMail = email;	// 수신받을 이메일. regist.jsp에서 받은 이메일 주소인 변수 email 사용.
        String title = "KED'LOS 회원가입 인증 이메일 입니다.";	// 보낼 이메일의 제목
        String content = 
                "KED'LOS를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        // 인증번호(checkNum)를 String 타입으로 형변환 값을 String 타입 변수 num에 할당한다
        String num = Integer.toString(checkNum);
        
        return num;
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
	
	// 아이디 중복 체크
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
