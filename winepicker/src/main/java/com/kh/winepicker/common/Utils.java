package com.kh.winepicker.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Utils {

	public static String saveFile(MultipartFile upfile, String path) {
		//랜덤 파일명 생성(랜덤3자리숫자+저장시점시간)
		String originName = upfile.getOriginalFilename();
		String currentTime = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
		int random = (int)(Math.random()*900+100); //3자리 랜덤숫자
		
		String ext = originName.substring(originName.indexOf("."));
		String changeName = random+currentTime+ext;
		
		try {
			upfile.transferTo(new File(path+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	
		return changeName;
	}
	
	
}
