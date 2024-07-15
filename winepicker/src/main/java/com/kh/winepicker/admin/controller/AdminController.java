package com.kh.winepicker.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.admin.model.service.AdminService;
import com.kh.winepicker.common.Pagination;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Ask;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.Popup;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.model.vo.WineType;
import com.kh.winepicker.product.model.service.ProductService;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final UserService userService;
	private final AdminService adminService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	private final ProductService productService;
	
	
//	============================== 관리자 페이지로 이동 =======================================
	@GetMapping("/adminPage")
	public String adminPage(
			Model model
			) {
		
		List<WineExt> wList = adminService.selectWineList();
		
		model.addAttribute("wList", wList);
		
		return "admin/adminPage";
	}
	
	
	// 와인 재고 현황
	@GetMapping("/wineList")
	public String wineList(
			Model model
			) {
		
		List<WineExt> wList = adminService.selectWineList();
		
		model.addAttribute("wList", wList);
		
		return "admin/wineListView";
	}
	
	
// ============================= 민욱 시작 ==========================================
    // 사용자 목록
    @GetMapping("/userList")
    public String getUserList(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);
        return "admin/userList";
    }

    // 사용자 검색
    @GetMapping("/searchUser")
    public String searchUser(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<User> userList = userService.searchUsers(keyword);
        model.addAttribute("userList", userList);
        model.addAttribute("keyword", keyword);
        return "admin/searchUser";
    }
    
    // 사용자 수정 폼
    @GetMapping("/modifyUserForm")
    public String modifyUserForm(@RequestParam("userNo") int userNo, Model model) {
        User user = userService.getUserByNo(userNo);
        model.addAttribute("user", user);
        return "admin/updateUser";  // admin 폴더 안에 있는 updateUser.jsp를 가리킵니다.
    }

    // 사용자 수정
    @PostMapping("/modifyUser")
    public String modifyUser(User user, Model model) {
        int result = userService.modifyUser(user);
        if (result > 0) {
            model.addAttribute("message", "회원 정보가 성공적으로 수정되었습니다.");
        } else {
            model.addAttribute("message", "회원 정보 수정에 실패하였습니다.");
        }
        return "redirect:/admin/userList";
    }
    
    // 사용자 상세 조회
    @GetMapping("/userDetail")
    public String userDetail(@RequestParam("userNo") int userNo, Model model) {
        User user = userService.getUserByNo(userNo);
        model.addAttribute("user", user);
        return "admin/userDetail";
    }
    
    // 사용자 상세 조회 (ID로)
    @GetMapping("/userDetail/{userId}")
    public String getUserDetail(@PathVariable String userId, Model model) {
        User user = userService.getUserById(userId);
        if (user != null) {
            model.addAttribute("user", user);
            return "admin/userDetail"; // admin 폴더 안에 있는 userDetail.jsp를 가리킵니다.
        } else {
            model.addAttribute("errorMsg", "해당 사용자를 찾을 수 없습니다.");
            return "admin/userList"; // 사용자를 찾을 수 없을 때, 회원 목록 페이지로 리다이렉트합니다.
        }
    }

    // 선택된 사용자 조회
    @GetMapping("/usersView")
    public String usersView(@RequestParam("userNo") List<Integer> userNo, Model model) {
        List<User> users = userService.getUsersByNo(userNo);
        model.addAttribute("users", users);
        return "admin/usersView";
    }
    
    // 사용자 삭제
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("userIds") List<String> userIds, Model model) {
        int result = userService.deleteUsers(userIds);
        if (result > 0) {
            model.addAttribute("alertMsg", "사용자 삭제 성공");
        } else {
            model.addAttribute("alertMsg", "사용자 삭제 실패...");
        }
        return "redirect:/user/userList";
    }

    // FAQ 목록
    @GetMapping("/faqList")
    public String faqList(Model model, @RequestParam(value = "keyword", required = false) String keyword) {
        List<Faq> faqList = (keyword == null || keyword.isEmpty()) ? adminService.getAllFaqs() : adminService.searchFaqs(keyword);
        model.addAttribute("faqList", faqList);
        model.addAttribute("keyword", keyword);
        return "admin/faqList";
    }

    // FAQ 상세 보기
    @GetMapping("/faq/{faqNo}")
    public String getFaq(@PathVariable int faqNo, Model model) {
        Faq faq = adminService.getFaq(faqNo);
        if (faq != null) {
            model.addAttribute("faq", faq);
        } else {
            model.addAttribute("errorMsg", "해당 FAQ를 찾을 수 없습니다.");
        }
        return "admin/faqDetail";
    }

    // FAQ 업데이트
    @GetMapping("/updateFaq")
    public String updateFaqForm(@RequestParam("faqNo") int faqNo, Model model) {
        Faq faq = adminService.getFaq(faqNo);
        model.addAttribute("faq", faq);
        return "admin/updateFaq";
    }

    // FAQ 수정
    @PostMapping("/updateFaq")
    public String updateFaq(@ModelAttribute Faq faq, Model model) {
        int result = adminService.updateFaq(faq);
        if (result > 0) {
            model.addAttribute("alertMsg", "FAQ 수정 성공");
        } else {
            model.addAttribute("alertMsg", "FAQ 수정 실패...");
        }
        return "redirect:/admin/faqList";
    }

    // 선택된 FAQ 삭제
    @PostMapping("/deleteFaq")
    public String deleteFaq(@RequestParam("selectedFaqs") List<Integer> selectedFaqs, Model model) {
        int result = adminService.deleteFaq(selectedFaqs);
        if (result > 0) {
            model.addAttribute("alertMsg", "선택된 FAQ 삭제 성공");
        } else {
            model.addAttribute("alertMsg", "선택된 FAQ 삭제 실패...");
        }
        return "redirect:/admin/faqList";
    }

    // FAQ 추가
    @PostMapping("/addFaq")
    public String addFaq(@ModelAttribute Faq faq, Model model) {
        int result = adminService.addFaq(faq);
        if (result > 0) {
            model.addAttribute("alertMsg", "FAQ 추가 성공");
        } else {
            model.addAttribute("alertMsg", "FAQ 추가 실패...");
        }
        return "redirect:/admin/faqList";
    }

    // 문의 목록
    @GetMapping("/askList")
    public String askList(Model model, @RequestParam(value = "keyword", required = false) String keyword) {
        List<Ask> askList = (keyword == null || keyword.isEmpty()) ? adminService.getAllAsk() : adminService.searchAsks(keyword);
        model.addAttribute("askList", askList);
        model.addAttribute("keyword", keyword);
        return "admin/askList";
    }

    // 문의 추가
    @PostMapping("/addAsk")
    public String addAsk(@ModelAttribute Ask ask, Model model) {
        int result = adminService.addAsk(ask);
        if (result > 0) {
            model.addAttribute("popupMsg", "문의 추가 성공");
        } else {
            model.addAttribute("popupMsg", "문의 추가 실패...");
        }
        return "redirect:/admin/askList";
    }

    // 문의 작성 페이지
    @GetMapping("/createAsk")
    public String createAsk() {
        return "admin/createAsk";
    }

    // 문의 삭제
    @PostMapping("/deleteAsk")
    public String deleteAsk(@RequestParam("selectedAsks") List<Integer> selectedAsks, Model model) {
        int result = adminService.deleteAsk(selectedAsks);
        if (result > 0) {
            model.addAttribute("alertMsg", "문의 삭제 성공");
        } else {
            model.addAttribute("alertMsg", "문의 삭제 실패...");
        }
        return "redirect:/admin/askList";
    }

    // 문의 수정 폼
    @GetMapping("/modifyAskForm")
    public String modifyAskForm(@RequestParam(value = "askNo", defaultValue = "0") int askNo, Model model) {
        if (askNo == 0) {
            return "redirect:/admin/askList?popupMsg=유효하지 않은 문의 번호입니다.";
        }
        
        Ask ask = adminService.getAskByNo(askNo);
        
        if (ask == null) {
            return "redirect:/admin/askList?popupMsg=해당 문의를 찾을 수 없습니다.";
        }
        
        model.addAttribute("ask", ask);
        return "admin/modifyAskForm"; // modifyAskForm.jsp 페이지로 이동
    }

    // 문의 수정 처리
    @PostMapping("/modifyAsk")
    public String modifyAsk(@ModelAttribute Ask ask, Model model) {
        int result = adminService.updateAsk(ask);
        if (result > 0) {
            model.addAttribute("popupMsg", "문의가 성공적으로 수정되었습니다.");
        } else {
            model.addAttribute("popupMsg", "문의 수정에 실패하였습니다.");
        }
        return "redirect:/admin/askList"; // 수정 완료 후 다시 askList 페이지로 이동
    }

    @GetMapping("/review")
    public String review(Model model, @RequestParam(value = "keyword", required = false) String keyword) {
        List<Review> reviewList = (keyword == null || keyword.isEmpty()) ? adminService.getAllReviews() : adminService.searchReviews(keyword);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("keyword", keyword);
        return "admin/review";
    }

    // 리뷰 추가
    @PostMapping("/addReview")
    public String addReview(@ModelAttribute Review review, Model model) {
        int result = adminService.addReview(review);
        if (result > 0) {
            model.addAttribute("alertMsg", "리뷰 추가 성공");
        } else {
            model.addAttribute("alertMsg", "리뷰 추가 실패...");
        }
        return "redirect:/admin/review";
    }

    // 선택된 리뷰 삭제
    @PostMapping("/deleteSelectedReviews")
    public String deleteSelectedReviews(@RequestParam("selectedReviews") List<Integer> selectedReviews, Model model) {
        int result = adminService.deleteReview(selectedReviews);
        if (result > 0) {
            model.addAttribute("alertMsg", "선택된 리뷰 삭제 성공");
        } else {
            model.addAttribute("alertMsg", "선택된 리뷰 삭제 실패...");
        }
        return "redirect:/admin/review";
    }

    @GetMapping("/updateReview")
    public String updateReview(@RequestParam(value = "reviewNo", defaultValue = "0") int reviewNo, Model model) {
        if (reviewNo == 0) {
            return "redirect:/admin/review";
        }

        Review review = adminService.getReviewByNo(reviewNo);
        if (review == null) {
            return "redirect:/admin/review";
        }

        model.addAttribute("review", review);
        return "admin/updateReview";
    }

    @PostMapping("/saveReviewReply")
    public String saveReviewReply(@RequestParam("reviewNo") int reviewNo, @RequestParam("replyContent") String replyContent, Model model) {
        int result = adminService.updateReviewReply(reviewNo, replyContent);
        if (result > 0) {
            model.addAttribute("alertMsg", "리뷰 답변 성공");
        } else {
            model.addAttribute("alertMsg", "리뷰 답변 실패...");
        }
        return "redirect:/admin/review";
    }
    
