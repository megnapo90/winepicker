package com.kh.winepicker.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Ask;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.Popup;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDaoImpl implements AdminDao{
	
	private final SqlSession sqlSession;

	@Override
	public List<Country> countryList() {
		return sqlSession.selectList("admin.selectCountry");
	}

	@Override
	public List<Grape> grapeList() {
		return sqlSession.selectList("admin.selectGrape");
	}

	@Override
	public int noticeEnroll(Notice n) {
		return sqlSession.insert("admin.noticeEnroll", n);
	}

	@Override
	public int insertInfo(Info i) {
		return sqlSession.insert("admin.insertInfo", i);
	}


	@Override
	public List<WineType> selectTypeList() {
		return sqlSession.selectList("admin.selectTypeList");
	}

	@Override
	public List<Info2> selectInfoList() {
		return sqlSession.selectList("admin.selectInfoList");
	}

	@Override
	public Info2 selectInfo(String infoName) {
		return sqlSession.selectOne("admin.selectInfo", infoName);
	}

	@Override
	public int updateInfo(Info2 i) {
		return sqlSession.update("admin.updateInfo", i);
	}

	

	@Override
	public Notice noticeDetail(int noticeNo) {
		return sqlSession.selectOne("admin.noticeDetail", noticeNo);
	}

	@Override
	public int deleteNotice(Notice n) {
		return sqlSession.update("admin.deleteNotice", n);
	}

	@Override
	public List<WineExt> selectWineList() {
		return sqlSession.selectList("admin.selectWineList");
	}

	

	@Override
	public WineExt selectWine(int wineNo) {
		return sqlSession.selectOne("admin.selectWine", wineNo);
	}

	@Override
	public List<Grape> grapeList2(int wineTypeNo) {
		return sqlSession.selectList("admin.grapeList2", wineTypeNo);
	}

	
	
	@Override
	public int insertWine2(WineExt wineExt) {
		return sqlSession.insert("admin.insertWine2", wineExt);
	}

	@Override
	public int insertCharacteristic(WineExt wineExt) {
		return sqlSession.insert("admin.insertCharacteristic", wineExt);
	}

	@Override
	public int insertWineImage(WineExt wineExt) {
		return sqlSession.insert("admin.insertWineIamge", wineExt);
	}

	
	
	
	@Override
	public int updateWine(WineExt wine) {
		return sqlSession.update("admin.updateWine", wine);
	}
	
	@Override
	public int updateCharacteristic(WineExt wine) {
		return sqlSession.update("admin.updateCharacteristic", wine);
	}

	@Override
	public int updateWineImage(WineExt wine) {
		return sqlSession.update("admin.updateWineImage", wine);
	}

	
	
	
	@Override
	public List<Notice> noticeList(PageInfo pi, Map<String, Object> param) {
		
		// MyBatis의 RowBounds객체를 이용한 페이징 처리
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("admin.noticeList", param, rowBounds);
	}
	
	@Override
	public int noticeListCount(Map<String, Object> param) {
		return sqlSession.selectOne("admin.noticeListCount", param);
	}

	
// ============================= 민욱 시작 ==========================================	
	// FAQ 관련 메서드 구현
    @Override
    public List<Faq> selectAllFaqs() {
        return sqlSession.selectList("admin.selectAllFaqs");
    }

    @Override
    public List<Faq> searchFaqs(String keyword) {
        return sqlSession.selectList("admin.searchFaqs", keyword);
    }

    @Override
    public Faq selectFaq(int faqNo) {
        return sqlSession.selectOne("admin.selectFaq", faqNo);
    }

    @Override
    public int updateFaq(Faq faq) {
        return sqlSession.update("admin.updateFaq", faq);
    }

    @Override
    public int deleteFaq(List<Integer> selectedFaqs) {
        return sqlSession.delete("admin.deleteFaq", selectedFaqs);
    }

    @Override
    public int insertFaq(Faq faq) {
        return sqlSession.insert("admin.insertFaq", faq);
    }

    // 문의 관련 메서드 구현
    @Override
    public List<Ask> selectAllAsk() {
        return sqlSession.selectList("admin.selectAllAsk");
    }

    @Override
    public List<Ask> searchAsks(String keyword) {
        return sqlSession.selectList("admin.searchAsks", keyword);
    }

    @Override
    public int deleteAsk(List<Integer> selectedAsks) {
        return sqlSession.delete("admin.deleteAsk", selectedAsks);
    }

    @Override
    public int insertAsk(Ask ask) {
        return sqlSession.insert("admin.insertAsk", ask);
    }
    
    @Override
    public Ask selectAskByNo(int askNo) {
        return sqlSession.selectOne("admin.selectAskByNo", askNo);
    }

    @Override
    public int updateAsk(Ask ask) {
        return sqlSession.update("admin.updateAsk", ask);
    }

    // 리뷰 관련 메서드 구현
    @Override
    public List<Review> selectAllReviews() {
        return sqlSession.selectList("admin.selectAllReviews");
    }

    @Override
    public List<Review> searchReviews(String keyword) {
        return sqlSession.selectList("admin.searchReviews", keyword);
    }

    @Override
    public int insertReview(Review review) {
        return sqlSession.insert("admin.insertReview", review);
    }

    @Override
    public int deleteReview(List<Integer> selectedReviews) {
        return sqlSession.delete("admin.deleteReview", selectedReviews);
    }

    @Override
    public Review getReviewByNo(int reviewNo) {
        return sqlSession.selectOne("admin.getReviewByNo", reviewNo);
    }

    @Override
    public int updateReviewReply(int reviewNo, String replyContent) {
        Map<String, Object> params = new HashMap<>();
        params.put("reviewNo", reviewNo);
        params.put("replyContent", replyContent);
        return sqlSession.update("admin.updateReviewReply", params);
    }

// ============================= 민욱 끝 ==========================================	
	
	
    @Override
    public List<Popup> popupList() {
    	return sqlSession.selectList("admin.popupList");
    }

	@Override
	public int popupEnroll(Popup p) {
		return sqlSession.insert("admin.popupEnroll", p);
	}
	
	
	
	
	
	
	
	
	


}
