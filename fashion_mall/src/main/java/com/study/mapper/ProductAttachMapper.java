package com.study.mapper;

import java.util.List;

import com.study.dto.ProductAttachDTO;

public interface ProductAttachMapper {
	
	// 인기순 불러오기
	public List<ProductAttachDTO> select();
	
	// 최신순 불러오기
	
	
	// 상의 인기순 불러오기
	public List<ProductAttachDTO> selectTop(String p_type);
	
	
}
