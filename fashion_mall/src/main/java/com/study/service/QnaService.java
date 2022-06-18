package com.study.service;


import com.study.dto.Criteria;
import com.study.dto.QnaDTO;
import com.study.dto.QnaPageDTO;

public interface QnaService {
	// 문의 글 리스트 불러오기
	public QnaPageDTO getList(Criteria cri, int bno);
	
	// 문의 글 + 비밀 글 리스트 불러오기
	public QnaPageDTO getAllList(Criteria cri, int bno);
	
	// 비밀글 모달 보기
	public QnaDTO qnaGetSecret(int qno, String user_id);
	
	// 문의 글 등록
	public int qnaRegister(QnaDTO registerDto);
	
	// 문의 글 수정
	public int qnaChange(QnaDTO changeDto);
	
	// 비밀 글 등록
	public int qnaSecretRegister(QnaDTO secretDto);
	
	// 비밀 글 공개
	public int qnaSecretOpen(QnaDTO openDto);
	
	// 문의 답변 등록
	public int qnaAnswer(QnaDTO answerDto);
	
	// 문의 답변 수정 
	public int qnaModify(QnaDTO answerDto);
	
	// 문의 글 삭제
	public int qnaDelete(QnaDTO deleteDto);
}
