package com.project.service;

import com.project.dto.ProductBoardDTO;
import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;

public interface ProductBoardService {
	
	// 상품 데이터 등록
	public void uploadProduct(ProductDTO uploadDto);
	public void uploadOptProduct(ProductOptDTO uploadOptDto);
	
	// 상품코드 받아오기
	public ProductDTO getCode(ProductDTO getCodeDto);
	// 상품 글쓰기
	public void write(ProductBoardDTO insertBoardDto);
	
}
