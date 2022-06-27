package com.project.service;

import java.util.List;

import com.project.dto.AdminCriteria;
import com.project.dto.ProductAttachDTO;
import com.project.dto.ProductDTO;
public interface SearchService {
	public List<ProductDTO> searchList(AdminCriteria cri);
	public int searchTotalCnt(AdminCriteria cri);
	public List<ProductAttachDTO> selectAttach();
	public List<ProductAttachDTO> selectAttachList(int p_code);
}
