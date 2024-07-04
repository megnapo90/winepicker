package com.kh.winepicker.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"})
@RequiredArgsConstructor
public class UserController {

	private final BCryptPasswordEncoder encoder;
	private final UserService userService;

//	public UserController(UserService userService, BCryptPasswordEncoder encoder) {
//		this.userService = userService;
//		this.encoder = encoder;
//	}

	@GetMapping("/userList")
	public String selectUserList(Model model) {
		List<User> uList = userService.selectUserList();
		model.addAttribute("uList", uList);

		return "";
	}

	@GetMapping("/loginPage")
	public String loginPage() {
		return "user/login";
	}

	@GetMapping("/register")
	public String register() {
		return "user/register";
	}

	@GetMapping("/findId")
	public String findId() {
		return "user/findId";
	}

	@GetMapping("/findPwd")
	public String findPwd() {
		return "user/findPwd";
	}

	@GetMapping("/newPwd")
	public String newPwd() {
		return "user/newPwd";
	}

	// 마이페이지로 이동
	@GetMapping("/myPage")
	public String showMyPage() {
		return "user/myPage";
	}

	// 리뷰관리로 이동
	@GetMapping("/myReview")
	public String showMyReview() {
		return "user/myReview";
	}

	// 최근 본 상품으로 이동
	@GetMapping("/myRecentProduct")
	public String showMyRecentProduct() {
		return "user/myRecentProduct";
	}

	// 관심상품으로 이동
	@GetMapping("/myWishList")
	public String showMyWishList() {
		return "user/myWishList";
	}

	// mypage 메뉴 중 고객센터로 이동
	@GetMapping("/callCenter")
	public String userCallCenter() {
		return "user/callCenter";
	}

	// mypage 메뉴 중 공지사항으로 이동
	@GetMapping("/userNotice")
	public String userNotice() {
		return "user/userNotice";
	}

	@PostMapping("/login") // @RequestMapping과 method를 합쳐놓은 어노테이션
	public String login(User user, Model model, RedirectAttributes ra, HttpSession session) {

		User loginUser = userService.login(user);

		String viewName = "";

		if (loginUser != null && encoder.matches(user.getUserPwd(), loginUser.getUserPwd())) {
			ra.addFlashAttribute("alertMsg", "로그인 완료, 어서오세요.");
			model.addAttribute("loginUser", loginUser);
			viewName = "redirect:/";
		} else {
			model.addAttribute("errorMsg", "로그인 실패, 다시 시도해주세요.");
			viewName = "common/errorPage";
		}

		return viewName;
	}


	@GetMapping("/insertUser")
	public String enrollForm() {
		return "user/register";
	}

	@PostMapping("/insertUser")
	public String insertUser(User user, RedirectAttributes ra, Model model) {
		System.out.println(user);

		// 비밀번호 암호화
		String encodedPwd = encoder.encode(user.getUserPwd());
		user.setUserPwd(encodedPwd);

		// 사용자 정보 DB에 저장
		int result = userService.insertUser(user);

		// 처리 결과에 따라 메시지 설정
		if (result > 0) {
			model.addAttribute("msg", "회원가입 성공. 로그인해주세요.");
			return "user/login";
		} else {
			model.addAttribute("msg", "회원가입 실패. 다시 시도해주세요.");
			return "user/register";
		}
	}

	@GetMapping("/idCheck")
	public String IdCheck() {
		return "user/register";
	}

	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(String userId) {
		// 아이디 중복 체크 로직
		int result = userService.idCheck(userId);
		return result;
	}

	@PostMapping("/selectOne")
	public ResponseEntity<Map<String,Object>> selectOne(User user) {
		if(true) {
			throw new RuntimeException();
		}

		User loginUser = userService.login(user);

		HashMap<String, Object> userInfo = new HashMap<>();

		ResponseEntity<Map<String, Object>> res = null;

		if (loginUser == null) {
			res = ResponseEntity.notFound().build(); // 에러발생
		} else {
			userInfo.put("userId", loginUser.getUserId());
			userInfo.put("userName", loginUser.getUserName());

			res = ResponseEntity.ok() // 응답상태 200 (정상)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).body(userInfo);
		}

		return res;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session , SessionStatus status ) {
		
		status.setComplete();
		return "redirect:/";
	}

}