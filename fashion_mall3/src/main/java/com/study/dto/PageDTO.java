package com.study.dto;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageDTO {
	
	// 페이지 나누기 정보
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	// 전체 게시물 수 
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.total = total;
		this.cri = cri;
		
		this.endPage= (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage -9;
		
		int realEnd = (int)(Math.ceil((total/1.0) / cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
	}
	
	
}
