package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class OrderInfoDTO {
	// orderinfo table 참조
	private String userid;
	private int orderNum;
	private String name;
	private String address;
	private String phoneNum;
	private String email;
	private String msg;
	
	// basket table 참조
	private int basketNum;
	private String pCode;
	private String bSize;
	private String bColor;
	private int bAmount;
	private int totalPrice;
}
