package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.ProductDTO;
import com.project.mapper.AdminMapper;
import com.project.mapper.ProductAttachMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private ProductAttachMapper attachMapper;
	
	public void insert(ProductDTO insertDto) {
		//새글등록
		adminMapper.insert(insertDto);
		
		//첨부파일이 없다면 되돌려 보내기 (왜 되돌려 보내는거지?)
		log.info("여기 들어오긴 함?"+insertDto.getAttachList());
				if(
					
					insertDto.getAttachList() == null || insertDto.getAttachList().size() <= 0) {
					return;
				}
				
				
				//첨부 파일 개수만큼 루프 돌기
				insertDto.getAttachList().forEach(attach -> {
					attach.setP_code(insertDto.getP_code());
					//첨부파일 삽입
					attachMapper.insert(attach);			
				});			
				
	}
	
	@Override
	public List<ProductDTO> selectList() {
		return adminMapper.selectList();
	}
	
}