// ============================= 민욱 끝 ==========================================    
    
    
    
	
	@GetMapping("/grape")
	public String grapeList(
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("grape", gList);
		
		
		return "info/info-grape.jsp";
	}
	
//	========================== 공지글 게시판 ==========================================
	@GetMapping("/notice")
	public String noticeList(
			Notice n,
			Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam Map<String, Object> param
			) {
		
		int listCount = adminService.noticeListCount(param);
		int pageLimit = 5;
		int noticeLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, noticeLimit);
		
		List<Notice> nList = adminService.noticeList(pi, param);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("nList", nList);
		
		return "admin/notice/noticeListView";
	}
	
	@GetMapping("/notice/noticeDetail/{noticeNo}")
	public String noticeDetail(
			@PathVariable("noticeNo") int noticeNo,
			Model model
			) {
		Notice n = adminService.noticeDetail(noticeNo);
		
		model.addAttribute("notice", n);
		
		return "admin/notice/noticeDetailView";
	}
	
	
	@GetMapping("/noticeEnroll")
	public String noticeEnrollForm() {
		return "admin/notice/noticeEnrollForm";
	}
	
	@PostMapping("/noticeEnroll")
	public String noticeEnroll(
			Notice n,
			RedirectAttributes ra,
			@RequestParam(value = "upfile", required = false) MultipartFile upfile // 항상 객체 생성
			) {
		
		if(upfile != null && !upfile.isEmpty()) {
			String webPath = "/resources/admin/notice/";
			String serverFolderPath = application.getRealPath(webPath);
			
			// 디렉토리가 존재하지 않는다면 생성하는 코드 추가.
			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			n.setChangeName(changeName);
			n.setOriginName(upfile.getOriginalFilename());
		}
		
		int result = adminService.noticeEnroll(n);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "공지 등록 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "공지 등록 실패...");
		}
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/deleteNotice/{noticeNo}")
	public String deletNotice(
			Notice n,
			RedirectAttributes ra
			) {
		int result = adminService.deleteNotice(n);
		
		if(result>0) {
			ra.addFlashAttribute("alertMsg", "공지사항 삭제 성공!");
		}else {
			ra.addFlashAttribute("alertMsg", "삭제 실패...");
		}
		return "redirect:/admin/notice";
	}
	

	
