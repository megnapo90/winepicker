package com.kh.winepicker.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Info {
	
	private int countryNo;
	private int grapeNo;
	private int wineTypeNo;
	private String content;
	private String originName;
	private String changeName;
	private String subtitle;

}
