package com.project.mapper;

import java.util.List;

import com.project.dto.AdminCriteria;
import com.project.dto.ProductAttachDTO;
import com.project.dto.ProductDTO;

public interface SearchMapper {
	public List<ProductDTO> searchList(AdminCriteria cri);
	public String selectAttach(ProductAttachDTO insertDto);
	public int searchTotalCnt(AdminCriteria cri);
	public List<ProductAttachDTO> selectAttach();
	public List<ProductAttachDTO> selectAttachList(int p_code);
	//	public ProductAttachDTO searchAttach();
}
