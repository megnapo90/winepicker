package com.kh.winepicker.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ask {
	
	private int askNo;
	private String askTitle;
	private String askContent;
	private Date createDate;
	private Date modifyDate;
	private String responseContent;
	private String originName;
	private String changeName;
	private int userNo;
	private char responseStatus;

}
