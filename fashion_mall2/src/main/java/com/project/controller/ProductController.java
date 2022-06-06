package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.ProductBoardDTO;
import com.project.dto.ProductDTO;
import com.project.service.ProductBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/productboard/*")
public class ProductController {
	
	@Autowired
	private ProductBoardService boardService;
	
	@GetMapping("/productregister")
	public void productRegsiterGet() {
		log.info("상품 등록 페이지 요청");
	}
	
	@GetMapping("/shopdetail")
	public void shopDetailGet() {
		log.info("상품 상세 페이지 요청");
	}
	
	@PostMapping("/productregister")
	public void productRegsiterPost(ProductBoardDTO insertBoardDto) {
		log.info("상품 등록 페이지 업로드 요청 "+insertBoardDto);
		boardService.write(insertBoardDto);
		
	}
	
	@GetMapping("/test")
	public void testGet() {
		log.info("테스트 페이지");	
	}

	
}
