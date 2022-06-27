package com.study.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class AdminCriteria {
	
	private int pageNum;    //사용자가 선택한 페이지 번호
	private int amount;     //한 페이지에 보여줄 게시물 갯수
	private int p_code;
	// 수정 가능성 있음
	private String type;    // 검색 조건 : T or C or TC
	// type을 p_type으로   (p_type 	VARCHAR2(50)	NOT NULL)
	private String keyword; // 검색어
	private String cate;
	private String sort;
	private String content;
	
	public AdminCriteria() {
		this(1, 10);        // 아래있는 생성자 호출 
	}

	public AdminCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	// 검색 조건을 String[]로 변경
	public String[] getTypeArr() {
		// T => {"T"}, C => {"C"}
		// TC => {"T", "C"}
		return type == null ? new String[] {} : type.split("");
	}
}
