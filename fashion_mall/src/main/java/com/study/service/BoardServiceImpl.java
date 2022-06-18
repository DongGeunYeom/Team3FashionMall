package com.study.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.CartDTO;
import com.study.dto.ProductAttachDTO;
import com.study.dto.ProductBoardDTO;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;
import com.study.mapper.CartMapper;
import com.study.mapper.ProductAttachMapper;
import com.study.mapper.ProductBoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private ProductBoardMapper mapper;
	
	@Autowired
	private ProductAttachMapper attachMapper;
	
	@Autowired
	private CartMapper cartmapper;
	
	@Override
	public ProductBoardDTO getDetail(int bno) {
		log.info("bno 찾기 "+ bno);
		try {
			// 상품 페이지 불러오기(상품코드를 찾기 위함)
			ProductBoardDTO getBoardDto = mapper.getDetailPage(bno);
			
			// 상품코드로 상품 조회하기
			log.info("객체확인 "+getBoardDto.getP_code());
			log.info("상품보드객체의 상품객체 확인 "+getBoardDto);
			ProductDTO getProductDto = mapper.getDetailProduct(getBoardDto.getP_code());
				
			// 상품보드 객체에 상품, 옵션 담기
			getBoardDto.setProduct(getProductDto);
			
			// 상품보드 객체에 첨부파일 담기
			List<ProductAttachDTO> attachList = attachMapper.list(getBoardDto.getP_code());
			getBoardDto.setAttachList(attachList);
			
			log.info("상품 객체 밸류 최종 확인 "+getBoardDto);
			
			return getBoardDto;
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		// bno가 없는 숫자로 조회했을 때 널포인터 익셉션 방지
		return null;
	}

	@Override
	public List<String> checkSize(String po_color, int p_code) {
		log.info("사이즈 확인 서비스 생성"+po_color+" "+p_code);
		return mapper.checkSize(po_color, p_code);
	}

	@Override
	public int checkAmount(String po_color, int p_code, String po_size) {
		log.info("수량 확인 서비스 생성"+po_color+" "+p_code+" "+po_size);
		try {
			return mapper.checkAmount(po_color, p_code, po_size);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		return 0;	
	}

}