//	=============================== 상품정보 수정 ========================================
	
	@GetMapping("/updateWine/{wineNo}")
	public String updateWineForm(
			WineExt wine,
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("gList", gList);
		
		List<Country> cList = adminService.countryList();
		model.addAttribute("cList", cList);
		
		List<WineType> wtList = adminService.selectTypeList();
		model.addAttribute("wtList", wtList);
		
		int wineNo = wine.getWineNo();
		
		wine = adminService.selectWine(wineNo);
		
		
		model.addAttribute("wine", wine);
		
		
		return "admin/updateWineForm2";
	}
	
	
	@PostMapping("/updateWine/{wineNo}")
	public String updateWine(
			Characteristic characteristic,
			Country country,
			Grape grape,
			WineImage wineImage,
			WineType wineType,
			WineExt wine,
			RedirectAttributes ra,
			@RequestParam(value="upfile", required = false) MultipartFile upfile
			) {
		
		System.err.println(upfile);
		
		if(upfile != null && !upfile.isEmpty()) {
			String webpath = "/resources/images/product/";
			String serverFolderPath = application.getRealPath(webpath);
			File dir = new File(serverFolderPath);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			//String changeName = serverFolderPath.replace("\\", "/") + Utils.saveFile(upfile, serverFolderPath);
			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			wineImage = new WineImage();
			wineImage.setChangeName(changeName);
			wineImage.setOriginName(upfile.getOriginalFilename());
			
			wine.setWineImage(wineImage);
		}
		
		//System.err.println(wineImage);
		
		wine.setCharacteristic(characteristic);
		
		int result = 0;
		
		try {
			result = adminService.updateWine(wine);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", wine.getWineName()+"수정 성공 !!");
		}else {
			ra.addFlashAttribute("alertMsg", "수정 실패...");
		}
		
		return "redirect:/admin/adminPage";
	}
	

