package com.project.mapper;

import java.util.List;

import com.project.dto.ProductDTO;

public interface AdminMapper {
	public int insert(ProductDTO insertDto);
	public List<ProductDTO> selectList();
}
