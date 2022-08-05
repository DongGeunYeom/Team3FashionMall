package com.study.service;

import java.util.List;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.dto.SearchCriteria;

public interface SearchService {
	public List<ProductDTO> searchList(AdminCriteria cri);
	public int searchTotalCnt(AdminCriteria cri);
	public List<ProductAttachDTO> selectAttach();
	//제품 사진 한개만 불러오기
	public List<ProductAttachDTO>selectAttachOne(int p_code);
	
}
