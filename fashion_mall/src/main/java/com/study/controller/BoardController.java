package com.study.controller;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dto.AdminCriteria;
import com.study.dto.AdminPageDTO;
import com.study.dto.MemberDTO;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductBoardDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;
import com.study.service.BoardService;
import com.study.service.MemberService;
import com.study.service.SearchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/register")
	public void registerGet() {
		log.info("register 폼 요청");
	}
	
	@GetMapping("/read")
	public void getRead() {
		log.info("읽기 페이지 호출");
	}
	
	@GetMapping("/productDetail")
	public void getRead2(int bno, Model model) {
		log.info("읽기 페이지 2 호출" + bno);
		
		// p_code가 없을 경우 리턴하기
		if(service.getDetail(bno) == null) {
			return;
		}
		 
		ProductBoardDTO readDto = service.getDetail(bno);
		log.info("읽기 페이지 2 객체" + readDto);
		
		ProductDTO productDto = readDto.getProduct();
		log.info("읽기 페이지 상품 객체"+productDto);
		
		List<ProductOptDTO> optionDto = productDto.getOptList();
		log.info("옵션 리스트" + optionDto);
		
		List<ProductAttachDTO> attachDto = readDto.getAttachList();
		log.info("첨부파일 리스트 "+attachDto);
		
		// 상품 색상 선택시 중복 제거
		List<String> list = optionDto.stream().map(s->s.getPo_color()).distinct().collect(Collectors.toList());
		log.info("색상 제거 "+list);
		
		// 회원정보 입력
		model.addAttribute("readDto", readDto);
		model.addAttribute("productDto", productDto);
		model.addAttribute("optionDto", optionDto);
		model.addAttribute("colorList", list);
		model.addAttribute("attachList", attachDto);
	}
	
	
	@GetMapping("/checkout")
	public void getCheckout() {
		log.info("주문서 페이지 호출");
	}
	
	@GetMapping("/address")
	public void getAddress() {
		log.info("테스트 페이지 호출");
	}
	
	@GetMapping("/search")
	public void search(@ModelAttribute("cri") AdminCriteria cri,Model model) {
		log.info("검색 페이지 요청");
		
		log.info("판매자 상품 리스트 페이지 요청");
		log.info("전체 리스트 요청 "+cri);
		
		//리스트 실행할때 마다 pageNum과 amount를 받아서 cri에 저장
		List<ProductDTO> sList=searchService.searchList(cri);
		//각 리스트의 p_code 리스트
		//전체 게시물 개수
		int total = searchService.searchTotalCnt(cri);
		//attach 불러와라
		List<ProductAttachDTO> attach=searchService.selectAttach();
		
		for(ProductAttachDTO dto:attach) {
			String uploadPath=dto.getUploadpath();
			
			uploadPath=uploadPath.replaceAll("\\\\", "/");
			
			dto.setUploadpath(uploadPath);
		}
		
		
		
		log.info("사진값"+attach);
		model.addAttribute("pageDto", new AdminPageDTO(cri, total));
		log.info("뭐뭐 넣어서 보내주냐?"+sList);
		model.addAttribute("sList", sList);
		model.addAttribute("attach", attach);
		
		
	}

}
