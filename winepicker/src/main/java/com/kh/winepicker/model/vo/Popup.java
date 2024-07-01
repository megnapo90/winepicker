package com.kh.winepicker.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Popup {

	private int popupNo;
	private String popupTitle;
	private String originName;
	private String changeName;
}
