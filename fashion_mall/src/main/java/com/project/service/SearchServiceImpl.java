package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.AdminCriteria;
import com.project.dto.ProductAttachDTO;
import com.project.dto.ProductDTO;
import com.project.mapper.SearchMapper;

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

	@Override
	public List<ProductAttachDTO> selectAttachList(int p_code) {
		// TODO Auto-generated method stub
		return mapper.selectAttachList(p_code);
	}

}
