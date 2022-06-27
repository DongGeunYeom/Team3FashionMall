package com.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.dto.Criteria;
import com.study.dto.QnaDTO;
import com.study.dto.QnaPageDTO;
import com.study.mapper.QnaMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;
		
	@Override
	public QnaPageDTO getList(Criteria cri, int bno) {
		log.info("문의 목록 변수 확인 "+bno+" "+cri+" "+cri.getPageNum());
		
		return new QnaPageDTO(mapper.getCountQno(bno),mapper.qnaGetList(cri, bno));
	}
	
	@Override
	public QnaPageDTO getAllList(Criteria cri, int bno) {
		log.info("문의 목록 + 비밀 목록 변수 확인 "+bno+" "+cri+" "+cri.getPageNum());
		return new QnaPageDTO(mapper.getCountQno(bno), mapper.qnaGetAllList(cri, bno));
	}

	@Override
	public int qnaRegister(QnaDTO registerDto) {
		log.info("문의 글 작성 확인 "+registerDto);
		return mapper.qnaRegister(registerDto);	
	}

	@Override
	public int qnaAnswer(QnaDTO answerDto) {
		log.info("문의 글 답변 작성 확인 "+answerDto);
		return mapper.qnaAnswer(answerDto);
	}

	@Override
	public int qnaDelete(QnaDTO deleteDto) {
		log.info("문의 글 삭제 확인 "+deleteDto);
		return mapper.qnaDelete(deleteDto);
	}

	@Override
	public int qnaModify(QnaDTO modifyDto) {
		log.info("문의 글 답변 수정 확인 "+modifyDto);
		return mapper.qnaModify(modifyDto);
	}

	@Override
	public int qnaSecretRegister(QnaDTO secretDto) {
		log.info("비밀 글 작성 확인"+ secretDto);
		return mapper.qnaSecretRegister(secretDto);
	}

	@Override
	public QnaDTO qnaGetSecret(int qno, String user_id) {
		QnaDTO secret =  mapper.qnaGetSecret(qno, user_id);
		return secret;
	}

	@Override
	public int qnaChange(QnaDTO changeDto) {
		log.info("문의 글 수정 확인 "+changeDto);
		return mapper.qnaChange(changeDto);
	}

	@Override
	public int qnaSecretOpen(QnaDTO openDto) {
		return mapper.qnaSecretOpen(openDto);
	}

	
}
