package com.project.mapper;

import java.util.List;

import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;

import lombok.extern.slf4j.Slf4j;


public interface AdminMapper {
	public int insert(ProductDTO insertDto);
	public int OptInsert(ProductOptDTO opt);
	public List<ProductDTO> selectList();
	
}
