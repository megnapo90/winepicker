package com.kh.winepicker.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.net.jdbc.TNSAddress.Address;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

	private int userNo;
	private int gradeNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userSsn;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private char status;
	private Address userAddress;

}
