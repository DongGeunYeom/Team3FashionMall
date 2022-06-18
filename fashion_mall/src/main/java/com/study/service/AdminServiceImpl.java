package com.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;
import com.study.mapper.AdminMapper;
import com.study.mapper.ProductAttachMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private ProductAttachMapper attachMapper;
	
	@Override
	public void insert(ProductDTO insertDto) {
		
		//새글등록
		adminMapper.insert(insertDto);
		insertDto.setP_code(adminMapper.getPcode());
		//보드 글도 등록
		
		adminMapper.insertBoard(insertDto);
		/* adminMapper.updateBno(); */
		
		if(	
				insertDto.getOptList() == null || insertDto.getOptList().size() <= 0) {
				return;
			}
			
		//옵션 개수만큼 루프 돌기
		insertDto.getOptList().forEach(opt -> {
			opt.setP_code(insertDto.getP_code());
			//옵션 삽입
			adminMapper.OptInsert(opt);	
		});			
		
		//t_amount update
		insertDto.getOptList().forEach(opt -> {
					//옵션 삽입
			adminMapper.insertAmount(opt);	
		});			
		
		//첨부파일이 없다면 되돌려 보내기 (왜 되돌려 보내는거지?)
		log.info("첨부파일 리스트 봐봐"+insertDto.getAttachList());
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
	public List<ProductDTO> selectList(AdminCriteria cri) {
		return adminMapper.selectList(cri);
	}

	// ----------------------------------------------
	
		@Override
		public List<ProductDTO> getList(AdminCriteria cri) {
			return adminMapper.select(cri);
		}

		@Override
		public int getTotalCnt(AdminCriteria cri) {
			return adminMapper.totalCnt(cri);
		}

		@Override
		public ProductDTO getRow(int p_code) {
			return adminMapper.read(p_code);
		}

		@Override
		public List<ProductAttachDTO> attachList(int p_code) {
			return attachMapper.list(p_code);
		}

		@Override
		public void updateAdmin(ProductDTO insertDto) {
			//product update
			adminMapper.updateProduct(insertDto);
			
			log.info("로그찍어"+insertDto.getOptList());
			
			if(	
					insertDto.getOptList() == null || insertDto.getOptList().size() <= 0) {
					return;
				}
			
			//option update
			//옵션 개수만큼 루프 돌기
			insertDto.getOptList().forEach(opt -> {
						//옵션 삽입
				adminMapper.updateOpt(opt);	
			});	
			
			//amount update
			//옵션 개수만큼 루프 돌기
//			insertDto.getOptList().forEach(opt -> {
//						//옵션 삽입
//				adminMapper.updateAmount(opt);	
//			});	
			
		}

		@Override
		public List<ProductOptDTO> selectOpt(int p_code) {
			return adminMapper.selectOpt(p_code);
		}



	
}
