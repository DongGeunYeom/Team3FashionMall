package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.BoardDTO;
import com.study.dto.Criteria;

public interface BoardMapper {
	public List<BoardDTO> listall(Criteria cri);
	public int register(BoardDTO insertDto);
	public BoardDTO read(int bno);
	public int update(BoardDTO updateDto);
	public int delete(int bno);
	public int totalCnt(Criteria cri);
	public int updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
}
