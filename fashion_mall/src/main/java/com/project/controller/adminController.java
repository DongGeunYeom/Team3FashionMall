package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.ProductDTO;
import com.project.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/*")
public class adminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin_register")
	public void register() {
		log.info("판매자 상품 등록 폼 요청");
	}
	
	@PostMapping("/admin_register")
	public String registerPost(ProductDTO insertDto) {
		log.info("판매자 상품 등록 요청"+insertDto);
		service.insert(insertDto);
		return "redirect:/";
	}
	
	@GetMapping("/admin_list")
	public void adminList(Model model) {
		log.info("판매자 상품 리스트 페이지 요청");
		List<ProductDTO> list=service.selectList();
		
		model.addAttribute("list",list);
	}
	
	@GetMapping("/admin_read")
	public void adminRead() {
		log.info("판매자 상품 리스트 페이지 요청");
	}
	
	
	
}
