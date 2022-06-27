package com.study.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	private int pageNum;	// 문의 사용자가 선택한 페이지 번호
	
	private int amount;		// 한 페이지당 보여줄 게시물 수
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
