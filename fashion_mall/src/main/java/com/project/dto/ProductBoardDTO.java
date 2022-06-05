package com.project.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductBoardDTO {
	private int bno;
	private int pcode;
	private String pbcontent;
	private Date regDate;
	
	private List<ProductAttachDTO> attachList;
}
