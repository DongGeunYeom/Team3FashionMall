package com.study.mapper;

import java.util.List;

import com.study.dto.CartDTO;
import com.study.dto.ProductAttachDTO;

public interface ProductAttachMapper {
	
	// 인기순 불러오기
	public List<ProductAttachDTO> select();
	
	// 상의 인기순 불러오기
	public List<ProductAttachDTO> selectTop(String p_type);	
	
	// 최신순 불러오기
	public List<ProductAttachDTO> selectNew();
	
	// ------------------------------------------------
	
	
	//첨부파일 삽입
	public int insert(ProductAttachDTO attach);
	//첨부파일 목록
	public List<ProductAttachDTO> list(int bno);

	//어제 날짜의 첨부파일 목록 가져오기
	public List<ProductAttachDTO> getOldFiles();
	
	// --------------------------------------------------

}
