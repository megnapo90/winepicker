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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@SessionAttributes({ "loginUser" })
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

	@PostMapping("/login")
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
	public String insertUser(User user, String address, RedirectAttributes ra, Model model) {
		// 비밀번호 암호화
		String encodedPwd = encoder.encode(user.getUserPwd());
		user.setUserPwd(encodedPwd);
		user.setAddress(address);

		// 사용자 정보 DB에 저장
		int result = userService.insertUser(user);

		if (result > 0) {
			// 이메일 인증 링크 전송
			model.addAttribute("msg", "이메일로 전송된 링크를 통해 인증을 완료해주세요.");
			return "user/register";
		} else {
			model.addAttribute("msg", "회원가입 실패. 다시 시도해주세요.");
			return "user/register";
		}
	}

	@PostMapping("/sendVerificationEmail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> sendVerificationEmail(String userEmail) {
		Map<String, Object> response = new HashMap<>();
		try {
			// 이메일 전송 로직 호출
			userService.sendSimpleMessage(userEmail, "Email Verification",
					"링크를 눌러 이메일 인증을 완료해주세요.: http://winepicker.com/verify?email=" + userEmail);

			response.put("success", true);
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "이메일 전송에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	}

	@GetMapping("/verify")
	public String verifyEmail(String userEmail, Model model) {
		boolean verified = userService.verifyUser(userEmail);

		if (verified) {
			model.addAttribute("msg", "이메일 인증이 완료되었습니다. 회원가입을 완료하세요.");
		} else {
			model.addAttribute("msg", "이메일 인증에 실패했습니다. 이미 인증된 이메일이거나 잘못된 이메일입니다.");
		}
		return "user/register";
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(String userId) {
		int result = userService.idCheck(userId);
		return result;
	}

	@PostMapping("/selectOne")
	public ResponseEntity<Map<String, Object>> selectOne(User user) {
		if (true) {
			throw new RuntimeException();
		}

		User loginUser = userService.login(user);

		HashMap<String, Object> userInfo = new HashMap<>();

		ResponseEntity<Map<String, Object>> res = null;

		if (loginUser == null) {
			res = ResponseEntity.notFound().build();
		} else {
			userInfo.put("userId", loginUser.getUserId());
			userInfo.put("userName", loginUser.getUserName());

			res = ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).body(userInfo);
		}

		return res;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	@PostMapping("/findId")
	public ResponseEntity<Map<String, String>> findId(String userName, String userEmail) {
		Map<String, String> response = new HashMap<>();
		try {
			String foundUserId = userService.findId(userName, userEmail);

			if (foundUserId != null) {
				response.put("user", foundUserId);
			} else {
				response.put("msg", "등록된 이메일이 없습니다. 이메일을 확인해주세요.");
			}
		} catch (Exception e) {
			response.put("errorMsg", "아이디 찾기 과정에서 오류가 발생했습니다.");
		}
		return ResponseEntity.ok(response);
	}

	@PostMapping("/findPwd")
	public ResponseEntity<Map<String, String>> findPwd(String userId, String userEmail) {
		Map<String, String> response = new HashMap<>();
		try {
			String foundUserPwd = userService.findPwd(userId, userEmail);

			if (foundUserPwd != null) {
				response.put("user", foundUserPwd);
			} else {
				response.put("msg", "등록된 이메일이 없습니다. 이메일을 확인해주세요.");
			}
		} catch (Exception e) {
			response.put("errorMsg", "아이디 찾기 과정에서 오류가 발생했습니다.");
		}
		return ResponseEntity.ok(response);
	}

}