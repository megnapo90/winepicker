package com.kh.winepicker.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int reviewNo;
	private int orderNo;
	private String content;
	private Date createDate;
	private double point;
	private char status;
	private Date modifyDate;
}
