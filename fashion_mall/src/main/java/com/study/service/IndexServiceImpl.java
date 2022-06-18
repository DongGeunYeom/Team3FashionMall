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

	// 모든 상품별 인기순
	@Override
	public List<ProductAttachDTO> indexList() {
		return mapper.select();
	}

	// 상품별 인기순
	@Override
	public List<ProductAttachDTO> TopList(String p_type) {
		return mapper.selectTop(p_type);
	}

	// 최신순
	@Override
	public List<ProductAttachDTO> indexListNew() {
		return mapper.selectNew();
	}

	


}
