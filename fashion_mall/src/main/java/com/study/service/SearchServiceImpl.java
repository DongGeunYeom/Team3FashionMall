package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.mapper.SearchMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper mapper;
	
	@Override
	public List<ProductDTO> searchList(AdminCriteria cri) {
		log.info("값 잘 들어왔니?"+cri);
		//리스트 불러오기(cri 작업 안했음)
		List<ProductDTO> pList =mapper.searchList(cri);
		return pList;
	}
	
	@Override
	public int searchTotalCnt(AdminCriteria cri) {
		return mapper.searchTotalCnt(cri);
	}

	@Override
	public List<ProductAttachDTO> selectAttach() {
		return mapper.selectAttach();
	}

}
