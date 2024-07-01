package com.kh.winepicker.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	private String originName;
	private String changeName;

}
