package com.kh.winepicker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Country {

	private int countryNo;
	private String countryName;
	private String countryEngName;
}
