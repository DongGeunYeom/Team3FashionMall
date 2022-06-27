package com.study.dto;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@ToString
@Data
public class AdminPageDTO {
	
	//페이지 나누기 정보
	private int startPage;
	private int endPage;
	//맨 마지막 페이지를 보여주기 위한 변수 선언
	private int realEnd;
	
	//이전과 다음으로 이동 가능한 링크의 표시 여부
	private boolean prev;
	private boolean next;
	
	//전체 게시물 수
	private int total;
	private AdminCriteria cri;
	
	//cri : pageNum, amount, type, keyword
	public AdminPageDTO(AdminCriteria cri, int total) {
		this.total = total;
		this.cri = cri;
		
		//ex ) PageNum : 60 => endPage : 60 => startPage : 51
		//ex ) PageNum : 1  => ceil(0.1) => 1 * 10 => endPage : 10
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		//ex) total : 513 , amount : 10 => realEnd : 52
		//ex) total : 513 => ceil(513/1.0/10) => ceil(51.3) => 52
		realEnd = (int)(Math.ceil((total/1.0) / cri.getAmount()));
		
		//ex) realEnd : 52 , endPage : 60 => endPage : 52
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}









