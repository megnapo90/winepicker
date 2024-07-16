package com.kh.winepicker.product.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.winepicker.common.Pagination;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Cart;
import com.kh.winepicker.model.vo.HistoryExt;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.product.model.service.ProductService;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProductUserController {

	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	private final UserService userService;
	
	@GetMapping("/")
	public String getNewProductList(@RequestParam Map<String, Object>paramMap,
			Model model) {
		
		List<WineExt> list = (List<WineExt>) productService.getNewProductList(paramMap);
		
		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);

		for (WineExt wine : list) {
			String formattedPrice = currencyFormat.format(wine.getPrice());
			wine.setFormattedPrice(formattedPrice); // 포맷된 가격을 WineExt 객체에 추가
		}
		
		model.addAttribute("list",list);
		
		return "main";
		
	}
	
	
	

	@GetMapping("/product/list")
	public String getWineList(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		// sortOption이 없으면 기본값 'recent'로 설정
		String sortOption = (String) paramMap.getOrDefault("sortOption", "recent");
		paramMap.put("sortOption", sortOption);

		// 페이징 처리
		int listCount = productService.selectListCount(paramMap);
		int pageLimit = 16;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 최소값 최대값 처리
		int maxPrice = productService.getMaxPrice();
		int minPrice = productService.getMinPrice();

		List<WineExt> list = (List<WineExt>) productService.getWineList(pi, paramMap);

		// 넘버 포멧팅 (1000->1,000)
		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);

		for (WineExt wine : list) {
			String formattedPrice = currencyFormat.format(wine.getPrice());
			wine.setFormattedPrice(formattedPrice); // 포맷된 가격을 WineExt 객체에 추가
		}

		model.addAttribute("list", list);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("pi", pi);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("minPrice", minPrice);
		return "product/productUserListView";
	}


	@GetMapping("/product/search")
	public String getMainPage(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, Model model) {
		// sortOption이 없으면 기본값 'recent'로 설정
		String sortOption = (String) paramMap.getOrDefault("sortOption", "recent");
		paramMap.put("sortOption", sortOption);

		// 페이징 처리
		int listCount = productService.selectListCount(paramMap);
		int pageLimit = 16;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<WineExt> list = (List<WineExt>) productService.getWineList(pi, paramMap);

		// 넘버 포멧팅 (1000->1,000)
		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);

		for (WineExt wine : list) {
			String formattedPrice = currencyFormat.format(wine.getPrice());
			wine.setFormattedPrice(formattedPrice); // 포맷된 가격을 WineExt 객체에 추가
		}

		//
		model.addAttribute("list", list);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		return "product/productUserSearchView";
	}

	@GetMapping("/product/detail/{wineNo}")
	public String selectProduct(@PathVariable("wineNo") int wineNo, Model model) {
		WineExt wine = (WineExt) productService.selectWine(wineNo);
		wine.setContent(Utils.newLineclear(wine.getContent()));

		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);
		String formattedPrice = currencyFormat.format(wine.getPrice());

		model.addAttribute("wine", wine);
		model.addAttribute("price", formattedPrice);
		return "product/productDetailView";

	}
	
	
	/*
	 * // 관심상품 등록
	 * 
	 * @GetMapping("/product/insert/myWishItem") public String insertWishItem(
	 * 
	 * @ModelAttribute("loginUser") User loginUser, Model model,
	 * 
	 * @RequestParam("wineNo") int wineNo, HttpSession session ) {
	 * if(loginUser.getUserId() == null) { model.addAttribute("alertMsg",
	 * "로그인 후 이용해주세요."); return ""; }
	 * 
	 * int userNo = loginUser.getUserNo();
	 * 
	 * Map<String, Object> wishItem = new HashMap<String, Object>();
	 * wishItem.put("userNo", userNo); wishItem.put("wineNo", wineNo);
	 * 
	 * int result = userService.insertWishItem(wishItem);
	 * 
	 * if(result > 0) { model.addAttribute("alertMsg", "관심상품이 등록되었습니다."); }else {
	 * model.addAttribute("alertMsg", "관심상품이 등록이 실패하였습니다."); }
	 * 
	 * return "";
	 * 
	 * }
	 */
			
	
	
	
	
	//오더페이지 화면처리 
	//로그인기능 연결 후 userNo처리 
