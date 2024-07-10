package com.kh.winepicker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Info2 {
	private String infoName;
	private String subtitle;
	private String content;
	private String originName;
	private String changeName;
	
	private int countryNo;
	private int wineTypeNo;
	private int grapeNo;
	private int depth;
	
}
