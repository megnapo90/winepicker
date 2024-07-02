package com.kh.winepicker.ask.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.winepicker.ask.model.dao.AskDao;
import com.kh.winepicker.model.vo.Ask;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AskServiceImpl implements AskService {

	private final AskDao askDao;

	@Override
	public int insertAsk(Ask ask) {
		
		return askDao.insertAsk(ask);

	}

	@Override
	public List<Ask> showAskList(int loginUserNo) {
		return askDao.showAskList(loginUserNo);
	}
}
