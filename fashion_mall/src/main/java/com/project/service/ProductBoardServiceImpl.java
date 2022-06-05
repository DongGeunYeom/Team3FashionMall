package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.project.dto.ProductBoardDTO;
import com.project.dto.ProductDTO;
import com.project.dto.ProductOptDTO;
import com.project.mapper.ProductAttachMapper;
import com.project.mapper.ProductBoardAttachMapper;
import com.project.mapper.ProductBoardMapper;
import com.project.mapper.ProductMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductBoardServiceImpl implements ProductBoardService {

	@Autowired
	private ProductBoardMapper mapper;
	
	@Autowired
	private ProductBoardAttachMapper boardAttachMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void uploadProduct(ProductDTO uploadDto) {
		log.info("상품 정보 등록 ", uploadDto);
		productMapper.register(uploadDto);
		
		if(uploadDto.getAttachList() == null|| uploadDto.getAttachList().size()<= 0) {
			return;
		}
		
		uploadDto.getAttachList().forEach(attach ->{
			attach.setPcode(uploadDto.getPcode());
			
			// 첨부파일 삽입
			attachMapper.insert(attach);
		});
	}
	
	@Transactional
	@Override
	public void uploadOptProduct(ProductOptDTO uploadOptDto) {
		log.info("상품 옵션 등록 ", uploadOptDto);
		productMapper.registerOption(uploadOptDto);
	}
	
	@Override
	public void write(ProductBoardDTO insertBoardDto) {
		mapper.register(insertBoardDto);
	}

	@Override
	public ProductDTO getCode(ProductDTO getCodeDto) {
		log.info("상품 코드 확인 ",getCodeDto);
		ProductDTO result = productMapper.getCode(getCodeDto);
		return result;
	}


}
