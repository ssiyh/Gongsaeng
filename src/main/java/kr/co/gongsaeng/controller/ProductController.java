package kr.co.gongsaeng.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gongsaeng.service.MypageService;
import kr.co.gongsaeng.service.ProductService;
import kr.co.gongsaeng.vo.BookmarkVO;
import kr.co.gongsaeng.vo.CartVO;
import kr.co.gongsaeng.vo.ClassVO;
import kr.co.gongsaeng.vo.CompanyVO;
import kr.co.gongsaeng.vo.PaymentVO;
import kr.co.gongsaeng.vo.ReviewVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@GetMapping("product/detail")
	public String productDetail(HttpSession session, Model model, @RequestParam("class_idx") int classIdx, ClassVO cla,
			CompanyVO com, PaymentVO pay, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		// 세션 값 저장해두기
		String sId = (String) session.getAttribute("sId");
		session.setAttribute("member_id", sId);

		// 클래스불러오기
		cla = service.getClassAll(classIdx);
		System.out.println("클라스" + cla);

		// 업체정보 들고오기
		com = service.getCompanyAll(cla);
		System.out.println(com);

		// 클래스에 맞는 리뷰 들고오기
		List<ReviewVO> reviews = service.getReviewInfo(cla);
		System.out.println("립휴" + reviews);

		// 클래스에 맞는 예약된 인원 들고오기
		List<PaymentVO> pays = service.getResMemberCount(classIdx);
		int totalResMember = 0;

		for (PaymentVO payss : pays) {
			int resMember = payss.getRes_member_count();
			totalResMember += resMember;
			System.out.println("pay>>>" + resMember);
		}

		int availableSeats = cla.getClass_member_count() - totalResMember;
		System.out.println("예약 가능 인원: " + availableSeats);

//		int availableSeats = cla.getClass_member_count() - resMember;

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		String startTime = formatter.format(cla.getClass_start_time());
		String endTime = formatter.format(cla.getClass_end_time());

//		 상품페이지에 넣을 쿠키 추가 코드
		JSONObject recentClass = new JSONObject();
		recentClass.put("class_idx", cla.getClass_idx());
		recentClass.put("imageUrl", cla.getClass_pic1());
		recentClass.put("class_title", cla.getClass_title().replace("\"", "\\\""));

		String encodedRecentClass = URLEncoder.encode(recentClass.toString(), "UTF-8");

		// recentClasses 쿠키 존재 여부 확인
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			logger.info("쿠키 전체 존재여부 : " + cookies.toString());
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("recentClasses")) {
					logger.info("초기 쿠키 이름: {}", cookie.getName());
					logger.info("초기 쿠키 값: {}", cookie.getValue());
					
					// 쿠키 값 파싱
					String decodedValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
					logger.info("decodedValue" + decodedValue.toString());

					// JSON 문자열 파싱
					JSONArray recentClasses;
					try {
					  recentClasses = new JSONArray(decodedValue);
					} catch (JSONException e) {
					  logger.error("클래스 1개만 존재 :", e.getMessage());
					  recentClasses = new JSONArray(); // 빈 배열 생성
					  recentClasses.put(new JSONObject(decodedValue));
					}
					logger.info("recentClasses" + recentClasses.toString());
					
					// 해당 상품 idx 존재 여부 확인
					boolean exists = false;
					for (int i = 0; i < recentClasses.length(); i++) {
						JSONObject classInfo = recentClasses.getJSONObject(i);
						if (classInfo.getInt("class_idx") == cla.getClass_idx()) {
							exists = true;
							break;
						}
					}

					System.out.println("exists : " + exists);
					if (!exists) {
						// 쿠키에 들어간 상품 정보 수
						int size = recentClasses.length();
						System.out.println(size);
						
						System.out.println("전 recentClasses" + recentClasses);
						System.out.println("recentClass" + recentClass);
						// 최근 상품 정보를 맨 앞에 추가
						recentClasses.put(recentClass);
						
						JSONArray reversedClasses = new JSONArray();

						// 루프를 사용하여 배열 순서 뒤집기
						for (int i = recentClasses.length() - 1; i >= 0; i--) {
						  reversedClasses.put(recentClasses.get(i));
						}
						
						System.out.println("후 reversedClasses" + reversedClasses);

						// 쿠키 값 업데이트
						String encodedrecentClasses = URLEncoder.encode(reversedClasses.toString(), "UTF-8");

						cookie.setValue(encodedrecentClasses);
						cookie.setPath("/");
						cookie.setMaxAge(60 * 60 * 24 * 7);
						
						response.addCookie(cookie);
						logger.info("추가 후 쿠키 이름: {}", cookie.getName());
						logger.info("추가 후 쿠키 값: {}", cookie.getValue());

						// 최근 상품 정보 개수 제한 (예: 최대 10개)
						if (size > 10) {
							recentClasses.remove(size - 1);
						}
					}
				}
			}
		} else {
			// recentClasses 쿠키가 없는 경우
			// 쿠키 생성
			Cookie cookie = new Cookie("recentClasses", encodedRecentClass);

			// 쿠키 유효기간 설정 (예: 7일)
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24 * 7);

			// 응답에 쿠키 추가
			response.addCookie(cookie);

			logger.info("쿠키 이름: {}", cookie.getName());
			logger.info("쿠키 값: {}", cookie.getValue());
		}

		// 북마크
		if (sId != null) {
			BookmarkVO bookmark = service.getBookmark(sId, cla.getClass_idx());
			if (bookmark != null) {
				model.addAttribute("isLiked", "true");
			} else {
				model.addAttribute("isLiked", "false");
			}
		}

		model.addAttribute("availableSeats", availableSeats);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("reviews", reviews);
		model.addAttribute("cla", cla);
		model.addAttribute("company", com);

		return "product_detail";
	}

	@ResponseBody
	@GetMapping("product/issueCoupon")
	public String issueCoupon(HttpSession session, Model model, @RequestParam("com_idx") String comIdx) {
		String sId = (String) session.getAttribute("sId");
		if (sId == null) {
			model.addAttribute("msg", "로그인이 필요합니다");
			model.addAttribute("targetURL", "/gongsaeng/member/login");

			return "forward";
		}

		Map<String, String> issuedCoupon = service.getIssuedCoupon(sId, comIdx);
		Map<String, String> followingStatus = service.getFollowingStatus(sId, comIdx);

		if (issuedCoupon != null) {
			if (followingStatus != null) {
				return "fail";
			} else {
				service.registFollowing(sId, comIdx);
				return "following";
			}
		}

		int insertCount = service.registCoupon(sId, comIdx);

		if (insertCount > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	@ResponseBody
	@PostMapping("product/cartPro")
	public String addToCart(@RequestParam("class_idx") int class_idx, @RequestParam("member_id") String member_id,
			@RequestParam String date, @RequestParam int res_person) {

		// 장바구니에서 물건찾기
		CartVO cart = service.findCart(class_idx, member_id, date);
//        if(cart == null) { // 장바구니에 일치하는게 없으면 추가
//
//            int insertCart = service.addToCart(class_idx, member_id, date, res_person);
//
//                if(insertCart > 0) { //성공
//                    return "true";
//                }else {
//                    return "false";
//                }
//
//        }else {
//
//            //일치하는게 있으면 수량 +1
//            int plusCart = cartService.cartPlus(cart.getCart_idx());
//
//            if(plusCart > 0) {
//                return "true";
//            }else {
//                return "false";
//            }
//
//        }
		return "";
	}// addToCart

}
