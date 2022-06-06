package com.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ReviewAttachDTO {
	private int rno;
	private String uuid;
	private String uploadPath;
	private String fileName;
}
