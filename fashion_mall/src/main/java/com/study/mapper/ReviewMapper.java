package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.ReviewCriteria;
import com.study.dto.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 글 목록 추출 + 총 개수세기
	public List<ReviewDTO> reviewGetList(@Param("cri")ReviewCriteria cri, @Param("bno") int bno);
	public int getCountRno(int bno);
	
	// 리뷰 글 등록
	public int reviewRegister(ReviewDTO registerDto);
	
	// 리뷰 글 조회
	public ReviewDTO reviewGetDetail(int rno);
	
	// 답변글 수정
	public int reviewModify(ReviewDTO modifyDto);
		
	// 답변글 삭제
	public int reviewDelete(ReviewDTO deleteDto);
}
