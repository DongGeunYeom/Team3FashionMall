package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;
import com.project.service.ProductBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/product/*")
public class AjaxController {

	@Autowired 
	private ProductBoardService service;
	
	@PostMapping(path="/uploadProduct", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> postProduct(@RequestBody ProductDTO insertDto){
		log.info("상품 정보 업로드 요청 "+insertDto);
		
		try {
			service.uploadProduct(insertDto);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping(path="/uploadOptProduct", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> postProductOpt(@RequestBody ProductOptDTO insertOptDto){
		log.info("상품 옵션 업로드 요청 "+insertOptDto);
		
		try {
			service.uploadOptProduct(insertOptDto);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping("/getCode")
	public ResponseEntity<ProductDTO> getCode(ProductDTO getCodeDto){
		log.info("코드요청 "+getCodeDto);
		
		return new ResponseEntity<ProductDTO>(service.getCode(getCodeDto), HttpStatus.OK);
	}
	
	
}
