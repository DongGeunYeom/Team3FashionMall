package com.study.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;


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
