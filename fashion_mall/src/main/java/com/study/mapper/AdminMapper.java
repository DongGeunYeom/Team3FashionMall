package com.study.mapper;

import java.util.List;

import com.study.dto.AdminCriteria;
import com.study.dto.ProductDTO;
import com.study.dto.ProductOptDTO;

public interface AdminMapper {
	public int insert(ProductDTO insertDto);
	public int insertBoard(ProductDTO insertDto);
	public int getPcode();
	public int updateBno();
	public int OptInsert(ProductOptDTO opt);
	public List<ProductDTO> selectList(AdminCriteria cri);
	public List<ProductOptDTO> selectOpt(int p_code);
	// 게시물 리스트
	public List<ProductDTO> select(AdminCriteria cri);
	// 게시물 리스트 페이지 나누기할 떄 필요한 게시물 총 개수
	public int totalCnt(AdminCriteria cri);
	// 특정 게시물 읽기
	public ProductDTO read(int p_code);
	
	public int updateProduct(ProductDTO insertDto);
	public int updateOpt(ProductOptDTO insertDto);
	
	
	//t_amount 값 수정
	
	public int insertAmount(ProductOptDTO insertDto);
	public int updateAmount(ProductOptDTO insertDto);
}
