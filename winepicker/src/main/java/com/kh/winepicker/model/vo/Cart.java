package com.kh.winepicker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int userNo;
	private int wineNo;
	private int cartQty;

}