//	@GetMapping("/product/order/userNo")
//	public String orderProduct(
//			@RequestParam(value ="orders[0].wineNo") int wineNo,
//			@RequestParam(value ="orders[0].wineCount") int wineCount,
//			
//			Model model
//			) {
//	
//
//		List<WineExt> list = (List<WineExt>)productService.orderWineList(wineNo);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("wineCount", wineCount);
//		
//		return "product/productOrder";
//		
//		
//	}
//	
	
	
//	@PostMapping("/product/order")
//	
//	public String orderProduct(@RequestBody WineExt wineExt, Model model) {
//	    List<WineExt> list = new ArrayList<>();
//	    List<Integer> wineNos = wineExt.getWineNo();
//	    List<Integer> buyQty = wineExt.getBuyQty();
//
//	    for (int i = 0; i < wineNos.size(); i++) {
//	        int wineNo = wineNos.get(i);
//	        int quantity = buyQty.get(i);
//	        Wine wine = productService.orderProduct(wineNo);
//
//	        list.add(new WineExt(wine, quantity));
//	    }
//
//	    model.addAttribute("list", list);
//	    return "product/productOrder";
//	}
	
	@GetMapping("/product/order")
	public String orderPage(@RequestParam("cart") String cartJSON,

			Model model,
			HttpSession session
			) {
		
		if(session.getAttribute("loginUser")==null) {
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "common/errorPage";
		}
		
	  ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			List<Map<String, Integer>> cart = objectMapper.readValue(cartJSON, new TypeReference<List<Map<String, Integer>>>() {});
				
				
	            List<Integer> wineNos = cart.stream().map(item ->(Integer)item.get("wineNo")).collect(Collectors.toList());   
	            List<Integer> bQuantities = cart.stream().map(item -> (Integer)item.get("bQuantity")).collect(Collectors.toList());
	            
	            Map<String, Object> params = new HashMap<>();
	            params.put("wineNos",wineNos);
	            
	            List<WineExt> wines =(List<WineExt>) productService.orderPage(params);
	           	     
	            for (int i = 0; i < wines.size(); i++) {
	                WineExt wine = wines.get(i);
	                if (i < bQuantities.size()) {
	                   int quantity = (int)bQuantities.get(i);
	                   	
	                    wine.setBQuantities(quantity);
	                } else {
	                    wine.setBQuantities(1); // 기본값 설정
	                }
	            }
	           
	           
	            
	            model.addAttribute("wines",wines);
	            
	            
	            
	            
	            
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	
		return  "product/productOrder";
		
		
	}
	
	@PostMapping("/product/order")
	public String orderPage2(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam List<Integer> quantities,
	    @RequestParam List<Integer> wineNos,
			Model model,
			HttpSession session
			) {

		if(session.getAttribute("loginUser")==null) {
			model.addAttribute("errorMsg", "로그인이 필요합니다.");
			return "common/errorPage";
		}
		
		User loginUser = (User) session.getAttribute("loginUser");

	    int userNo = loginUser.getUserNo();
//		int userNo = 2;


		String address = (String) paramMap.get("address");
        String postcode = (String) paramMap.get("postcode");
        String detailAddress = (String) paramMap.get("detailAddress");
        String deliveryAddress=postcode+" "+address+" "+detailAddress; 
       
        
        List<HistoryExt> list = new ArrayList<>();
        
        // HistoryExt 객체를 생성하고 리스트에 추가합니다.
        for (int i = 0; i < wineNos.size(); i++) {
            HistoryExt historyExt = new HistoryExt();
            int wineNo = wineNos.get(i);
            int bQuantity = quantities.get(i);

            historyExt.setWineNo(wineNo);
            historyExt.setUserNo(userNo);
            historyExt.setDeliveryAddress(deliveryAddress);
            historyExt.setQty(bQuantity);
  
            list.add(historyExt);  // 리스트에 HistoryExt 추가 
        }

        boolean isSuccess = true;  // 주문 처리 성공 여부를 추적하는 변수

        for (HistoryExt historyExt : list) {
            int result = productService.orderPage2(historyExt);

            if (result <= 0) {
                isSuccess = false;  // 주문 처리 실패로 상태 변경
                break;  // 루프 중단
            }
        }

        // 루프 종료 후 최종 결과 처리
        if (isSuccess) {
            return "product/orderConfirm";
        } else {
            model.addAttribute("errorMsg", "구매실패");
            return "common/errorPage";
        }
    }

	
	 @GetMapping("/product/orderConfirm")
	    public String showOrderConfirmPage(Model model) {
	       
	        return "product/orderConfirm";
	    }
	
	
	
	
	
	
	
	@PostMapping(value = "/product/addToCart", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> addToCart(
	        @RequestBody Map<String, Object> cartData,
	        HttpSession session, Model model) {		
		
	    if (session.getAttribute("loginUser")==null) {
	    	
	    	String errorMsg = "로그인이 필요합니다.";
	    	
	    	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	    			.body(errorMsg);
	    }
	
	    int wineNo = (Integer) cartData.get("wineNo");
	    int quantity = (Integer) cartData.get("quantity");
	    System.out.println(wineNo);
	    // 기존 세션 장바구니 정보 가져오기
	    List<Cart> sessionCarts = (List<Cart>) session.getAttribute("cart");
	   
	    if (sessionCarts == null) {
	        sessionCarts = new ArrayList<>();
	    }

	    // 장바구니에 동일한 상품이 있는지 확인하고 수량 업데이트
	    boolean itemExists = false;
	    for (Cart cart : sessionCarts) {
	        if (cart.getWine().getWineNo() == wineNo) {
	            cart.setCartQty(cart.getCartQty() + quantity);
	            itemExists = true;
	            break;
	        }
	    }

	    // 동일한 상품이 없는 경우 새 항목 추가
	    if (!itemExists) {
	        Wine wine = productService.getWineById(wineNo);
	        Cart newCart = new Cart();
	        newCart.setWine(wine);
	        newCart.setCartQty(quantity);
	        sessionCarts.add(newCart);
	    }

	    // 세션에 업데이트된 장바구니 정보 저장
	    session.setAttribute("cart", sessionCarts);
	    
	    System.out.println("Post Updated Cart: " + sessionCarts);
	    
	    return ResponseEntity.ok("정상적으로 장바구니에 담겼습니다.");
	}
	
	@GetMapping("/common/errorPage")
	public String errorPage(Model model){
		model.addAttribute("errorMsg", "로그인이 필요합니다.");
		return "common/errorPage";
	}
	

	@GetMapping("/product/cart")
	public String productCart(HttpSession session, Model model, @ModelAttribute("loginUser") User loginUser) {
	
		// 세션에서 장바구니 정보 가져오기

	    List<Cart> sessionCarts = (List<Cart>) session.getAttribute("cart");
	    if (sessionCarts == null) {
	        sessionCarts = new ArrayList<>();
	    }

	    
	    model.addAttribute("wines", sessionCarts);
	    
	    return "product/cart";
	}
	
	  @PostMapping("/product/cart/remove")
	  public String removeFromCart(@RequestParam("wineNo") String wineNo, HttpSession session) {
		   List<Cart> sessionCarts = (List<Cart>) session.getAttribute("cart");

		    // List<Cart> 객체가 null이 아닌지 확인
		    if (sessionCarts != null && wineNo != null) {
		        // List<Cart>에서 제품 제거
		        sessionCarts.removeIf(cart -> cart.getWine().getWineNo() == Integer.parseInt(wineNo));
		        // 업데이트된 List<Cart> 객체를 세션에 다시 저장
		        session.setAttribute("cart", sessionCarts);
		    }

	        return "redirect:/product/cart";
	    }

	
}	
	
	
	
	
	
	
	
	
	
	

