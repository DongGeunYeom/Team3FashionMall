package com.project.dto;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Data

public class ProductDTO {
	
	private int pcode;
	private String pname;
	private int price;
	private int disprice;
	private String ptype;
	private String pcontent;
	private int psale;
	private int tamount; // tAmount : 총재고

	private List<ProductOptDTO> optionList;
	private List<ProductAttachDTO> attachList;
}
