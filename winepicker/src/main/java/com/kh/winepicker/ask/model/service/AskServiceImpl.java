package com.kh.winepicker.ask.model.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.winepicker.ask.model.dao.AskDao;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Ask;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AskServiceImpl implements AskService {

	private final AskDao askDao;
	private final ServletContext application;
	
	@Override
	public int insertAsk(Ask ask, MultipartFile upfile) {
		
		//첨부파일 저장 경로 설정
		if(upfile != null && !upfile.getOriginalFilename().equals("")) {
			String webPath = "/resources/images/ask/";
			String serverFolderPath = application.getRealPath(webPath);

			//디렉토리 없을 경우 생성
			File dir = new File(serverFolderPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
			//사용자가 등록한 첨부파일 이름 수정
			String changeName="";
			changeName = Utils.saveFile(upfile, serverFolderPath);

			ask.setChangeName(changeName);
			ask.setOriginName(upfile.getOriginalFilename());
		}
		
		return askDao.insertAsk(ask);

	}

	@Override
	public List<Ask> showAskList(int loginUserNo) {
		return askDao.showAskList(loginUserNo);
	}

	@Override
	public Ask selectAskDetail(int askNo) {
		return askDao.selectAskDetail(askNo);		
	}

	@Override
	public int deleteAskDetail(int askNo) {
		return askDao.deleteAskDetail(askNo);
	}

	@Override
	public int updateAskDetail(Ask ask, MultipartFile upfile, String deleteImageName) {
		
		int result = 0;
		String webPath = "/resources/images/ask/";
		String serverFolderPath = application.getRealPath(webPath);

		//첨부파일 x -> o 
		if(upfile != null && !upfile.isEmpty()) {

			//디렉토리 없을 경우 생성
			File dir = new File(serverFolderPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
			//사용자가 등록한 첨부파일 이름 수정
			String changeName = Utils.saveFile(upfile, serverFolderPath);

			ask.setChangeName(changeName);
			ask.setOriginName(upfile.getOriginalFilename());
		
			result = askDao.updateAskDetail(ask);
			
		} else if(!deleteImageName.equals("") && upfile != null && !upfile.isEmpty()
				) {
			//첨부파일이 o -> o (변경)
			//사용자가 등록한 첨부파일 이름 수정
			String changeName = Utils.saveFile(upfile, serverFolderPath);

			ask.setChangeName(changeName);
			ask.setOriginName(upfile.getOriginalFilename());
		
			result = askDao.updateAskDetail(ask);
			
		} else if(!deleteImageName.equals("") && (upfile == null || upfile.isEmpty())) {
			//첨부파일 ㅇ -> x
			result = askDao.updateAskDetail(ask);
		} else {
			//첨부파일이 o -> o (변경X), x -> x
			result = askDao.updateAskDetailExceptImg(ask);
			
		}
		
		return result;
	}
}
