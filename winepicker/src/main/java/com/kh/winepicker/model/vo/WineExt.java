package com.kh.winepicker.model.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class WineExt extends Wine{

	
	private WineImage wineImage;
	private Country country;
	private Characteristic characteristic;
	private Grape grape;
	private WineType wineType;
	private String formattedPrice;
	private int bQuantities;
	private int orderNo;
	private String sortOption;
	private int currentPage;
	 
	 
}
