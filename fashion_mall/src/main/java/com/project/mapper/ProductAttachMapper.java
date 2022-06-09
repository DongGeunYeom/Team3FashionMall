package com.project.mapper;

import java.util.List;

import com.project.dto.ProductAttachDTO;



public interface ProductAttachMapper {
	//첨부파일 삽입
	public int insert(ProductAttachDTO attach);
	//첨부파일 목록
	public List<ProductAttachDTO> list(int bno);

	//어제 날짜의 첨부파일 목록 가져오기
	public List<ProductAttachDTO> getOldFiles();
}
