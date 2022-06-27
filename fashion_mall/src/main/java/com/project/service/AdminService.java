package com.project.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.project.dto.AdminCriteria;
import com.project.dto.ProductAttachDTO;
import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;


public interface AdminService {
	
	public void insert(ProductDTO insertDto);
	public List<ProductDTO> selectList(AdminCriteria cri);
	public List<ProductOptDTO> selectOpt(int p_code);
	// --------------------------------
		public List<ProductDTO> getList(AdminCriteria cri);
		
		public int getTotalCnt(AdminCriteria cri);
		
		public ProductDTO getRow(int p_code);
		
		// 첨부파일
		public List<ProductAttachDTO> attachList(int p_code);
	
	public void updateAdmin(ProductDTO insertDto);
		
	
}
