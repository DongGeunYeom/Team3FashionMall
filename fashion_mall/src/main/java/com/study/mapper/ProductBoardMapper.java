package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.ProductBoardDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;

public interface ProductBoardMapper {
	
	// 제품 상세 페이지 불러오기
	public ProductBoardDTO getDetailPage(int bno);
	
	// 제품 상세 페이지에 필요한 상품정보 불러오기
	public ProductDTO getDetailProduct(int p_code);
	
	public List<String> checkSize(@Param("po_color") String po_color,@Param("p_code") int p_code);
	
	public int checkAmount(@Param("po_color") String po_color, @Param("p_code") int p_code,@Param("po_size") String psize);
}
