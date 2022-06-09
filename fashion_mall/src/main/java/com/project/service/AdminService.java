package com.project.service;


import java.util.List;

import com.project.dto.ProductDTO;


public interface AdminService {
	
	public void insert(ProductDTO insertDto);
	public List<ProductDTO> selectList();
	
}
