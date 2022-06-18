package com.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.study.dto.ReviewAttachDTO;
import com.study.dto.ReviewCriteria;
import com.study.dto.ReviewDTO;
import com.study.dto.ReviewPageDTO;
import com.study.mapper.AttachMapper;
import com.study.mapper.ReviewMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private AttachMapper attachMapper;
	

	@Override
	public ReviewPageDTO getReviewList(ReviewCriteria cri, int bno) {
		log.info("리뷰 목록 변수 확인 "+bno+" "+cri+" "+cri.getRvpageNum());
		
		return new ReviewPageDTO(mapper.getCountRno(bno),mapper.reviewGetList(cri, bno));
	}
	
	@Transactional
	@Override
	public void reviewRegister(ReviewDTO registerDto) {
		log.info("리뷰 글 작성 확인 "+registerDto);
		log.info("리뷰 사진 배열 확인 " +registerDto.getAttachList());
		
		try {
			mapper.reviewRegister(registerDto);	
			
			if(registerDto.getAttachList() == null|| registerDto.getAttachList().size()<= 0) {
				return;
			}
			
			registerDto.getAttachList().forEach(attach ->{
				attach.setRno(registerDto.getRno());
				
				// 첨부파일 삽입
				attachMapper.reviewAttachRegister(attach);
			});

		} catch (NullPointerException e) {
			e.printStackTrace();	
		}
	}

	@Override
	public List<ReviewAttachDTO> reviewAttachList(int rno) {
		return attachMapper.reviewAttachList(rno);
	}

	@Override
	public ReviewDTO reviewGetDetail(int rno) {
		return mapper.reviewGetDetail(rno);
	}

	@Override
	public int reviewModify(ReviewDTO modifyDto) {
		attachMapper.deleteAll(modifyDto.getRno());
		
		// 첨부파일 새로 삽입
		if(modifyDto.getAttachList()!= null && modifyDto.getAttachList().size()>0) {
			for(ReviewAttachDTO attach:modifyDto.getAttachList()) {
				attach.setRno(modifyDto.getRno());
				attachMapper.reviewAttachRegister(attach);
			}
		}
		return mapper.reviewModify(modifyDto);
	}

	@Override
	public int reviewDelete(ReviewDTO deleteDto) {
		return mapper.reviewDelete(deleteDto);
	}

	
	
}