//	============================== 정보글 ==============================
	
	@GetMapping("info/{infoName}")
	public String infoList(
			Model model,
			@PathVariable("infoName") String infoName,
			Info2 info
			) {
		
		List<Info2> iList = adminService.selectInfoList();
		
		model.addAttribute("iList", iList);
		
		if(infoName.equals("country")) {
			
			List<Country> cList = adminService.countryList();

			model.addAttribute("cList", cList);
			
			return "admin/info/countryPage";
			
		}else {
			info = adminService.selectInfo(infoName);
			
			model.addAttribute("info", info);
			
			return "admin/info/infoPage";
		}
		
	}	
	
	// 정보글 수정
	@PostMapping("/infoUpdate")
	public String infoUpdate(
			Info2 i,
			@RequestParam(value="upfile", required = false) MultipartFile upfile,
			RedirectAttributes ra
			) {
		
		
		if(upfile != null && !upfile.isEmpty()) {
			String webpath = "/resources/admin/info/";
			String serverFolderPath = application.getRealPath(webpath);
			File dir = new File(serverFolderPath);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			i.setChangeName(changeName);
			i.setOriginName(upfile.getOriginalFilename());
		}
		
		
		i.setContent( Utils.XSSHandling(i.getContent()) );
		
		
		int result = adminService.updateInfo(i);
		
		if(result>0) {
			ra.addFlashAttribute("alertMsg", "정보글 수정 성공!");
		}else {
			ra.addFlashAttribute("alertMsg", "정보글 수정 실패...");
		}
		
		return "redirect:/admin/info/"+i.getInfoName();
		
	}


	@GetMapping("wineTypeList")
	@ResponseBody
	public List<Grape> wineTypeList(
			WineType wineType
			){
		
		List<Grape> gList = adminService.grapeList2(wineType.getWineTypeNo());
		
		
		return gList;
	}	
	
	
	
	/* 상품 등록 */
	@GetMapping("/enrollWine")
	public String enrollWineForm(
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("gList", gList);
		
		List<Country> cList = adminService.countryList();
		model.addAttribute("cList", cList);
		
		List<WineType> wtList = adminService.selectTypeList();
		model.addAttribute("wtList", wtList);
		
		return "product/productEnrollForm";
	}
	
	
	
	@PostMapping("/enrollWine")
	public String insertWine(
			Characteristic characteristic,
			Country country,
			Grape grape,
			WineImage wineImage,
			WineType wineType,
			WineExt wineExt,
			RedirectAttributes ra,
			@RequestParam(value="upfile") MultipartFile upfile
			) {
		
		
		if(upfile != null && !upfile.isEmpty()) {
			String webpath = "/resources/images/product/";
			String serverFolderPath = application.getRealPath(webpath);
			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String changeName = serverFolderPath.replace("\\", "/") + Utils.saveFile(upfile, serverFolderPath);
			
			wineImage = new WineImage();
			wineImage.setChangeName(changeName);
			wineImage.setOriginName(upfile.getOriginalFilename());
		}
		
		
		wineExt.setWineImage(wineImage);
		wineExt.setCharacteristic(characteristic);
		
		int result = 0;
		
		try {
			result = adminService.insertWine2(wineExt);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", wineExt.getWineName()+"등록 성공 ");
			url = "redirect:/admin/wineList";
		}else {
			
			url = "/product/productEnrollForm";
		}
		
		
		
		return url;
	}
	
	
	
	
	@GetMapping("/updatewine/{wineNo}")
	public String updateWine(
			@PathVariable("wineNo") int wineNo,
			Model model
			) {
		
		WineExt wine = (WineExt)productService.selectWine(wineNo);
		wine.setContent(Utils.newLineclear(wine.getContent()));
		
		model.addAttribute("wine", wine);
		return "product/productUpdateForm";
		
	}

	
	@PostMapping("/deletewine/{wineNo}")
	public String deleteWine(
			@PathVariable("wineNo") int wineNo
			) {
		
				try {

					productService.deleteWine(wineNo);

				} catch (Exception e) {
					e.printStackTrace();
				}

		return "redirect:/admin/wineList";
		
	}	
	
	
	
	@GetMapping("/popupList")
	public String popupList(
			Model model
			) {
		List<Popup> pList = adminService.popupList();
		
		model.addAttribute("pList", pList);
		
		return "admin/popupListView";
	}
	
	@GetMapping("/popupEnroll")
	public String popupEnroll() {
		return "admin/popupEnrollForm";
	}
	
	@PostMapping("/popupEnroll")
	public String popupEnroll(
			Popup p,
			RedirectAttributes ra,
			@RequestParam(value = "upfile", required = false) MultipartFile upfile
			) {
		
		if(upfile != null && !upfile.isEmpty()) {
			String webPath = "/resources/admin/notice/";
			String serverFolderPath = application.getRealPath(webPath);
			
			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			p.setChangeName(changeName);
			p.setOriginName(upfile.getOriginalFilename());
		}
		
		int result = adminService.popupEnroll(p);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "팝업 등록 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "팝업 등록 실패...");
		}
		
		return "redirect:/admin/popupList";
		
		
	}
	
	
//	
//	@GetMapping("/deleteNotice/{noticeNo}")
//	public String deletNotice(
//			Notice n,
//			RedirectAttributes ra
//			) {
//		int result = adminService.deleteNotice(n);
//		
//		if(result>0) {
//			ra.addFlashAttribute("alertMsg", "공지사항 삭제 성공!");
//		}else {
//			ra.addFlashAttribute("alertMsg", "삭제 실패...");
//		}
//		return "redirect:/admin/notice";
//	}
	
	
	
	
	
	
	
	
	
}
