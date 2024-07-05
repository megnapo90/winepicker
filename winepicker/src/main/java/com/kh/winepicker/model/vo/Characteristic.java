package com.kh.winepicker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Characteristic {
	
	private int wineNo;
	private int body;
	private int sweet;
	private int bitter;
	private int sour;
}
