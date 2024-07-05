package com.kh.winepicker.ask.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.winepicker.model.vo.Ask;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AskDaoImpl implements AskDao {
	
	private final SqlSession session;

	@Override
	public int insertAsk(Ask ask) {
		return session.insert("ask.insertAsk", ask);
	}

	@Override
	public List<Ask> showAskList(int loginUserNo) {
		return session.selectList("ask.showAskList", loginUserNo);
	}

	@Override
	public Ask selectAskDetail(int askNo) {
		return session.selectOne("ask.selectAskDetail", askNo);
	}

	@Override
	public int deleteAskDetail(int askNo) {
		return session.delete("ask.deleteAskDetail", askNo);
	}

	@Override
	public int updateAskDetail(Ask ask) {
		return session.update("ask.updateAskDetail", ask);
	}

	@Override
	public int updateAskDetailExceptImg(Ask ask) {
		return session.update("ask.updateAskDetailExceptImg", ask);
	}
}
