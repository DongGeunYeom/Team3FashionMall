package com.study.service;

import java.util.List;

import com.study.dto.ProductAttachDTO;

public interface IndexService {
	
	// 인기순 
	public List<ProductAttachDTO> indexList();
	
	// 상품별 인기순
	public List<ProductAttachDTO> TopList(String p_type);

	// 최신순
	public List<ProductAttachDTO> indexListNew();
	
	
}
