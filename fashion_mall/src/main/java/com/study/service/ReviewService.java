package com.study.service;

import java.util.List;

import com.study.dto.ReviewAttachDTO;
import com.study.dto.ReviewCriteria;
import com.study.dto.ReviewDTO;
import com.study.dto.ReviewPageDTO;

public interface ReviewService {
	// 리뷰 글 목록 불러오기
	public ReviewPageDTO getReviewList(ReviewCriteria cri, int bno);
	
	// 리뷰 글 등록
	public void reviewRegister(ReviewDTO registerDto);
	// 리뷰 글 첨부파일 등록
	public List<ReviewAttachDTO> reviewAttachList(int rno);
	
	// 리뷰 글 조회
	public ReviewDTO reviewGetDetail(int rno);
	
	// 문의 답변 수정 
	public int reviewModify(ReviewDTO modifyDto);
		
	// 문의 글 삭제
	public int reviewDelete(ReviewDTO deleteDto);
	
}
