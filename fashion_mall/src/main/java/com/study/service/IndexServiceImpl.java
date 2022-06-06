package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.ProductAttachDTO;
import com.study.mapper.ProductAttachMapper;

@Service
public class IndexServiceImpl implements IndexService {

	@Autowired
	private ProductAttachMapper mapper;

	@Override
	public List<ProductAttachDTO> indexList() {
		return mapper.select();
	}

	@Override
	public List<ProductAttachDTO> TopList(String p_type) {
		return mapper.selectTop(p_type);
	}
	


}
