package com.study.mapper;

import java.util.List;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;

public interface SearchMapper {
	public List<ProductDTO> searchList(AdminCriteria cri);
	//제품 사진 불러오기
	public List<ProductAttachDTO> selectAttach();
	public String selectAttach(ProductAttachDTO insertDto);
	public int searchTotalCnt(AdminCriteria cri);
	
}
