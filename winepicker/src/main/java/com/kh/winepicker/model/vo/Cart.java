package com.kh.winepicker.model.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int userNo;
	
	private Wine wine;
	private int cartQty;
	public Cart(Wine wine, int bQuantity) {} ;
	
	private Map<String, Cart> items;
	
	public void removeWine(String wineNo) {
        items.remove(wineNo);
    }

}
