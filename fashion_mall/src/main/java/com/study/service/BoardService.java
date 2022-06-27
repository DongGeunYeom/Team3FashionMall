package com.study.service;

import java.util.List;

import com.study.dto.CartDTO;
import com.study.dto.ProductBoardDTO;
import com.study.dto.ProductOptDTO;

public interface BoardService {
	
	// 상세페이지 불러오기(윗단) / 이미지 아직 안됨
	public ProductBoardDTO getDetail(int bno);
	
	// 상세페이지 재고확인
	public List<String> checkSize(String po_color, int po_code);
	public int checkAmount(String po_color, int p_code, String po_size);
	
}
