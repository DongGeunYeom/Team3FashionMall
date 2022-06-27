package com.study.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ReviewPageDTO {
	private int rvCnt;// 리뷰글 전체 개수
	private List<ReviewDTO> reviewlist;// 댓글 목록
}
