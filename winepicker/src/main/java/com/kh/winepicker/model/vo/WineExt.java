package com.kh.winepicker.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class WineExt extends Wine{

	private WineImage wineImage;
	private Country country;
	private Characteristic characteristic;
	private Grape grape;
	private WineType wineType;
	
	
}
