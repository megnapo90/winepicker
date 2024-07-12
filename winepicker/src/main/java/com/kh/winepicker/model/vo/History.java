package com.kh.winepicker.model.vo;

import java.sql.Date;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class History {

	private int orderNo;
	private int userNo;
	private int wineNo;
	private Date orderDate;
	private int dStatus;
	private char cStatus;
	private int qty;
	private String deliveryAddress;
	private int price;
	
}
