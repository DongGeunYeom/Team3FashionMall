package com.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.study.dto.Criteria;
import com.study.dto.QnaDTO;

public interface QnaMapper {
	// 문의 글 목록 추출 + 총 개수세기
	public List<QnaDTO> qnaGetList(@Param("cri")Criteria cri, @Param("bno") int bno);
	public int getCountQno(int bno);
	
	public List<QnaDTO> qnaGetAllList(@Param("cri")Criteria cri, @Param("bno") int bno);
	
	// 비밀글 모달 보기
	public QnaDTO qnaGetSecret(@Param("qno")int qno, @Param("user_id") String user_id);
	
	// 문의글 등록
	public int qnaRegister(QnaDTO registerDto);
	
	// 문의글 수정
	public int qnaChange(QnaDTO changeDto);	
	
	// 비밀글 등록
	public int qnaSecretRegister(QnaDTO secretDto);
	
	// 비밀글 공개
	public int qnaSecretOpen(QnaDTO openDto);
	
	// 답변글 등록
	public int qnaAnswer(QnaDTO answerDto);
	
	// 답변글 수정
	public int qnaModify(QnaDTO modifyDto);
	
	// 답변글 삭제
	public int qnaDelete(QnaDTO deleteDto);
}
