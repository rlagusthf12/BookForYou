package com.bookforyou.bk4u.subscription.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.payment.model.vo.Payment;
import com.bookforyou.bk4u.point.model.vo.Point;
import com.bookforyou.bk4u.subscription.model.service.SubscriptionService;
import com.bookforyou.bk4u.subscription.model.vo.Subscription;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class SubscriptionController {

	@Autowired
	private SubscriptionService sService;
	
	@Autowired
	private BookService bService;
	
	/**
	 * [관리자] 정기구독 목록 조회 (한진)
	 */
	@RequestMapping("adminSubscList.su")
	public ModelAndView selectAdminSubscList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
											@RequestParam(value="array", defaultValue="0") String array,
											@RequestParam(value="subscStatus", defaultValue="0") String subscStatus) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("array", array);
		filter.put("subscStatus", subscStatus);
		
		int listCount = sService.selectAllListCount();
		int basicCount = sService.selectBasicListCount();
		int premiumCount = sService.selectPremiumListCount();
		int statusYCount = sService.selectStatusYListCount();
		int statusNCount = sService.selectStatusNListCount();
		
		PageInfo pi = null;
		
		if(subscStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		}else {
			if(subscStatus.equals("1")) {
				pi = Pagination.getPageInfo(basicCount, currentPage, 10, 5);
			}else if(subscStatus.equals("2")) {
				pi = Pagination.getPageInfo(premiumCount, currentPage, 10, 5);
			}else if (subscStatus.equals("3")) {
				pi = Pagination.getPageInfo(statusYCount, currentPage, 10, 5);
			}else if (subscStatus.equals("4")) {
				pi = Pagination.getPageInfo(statusNCount, currentPage, 10, 5);
			}
		}
		
		ArrayList<Subscription> subsc = sService.selectAdminSubscList(pi, filter);
		
		mv.addObject("subsc", subsc)
		  .addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("listCount", listCount)
		  .addObject("basicCount", basicCount)
		  .addObject("premiumCount", premiumCount)
		  .addObject("statusYCount", statusYCount)
		  .addObject("statusNCount", statusNCount)
		  .addObject("subscStatus", subscStatus)
		  .setViewName("subscription/adminSubscriptionList");
		
		return mv;
		
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 정기구독 목록 조회 (한진)
	 */
	@RequestMapping("adminSubscListSearch.su")
	public ModelAndView selectAdminSubscListSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
													@RequestParam(value="array", defaultValue="0") String array,
													@RequestParam(value="subscStatus", defaultValue="0") String subscStatus,
													String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("subscStatus", subscStatus);
		map.put("array", array);
		
		int conListCount = sService.selectAdminSubscListSearchCount(map);
		
		int listCount = sService.selectAllListCount();
		int basicCount = sService.selectBasicListCount();
		int premiumCount = sService.selectPremiumListCount();
		int statusYCount = sService.selectStatusYListCount();
		int statusNCount = sService.selectStatusNListCount();
		
		PageInfo pi = null;
		
		if(subscStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		}else {
			if(subscStatus.equals("1")) {
				pi = Pagination.getPageInfo(basicCount, currentPage, 10, 5);
			}else if(subscStatus.equals("2")) {
				pi = Pagination.getPageInfo(premiumCount, currentPage, 10, 5);
			}else if (subscStatus.equals("3")) {
				pi = Pagination.getPageInfo(statusYCount, currentPage, 10, 5);
			}else if (subscStatus.equals("4")) {
				pi = Pagination.getPageInfo(statusNCount, currentPage, 10, 5);
			}
		}
		
		ArrayList<Subscription> subsc = sService.selectAdminSubscSearchList(pi, map);
		
		mv.addObject("subsc", subsc)
		  .addObject("pi", pi)
		  .addObject("ar", array)
		  .addObject("listCount", listCount)
		  .addObject("basicCount", basicCount)
		  .addObject("premiumCount", premiumCount)
		  .addObject("statusYCount", statusYCount)
		  .addObject("statusNCount", statusNCount)
		  .addObject("subscStatus", subscStatus)
		  .setViewName("subscription/adminSubscriptionList");
		
		return mv;
	
	}
	
	/*
	 * [관리자] 정기구독 상세 조회 (한진)
	 */
	@RequestMapping("adminSubscDetail.su")
	public ModelAndView selectAdminSubscDetail(ModelAndView mv, int subscNo, int distinctionNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("subscNo", subscNo);
		map.put("distinctionNo", distinctionNo);
		
		Subscription s = sService.selectAdminSubscDetail(map);
		Subscription d = sService.selectAdminSubscDetailDel(map);
		ArrayList<Book> b = sService.selectAdminSubscDetailBook(map);
		Payment p = sService.selectAdminSubscDetailPay(map);
		Coupon cp = sService.selectAdminSubscDetailCoupon(map);
		
		mv.addObject("s", s)
		  .addObject("d", d)
		  .addObject("b", b)
		  .addObject("p", p)
		  .addObject("cp", cp);
		
		if(distinctionNo == 1) {
			mv.setViewName("subscription/adminSubScriptionDetail");
		}else {
			mv.setViewName("subscription/adminDeliveryDetail");
		}
		
		return mv;
	}
	
	/**
	 * [관리자] 정기구독 배송지 변경 (한진)
	 */
	@RequestMapping("alterAddress.su")
	public String updateAdminAdderss(ModelAndView mv, Subscription s) {
		
		int result = sService.updateAdminAddress(s);
		
		if(result > 0) {
			mv.addObject("alertMsg", "배송지가 변경되었습니다.");
		}else {
			mv.addObject("errorMsg", "배송지 변경 실패");
		}

		int subscNo = s.getSubscNo();
		int distinctionNo = 1;
		
		return "redirect:/adminSubscDetail.su?subscNo=" + subscNo + "&distinctionNo=" + distinctionNo;
	}
	
	/**
	 * [관리자] 정기구독 배송 목록 조회 (한진)
	 */
	@RequestMapping("adminSubscDeliveryList.su")
	public ModelAndView selectAdminSubscDeliveryList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
													@RequestParam(value="date", defaultValue="0") int date) {
		
		PageInfo pi = null;
		ArrayList<Subscription> s = null;

		if(date == 0) {
			int listCount = sService.selectTodaySubscCount();
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			s = sService.selectTodaySubscList(pi);
		}else {
			int listCount = sService.selectDaySubscCount(date);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			s = sService.selectDaySubscDeliveryList(pi, date);
		}
		mv.addObject("s", s)
		  .addObject("pi", pi)
		  .setViewName("subscription/adminDelivery");
		
		return mv;
	}

	/**
	 * [관리자] 캘린터 클릭 시 해당 날짜의 정기구독 배송 목록 조회 (한진)
	 */
	@ResponseBody
	@RequestMapping("getSubscDeliveryList.su")
	public ArrayList selectDaySubscDeliveryList() {
		
		ArrayList<Subscription> s = sService.selectListForCalendarEvents();
		
		/*
		JsonArray jsonList = new JsonArray();
		
		for(Subscription sr : s) {
			
			JsonObject jObj = new JsonObject();
			jObj.addProperty("subscNo", sr.getSubscNo());
			jObj.addProperty("subscsSdate", sr.getSubscSdate());
			jObj.addProperty("subscEndDate", sr.getSubscEndDate());
			jObj.addProperty("subscDelDate", sr.getSubscDelDate());
			jObj.addProperty("subscName", sr.getSubscName());
			jObj.addProperty("subscPeriod", sr.getSubscPeriod());
			jObj.addProperty("memName", sr.getMemName());
			jObj.addProperty("deliveryRequest", sr.getDeliveryRequest());
			jObj.addProperty("adminMemo", sr.getAdminMemo());
			
			jsonList.add(jObj);
					
		}
		*/

		return s;

	}
	
	/**
	 * [관리자] 정기배송 도서 선택 (한진)
	 */
	@RequestMapping("selectSubscBook.su")
	public ModelAndView selectAdminSubscBook(int sNo, ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = sService.selectAdminSubscBookCount(sNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Book> bList = sService.selectAdminSubscBookList(pi, sNo);
		Member m = sService.selectAdminSubscMember(sNo);
		ArrayList<MemberInterest> iList = sService.selectAdminSubscInterest(sNo);
		ArrayList<MemberCategory> cList = sService.selectAdminSubscCategory(sNo);
		
		HashMap<String, Integer> map = new HashMap<>();
		int subscNo = sNo;
		map.put("subscNo", subscNo);
		Subscription s = sService.selectAdminSubscDetail(map);
		
		mv.addObject("bList", bList)
		  .addObject("m", m)
		  .addObject("iList", iList)
		  .addObject("cList", cList)
		  .addObject("s", s)
		  .addObject("pi", pi)
		  .addObject("sNo", sNo)
		  .setViewName("subscription/adminBookSelect");
		
		return mv;
		
	}
	
	/**
	 * [관리자] 도서 발송 (한진)
	*/
	@RequestMapping("subscDeliveryComplete.su")
	public String inputSubscDelBook(ModelAndView mv, String suNo, String selectedBkNo, String delCompany, String shippingNumber) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("sNo", suNo);
		map.put("bNo", selectedBkNo);
		map.put("delCompany", delCompany);
		map.put("shippingNumber", shippingNumber);
		
		System.out.println(selectedBkNo);
		
		int result = sService.insertSubscOrder(map);
		
		if(result > 0) {
			mv.addObject("alertMsg", "정기구독 도서를 발송했습니다.");
		}else {
			mv.addObject("errorMsg", "정기구독 도서를 발송하지 못했습니다.");
		}
		
		return "redirect:/adminSubscDeliveryList.su?date=0";
	}
	
	/** 정기구독 메인페이지 호출용
	 * @author daeunlee
	 */
	@RequestMapping("join.sub")
	public String joinSub() {
		return "subscription/subscriptionJoin";
	}
	
	/** 정기구독 가입페이지 호출용
	 * @author daeunlee
	 */
	@RequestMapping("joinAgree.sub")
	public String joinAgreeSub() {
		return "subscription/subscriptionJoinAgree";
	}
	
	/** 정기구독 결제용 : 쿠폰+포인트 조회
	 * @author daeunlee
	 */
	@RequestMapping("pay.sub")
	public ModelAndView selectPaySub(int memNo, ModelAndView mv) {
		// 쿠폰,포인트 조회
		ArrayList<Coupon> cp = sService.selectSubscCoupon(memNo);
		int p = sService.selectSubPoint(memNo);
		
		mv.addObject("cp", cp)
		  .addObject("p", p)
		  .setViewName("subscription/subscriptionPay");
		
		return mv;
	}
	
	/** 정기구독 등록
	 * @author daeunlee
	 */
	@RequestMapping("insertSubPay.sub")
	public String insertSubsc(Subscription sub, Model model) {
		int result = sService.insertSubsc(sub);
		
		if(result > 0) {
			model.addAttribute("sub", sub);
			return "subscription/subscriptionPayComplete";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
            return "common/errorPage";
		}
	}
	
	/**
	 * [관리자] 정기구독 발송 내역 조회 (한진)
	 */
	@RequestMapping("adminSubscOrderList.su")
	public ModelAndView selectAdminSubscOrderList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
												  @RequestParam(value="array", defaultValue="0") int array) {

		HashMap<String, Integer> map = new HashMap<>();
		map.put("array", array);
		
		int listCount = sService.selectAdminSubscOrderCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Subscription> sList = sService.selectAdminSubscOrderList(pi, map);
		
		mv.addObject("sList", sList)
		  .addObject("listCount", listCount)
		  .addObject("pi", pi)
		  .addObject("ar", array)
		  .setViewName("subscription/adminSubscOrderList");
		
		return mv;
		
	}
	
}
