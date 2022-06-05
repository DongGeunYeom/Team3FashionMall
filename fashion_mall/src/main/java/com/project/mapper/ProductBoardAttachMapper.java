package com.project.mapper;

import java.util.List;

import com.project.dto.ProductAttachDTO;

public interface ProductBoardAttachMapper {
	
	// 첨부파일 목록 추출
	public List<ProductAttachDTO> list(int bno);
	
	// 첨부파일 전체 삭제
	public int deleteAll(int bno);
	
	
	
}
