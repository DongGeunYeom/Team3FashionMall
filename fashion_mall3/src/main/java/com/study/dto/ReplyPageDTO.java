package com.study.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReplyPageDTO {
	private int replyCnt;// 댓글 전체 개수
	private List<ReplyDTO> list;// 댓글 목록
}
