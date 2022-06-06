package com.study.mapper;

import java.util.List;

import com.study.dto.AttachDTO;

public interface AttachMapper {
	// 첨부파일 삽입
	public int insert(AttachDTO attach);
	// 첨부파일 목록 추출
	public List<AttachDTO> list(int bno);
	// 첨부파일 전체 삭제
	public int deleteAll(int bno);
	// 어제 날짜의 첨부파일 목록
	public List<AttachDTO> getOldFiles();
}
