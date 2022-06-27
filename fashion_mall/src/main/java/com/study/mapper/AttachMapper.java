package com.study.mapper;

import java.util.List;

import com.study.dto.ReviewAttachDTO;

public interface AttachMapper {
	// 리뷰 사진 파일 등록
	public int reviewAttachRegister(ReviewAttachDTO registerDto);
	
	// 리뷰 사진 파일들 추출
	public List<ReviewAttachDTO> reviewAttachList(int rno);
	
	// 리뷰 사진 파일 전체 삭제
	public int deleteAll(int rno);
	
}
