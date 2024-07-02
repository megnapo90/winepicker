package com.kh.winepicker.ask.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Ask;

public interface AskService {

	int insertAsk(Ask ask);

	List<Ask> showAskList(int loginUserNo);

}
