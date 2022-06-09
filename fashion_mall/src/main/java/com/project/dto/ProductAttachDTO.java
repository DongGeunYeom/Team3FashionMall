package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductAttachDTO {
	private int p_code;
	private String uuid;
	private String uploadpath;
	private String filename;
	private boolean filetype;
}
