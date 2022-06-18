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

public class QnaPageDTO {
	private int qnaCnt;// 문의글 전체 개수
	private List<QnaDTO> list;// 문의글 목록
}
