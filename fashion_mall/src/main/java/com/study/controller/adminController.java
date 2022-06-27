package com.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.dto.SearchCriteria;
import com.study.dto.AdminCriteria;
import com.study.dto.AdminPageDTO;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;
import com.study.service.AdminService;
import com.study.service.SearchService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/*")
public class adminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private SearchService searchService;
	
	@GetMapping("/admin_register")
	public void register() {
		log.info("판매자 상품 등록 폼 요청");
	}
	
	@PostMapping("/admin_register")
	public String registerPost(ProductDTO insertDto) {
		log.info("판매자 상품 등록 요청"+insertDto+"이거 값 들어오긴 함?"+insertDto.getOptList()+""+insertDto.getAttachList());
		service.insert(insertDto);
		return "redirect:/";
	}
	
	@GetMapping("/admin_list")
	public void adminList(Model model,@ModelAttribute("cri") AdminCriteria cri) {
		log.info("판매자 상품 리스트 페이지 요청");
		log.info("전체 리스트 요청 "+cri);
		//리스트 실행할때 마다 pageNum과 amount를 받아서 cri에 저장
		List<ProductDTO> list = service.getList(cri);
		
		//전체 게시물 개수
		int total = service.getTotalCnt(cri);
		
		//새로운 pageNum과 amount를 pageDto에 담아서 넘겨줌
		model.addAttribute("pageDto", new AdminPageDTO(cri, total));
		model.addAttribute("list", list);
	}
	//얘 가짜
		// 실행됨
		@GetMapping({"/admin_read","/admin_modify"})
		public void adminRead(int p_code,@ModelAttribute("cri") AdminCriteria cri, Model model) {
			log.info("판매자 상품 리스트 페이지 요청");
			
			log.info("게시물 보여주기 요청 혹은 수정 페이지 요청 "+p_code);
			log.info("게시물 요청 - cri "+cri);
			
			// read를 들어가면서 댓글 아래에 다른 게시물이 보여지도록
			List<ProductDTO> list = service.getList(cri);
			
			//
			List<ProductOptDTO> optList=service.selectOpt(p_code);
			
			// 전체 게시물 개수
			int total = service.getTotalCnt(cri);
			model.addAttribute("list", list);
			
			// 새로운 pageNum 과 amount를 pageDto 에 담아서 넘겨줌
			model.addAttribute("pageDto", new AdminPageDTO(cri, total));
			
			// read를 들어가면서 댓글 아래에 다른 게시물이 보여지도록
			
			ProductDTO dto = service.getRow(p_code);
			model.addAttribute("dto", dto);
			model.addAttribute("optlist", optList);

			
		}
	
	
	
	

	@PostMapping("/admin_modify")
	public String modifyPost(ProductOptDTO optDto,ProductDTO insertDto,RedirectAttributes rttr) {
		log.info("관리자 수정 요청"+optDto);
		
		service.updateAdmin(insertDto);
		
		rttr.addAttribute("p_code", insertDto.getP_code());
		return "redirect:/admin/admin_read";
	}
	
	@GetMapping("/accessDenied")
    public String accessDenied(){
		log.info("접근제한");
        return "accessDenied";
    }
	
	
	
}
