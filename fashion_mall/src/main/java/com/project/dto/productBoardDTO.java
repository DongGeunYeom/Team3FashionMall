package com.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@ToString
@AllArgsConstructor
@Data
public class productBoardDTO {
	private int bno;
	private int p_code;
	private int pb_content;
	private Date reg_date;
}
