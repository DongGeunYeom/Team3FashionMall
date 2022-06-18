package com.study.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.dto.ProductAttachDTO;
import com.study.service.IndexService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/*")
public class MainController {
	
	@Autowired
	private IndexService service;
		
	@GetMapping("/index")
	public void index3(Model model) {
		
		List<ProductAttachDTO> list = service.indexList();
		
		log.info(list.toString());
		
		model.addAttribute("Attach", list);
		
		log.info("index 호출");
	}

	//index.js에서 첨부파일 영역에 넣어줄 때 사용
	//파일 리스트 가져오기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<ProductAttachDTO>> getAttachList(){
		
		log.info("첨부 파일 ");
		
		return new ResponseEntity<List<ProductAttachDTO>>(service.indexList(), HttpStatus.OK);
	}
	
	//최신순으로 가져오기 service 수정 해야함
	@GetMapping("/getAttachList2")
	public ResponseEntity<List<ProductAttachDTO>> getAttachList2(){
		
		log.info("첨부 파일 ");
		
		return new ResponseEntity<List<ProductAttachDTO>>(service.indexListNew(), HttpStatus.OK);
	}
	
	//상품별 인기순 가져오기
	@GetMapping("/getTopList")
	public ResponseEntity<List<ProductAttachDTO>> getTopList(String p_type){
		
		log.info("첨부 파일 ");
		
		return new ResponseEntity<List<ProductAttachDTO>>(service.TopList(p_type), HttpStatus.OK);
	}

	
	@GetMapping("/displayindex")
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("이미지 요청 "+fileName);
		
		File file = new File("c:\\upload\\"+fileName);
		
		ResponseEntity<byte[]> image = null;
		
		HttpHeaders header = new HttpHeaders();
		try {
			//페이지에서 header의 Content-Type을 이걸로 하겠다고 추가해주는 부분
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return image;
	}
    
    
}
