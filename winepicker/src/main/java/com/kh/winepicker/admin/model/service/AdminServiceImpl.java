package com.kh.winepicker.admin.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.winepicker.admin.model.dao.AdminDao;
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

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao adminDao;
	private final ServletContext application;
	
	
	@Override
	public List<Country> countryList() {
		return adminDao.countryList();
	}
	@Override
	public List<Grape> grapeList() {
		return adminDao.grapeList();
	}
	@Override
	public int noticeEnroll(Notice n) {
		return adminDao.noticeEnroll(n);
	}
	@Override
	public int insertInfo(Info i) {
		return adminDao.insertInfo(i);
	}
	@Override
	public List<WineType> selectTypeList() {
		return adminDao.selectTypeList();
	}
	@Override
	public List<Info2> selectInfoList() {
		return adminDao.selectInfoList();
	}
	@Override
	public Info2 selectInfo(String infoName) {
		return adminDao.selectInfo(infoName);
	}
	@Override
	public int updateInfo(Info2 i) {
		return adminDao.updateInfo(i);
	}
	
	@Override
	public Notice noticeDetail(int noticeNo) {
		return adminDao.noticeDetail(noticeNo);
	}
	@Override
	public int deleteNotice(Notice n) {
		return adminDao.deleteNotice(n);
	}
	@Override
	public List<WineExt> selectWineList() {
		return adminDao.selectWineList();
	}
	
	@Override
	public WineExt selectWine(int wineNo) {
		return adminDao.selectWine(wineNo);
	}
	@Override
	public List<Grape> grapeList2(int wineTypeNo) {
		return adminDao.grapeList2(wineTypeNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertWine2(WineExt wineExt) {
		int result = 1; 
		result *= adminDao.insertWine2(wineExt);
		result *= adminDao.insertCharacteristic(wineExt);
		result *= adminDao.insertWineImage(wineExt);
		
		if(result == 0) {
			throw new RuntimeException();
		}
		return result;
	}
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateWine(WineExt wine) {
		
		int result = 1;
		result *= adminDao.updateWine(wine);
		result *= adminDao.updateCharacteristic(wine);
		
		if(wine.getWineImage() != null) {
			result *= adminDao.updateWineImage(wine);
		}
		
		if(result != 1) {
			throw new RuntimeException();
		}
		
		return result; 
	}
	
	@Override
	public List<Notice> noticeList(PageInfo pi, Map<String, Object> param) {
		return adminDao.noticeList(pi, param);
	}
	
	@Override
	public int noticeListCount(Map<String, Object> param) {
		return adminDao.noticeListCount(param);
	}
	
	
	
	
// ============================= 민욱 시작 ==========================================
	// FAQ 관련 메서드 구현
    @Override
    public List<Faq> getAllFaqs() {
        return adminDao.selectAllFaqs();
    }

    @Override
    public List<Faq> searchFaqs(String keyword) {
        return adminDao.searchFaqs(keyword);
    }

    @Override
    public Faq getFaq(int faqNo) {
        return adminDao.selectFaq(faqNo);
    }

    @Override
    public int updateFaq(Faq faq) {
        return adminDao.updateFaq(faq);
    }

    @Override
    public int deleteFaq(List<Integer> selectedFaqs) {
        return adminDao.deleteFaq(selectedFaqs);
    }

    @Override
    public int addFaq(Faq faq) {
        return adminDao.insertFaq(faq);
    }

    // 문의 관련 메서드 구현
    @Override
    public List<Ask> getAllAsk() {
        return adminDao.selectAllAsk();
    }

    @Override
    public List<Ask> searchAsks(String keyword) {
        return adminDao.searchAsks(keyword);
    }

    @Override
    public int deleteAsk(List<Integer> selectedAsks) {
        return adminDao.deleteAsk(selectedAsks);
    }

    @Override
    public int modifyAsk(Ask ask) {
        return adminDao.updateAsk(ask);
    }

    @Override
    public int addAsk(Ask ask) {
        return adminDao.insertAsk(ask);
    }
    
    @Override
    public Ask getAskByNo(int askNo) {
        return adminDao.selectAskByNo(askNo);
    }

    @Override
    public int updateAsk(Ask ask) {
        return adminDao.updateAsk(ask);
    }

    // 리뷰 관련 메서드 구현
    @Override
    public List<Review> getAllReviews() {
        return adminDao.selectAllReviews();
    }

    @Override
    public List<Review> searchReviews(String keyword) {
        return adminDao.searchReviews(keyword);
    }

    @Override
    public int addReview(Review review) {
        return adminDao.insertReview(review);
    }

    @Override
    public int deleteReview(List<Integer> selectedReviews) {
        return adminDao.deleteReview(selectedReviews);
    }

    @Override
    public Review getReviewByNo(int reviewNo) {
        return adminDao.getReviewByNo(reviewNo);
    }

    @Override
    public int updateReviewReply(int reviewNo, String replyContent) {
        return adminDao.updateReviewReply(reviewNo, replyContent);
    
    }
// ============================= 민욱 끝 ==========================================
	
	
    @Override
    public List<Popup> popupList() {
    	return adminDao.popupList();
    }
	@Override
	public int popupEnroll(Popup p) {
		return adminDao.popupEnroll(p);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
