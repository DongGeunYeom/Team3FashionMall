package com.study.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.dto.CartDTO;
import com.study.dto.Criteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductOptDTO;
import com.study.dto.QnaDTO;
import com.study.dto.QnaPageDTO;
import com.study.dto.ReviewAttachDTO;
import com.study.dto.ReviewCriteria;
import com.study.dto.ReviewDTO;
import com.study.dto.ReviewPageDTO;
import com.study.service.AdminService;
import com.study.service.BoardService;
import com.study.service.CartService;
import com.study.service.QnaService;
import com.study.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/board/*")
public class BoardAjaxController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AdminService adminService;
	
	// 상품 상세페이지 사진 가져오기
	@GetMapping("/getProductAttachList")
	public ResponseEntity<List<ProductAttachDTO>> getProductAttachList(int p_code){
		log.info("첨부파일 가져오기 "+p_code);
		
		return new ResponseEntity<List<ProductAttachDTO>>(adminService.attachList(p_code), HttpStatus.OK);
	}
	
	@GetMapping(path="/{color}/{code}")
	public ResponseEntity<List<String>> checkSize(@PathVariable("color")String po_color, @PathVariable("code")int p_code){
		log.info("사이즈 확인 요청 "+po_color+" "+p_code);
		List<String> list = service.checkSize(po_color, p_code);
		
		List<String> sizeList = list.stream().distinct().collect(Collectors.toList());
		log.info("사이즈 중복제거 확인"+sizeList);
		
		return new ResponseEntity<List<String>>(sizeList, HttpStatus.OK);
	}
	
	@GetMapping(path="/{color}/{code}/{size}")
	public ResponseEntity<Integer> checkAmount(@PathVariable("color")String po_color, @PathVariable("code")int p_code, @PathVariable("size")String po_size){
		log.info("재고 확인 요청 "+po_color+" "+p_code+" "+po_size);
		
		return new ResponseEntity<Integer>(service.checkAmount(po_color, p_code, po_size), HttpStatus.OK);
	}
	
	@PostMapping(path="/addCart",consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> addCart(@RequestBody CartDTO insertDto){
		log.info("카트 담기 요청 "+insertDto);
		return cartService.addCart(insertDto)==1?new ResponseEntity<String>("success", HttpStatus.OK):
			new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	@PostMapping(path="/checkCart")
	public ResponseEntity<Integer> checkCart(@RequestBody CartDTO checkDto){
		log.info("장바구니 중복 확인 요청 "+checkDto);
		int result = cartService.checkCart(checkDto);
		log.info("중복 값 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@GetMapping(path="/pages/{bno}/{page}")
	public ResponseEntity<QnaPageDTO> qnaGetList(@PathVariable("bno") int bno, @PathVariable("page")int page){
		log.info("상품 문의글 리스트 요청 "+bno+" "+page);
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<QnaPageDTO>(qnaService.getList(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(path="/auth/{bno}/{page}")
	public ResponseEntity<QnaPageDTO> qnaGetAllList(@PathVariable("bno") int bno, @PathVariable("page")int page){
		log.info("상품 문의글 및 비밀글 리스트 요청 "+bno+" "+page);
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<QnaPageDTO>(qnaService.getAllList(cri, bno), HttpStatus.OK);
	}
	
	@PostMapping(path="/qnaRegister")
	public ResponseEntity<Integer> qnaRegister(@RequestBody QnaDTO registerDto){
		log.info("문의글 등록 요청 "+registerDto);
		
		int result = qnaService.qnaRegister(registerDto);
		
		log.info("문의글 등록 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@PostMapping(path="/qnaSecretRegister")
	public ResponseEntity<Integer> qnaSecretRegister(@RequestBody QnaDTO secretDto){
		log.info("비밀글 등록 요청 "+secretDto);
		
		int result = qnaService.qnaSecretRegister(secretDto);
		
		log.info("비밀글 등록 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@GetMapping(path="/qnaGetSecret/{qno}/{user_id}")
	public ResponseEntity<QnaDTO> qnaGetSecret(@PathVariable("qno") int qno, @PathVariable("user_id") String user_id){
		log.info("비밀글 조회 요청 "+qno+" "+user_id);
		QnaDTO secretDto = qnaService.qnaGetSecret(qno, user_id);
		return new ResponseEntity<QnaDTO>(secretDto, HttpStatus.OK);
	}
	
	
	@PutMapping(path="/{qno}")
	public ResponseEntity<Integer> qnaAnswer(@PathVariable("qno") int qno, @RequestBody QnaDTO answerDto){
		log.info("답변글 등록 요청 "+answerDto+" "+qno);
		
		int result = qnaService.qnaAnswer(answerDto);
		
		log.info("답변글 등록 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@PutMapping(path="/qnaModify/{qno}")
	public ResponseEntity<Integer> qnaModify(@PathVariable("qno") int qno, @RequestBody QnaDTO modifyDto){
		log.info("답변글 수정 요청 "+modifyDto+" "+qno);
		
		int result = qnaService.qnaModify(modifyDto);
		
		log.info("답변글 수정 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@PutMapping(path="/qnaChange/{qno}")
	public ResponseEntity<Integer> qnaChange(@PathVariable("qno") int qno, @RequestBody QnaDTO changeDto){
		log.info("문의글 수정 요청 "+changeDto+" "+qno);
		
		int result = qnaService.qnaChange(changeDto);
		
		log.info("문의글 수정 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@PutMapping(path="/qnaSecretOpen/{qno}")
	public ResponseEntity<Integer> qnaSecretOpen(@PathVariable("qno") int qno, @RequestBody QnaDTO changeDto){
		log.info("비밀글 공개 요청 "+changeDto+" "+qno);
		
		int result = qnaService.qnaSecretOpen(changeDto);
		
		log.info("비밀글 공개 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	
	@DeleteMapping(path="/qnaDelete/{qno}")
	public ResponseEntity<Integer> qnaDelete(@PathVariable("qno") int qno, @RequestBody QnaDTO deleteDto){
		log.info("답변글 삭제 요청 "+deleteDto+" "+qno);
		
		int result = qnaService.qnaDelete(deleteDto);
		
		log.info("답변글 삭제 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	
	// 리뷰 관련 컨트롤러 
	@GetMapping(path="/rvpages/{bno}/{rvpage}")
	public ResponseEntity<ReviewPageDTO> reviewGetList(@PathVariable("bno") int bno, @PathVariable("rvpage")int rvpage){
		log.info("리뷰글 리스트 요청 "+bno+" "+rvpage);
		ReviewCriteria cri = new ReviewCriteria(rvpage, 10);
		
		return new ResponseEntity<ReviewPageDTO>(reviewService.getReviewList(cri, bno), HttpStatus.OK);
	}
	
	@PostMapping(path="/reviewRegister")
	public ResponseEntity<String> reviewRegister(@RequestBody ReviewDTO registerDto){
		log.info("리뷰글 등록 요청 "+registerDto);
		
		reviewService.reviewRegister(registerDto);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping(path="/{rno}")
	public ResponseEntity<ReviewDTO> reviewGetDetail(@PathVariable("rno") int rno){
		log.info("리뷰글 조회 요청 "+rno);
		ReviewDTO getDto = reviewService.reviewGetDetail(rno);
		return new ResponseEntity<ReviewDTO>(getDto, HttpStatus.OK);
	}
	
	//첨부파일 가져오기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<ReviewAttachDTO>> getAttachList(int rno){
		log.info("첨부파일 가져오기 "+rno);
			
		return new ResponseEntity<List<ReviewAttachDTO>>(reviewService.reviewAttachList(rno), HttpStatus.OK);
	}
	
	@PutMapping(path="/reviewModify/{rno}")
	public ResponseEntity<Integer> reviewModify(@PathVariable("rno") int rno, @RequestBody ReviewDTO modifyDto){
		log.info("리뷰글 수정 요청 "+modifyDto+" "+rno);
		
		int result = reviewService.reviewModify(modifyDto);
		
		log.info("리뷰글 수정 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	
	@DeleteMapping(path="/reviewDelete/{rno}")
	public ResponseEntity<Integer> reviewDelete(@PathVariable("rno") int rno, @RequestBody ReviewDTO deleteDto){
		log.info("리뷰글 삭제 요청 "+deleteDto+" "+rno);
		
		int result = reviewService.reviewDelete(deleteDto);
		
		log.info("리뷰글 삭제 확인 "+result);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}
	

}
