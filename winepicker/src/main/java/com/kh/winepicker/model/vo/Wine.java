package com.kh.winepicker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wine {
	
	private int wineNo;
	private String wineName;
	private int grapeNo;
	private int countryNo;
	private int vintage;
	private int price;
	private int volume;
	private int quantity;
	private String content;
	private char status;
	
	

}
