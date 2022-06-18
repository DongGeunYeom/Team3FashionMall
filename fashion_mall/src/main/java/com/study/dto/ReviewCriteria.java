package com.study.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ReviewCriteria {
	private int rvpageNum;	// 문의 사용자가 선택한 페이지 번호
	
	private int rvamount;		// 한 페이지당 보여줄 게시물 수
	
	public ReviewCriteria() {
		this(1,10);
	}

	public ReviewCriteria(int rvpageNum, int rvamount) {
		super();
		this.rvpageNum = rvpageNum;
		this.rvamount = rvamount;
	}
	
}
