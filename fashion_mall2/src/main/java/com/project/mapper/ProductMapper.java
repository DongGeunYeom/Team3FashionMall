package com.project.mapper;

import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;

public interface ProductMapper {
	
	// ajax - 상품 등록
	public void register(ProductDTO insertDto);
	public void registerOption(ProductOptDTO insertOptDto);
	
	// 상품코드 가져오기
	public ProductDTO getCode(ProductDTO getDto);
	
}
