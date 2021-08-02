package com.bookforyou.bk4u.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.order.model.vo.Order;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * [관리자] 전체 도서 목록 조회 + 페이징, 상태별 도서 개수&목록 조회(한진)
	 * @param mv
	 * @param currentPage
	 * @param bkStatus
	 * @return
	 */
	@RequestMapping("adminBookList.bk")
	public ModelAndView adminBookList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, 
									  @RequestParam(value="bkStatus", defaultValue="0") String bkStatus,
									  @RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> filter = new HashMap<>();
		filter.put("bkStatus", bkStatus);
		filter.put("array", array);
		
		int listCount = bookService.selectAllListCount();
	
		PageInfo pi = null;
		ArrayList<Book> bList = null;
		
		int selectStatusY = bookService.selectStatusYCount();
		int selectSelStatusY = bookService.selectSelStatusYCount();
		int selectStatusN = listCount - selectStatusY;
		int selectSelStatusN = listCount - selectSelStatusY;
		
		if(bkStatus.equals("0")) {
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		}else {
			if(bkStatus.equals("1")) {
				pi = Pagination.getPageInfo(selectStatusY, currentPage, 10, 5);				
			}else if(bkStatus.equals("2")) {
				pi = Pagination.getPageInfo(selectStatusN, currentPage, 10, 5);
			}else if(bkStatus.equals("3")) {
				pi = Pagination.getPageInfo(selectSelStatusY, currentPage, 10, 5);
			}else if(bkStatus.equals("4")){
				pi = Pagination.getPageInfo(selectSelStatusN, currentPage, 10, 5);
			}
		}
		
		bList = (ArrayList)bookService.selectAdminBookList(pi, filter);
		
		mv.addObject("pi", pi)
		  .addObject("bList", bList)
		  .addObject("listCount", listCount)
		  .addObject("bkStatus", bkStatus)
		  .addObject("ar", array)
		  .addObject("selectStatusY", selectStatusY)
		  .addObject("selectStatusN", selectStatusN)
		  .addObject("selectSelStatusY", selectSelStatusY)
		  .addObject("selectSelStatusN", selectSelStatusN)
		  .setViewName("book/adminBookList");
		
		return mv;
	}
	
	/*
	 * [공통] 도서 검색 (연지)
	 */
	@RequestMapping("search.bk")
	public ModelAndView searchBook(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, @RequestParam(value = "condition") String condition, @RequestParam(value = "keyword") String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = bookService.selectSearchBookCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Book> bList = bookService.selectSearchBook(pi, map);
		
		mv.addObject("pi", pi)
		  .addObject("keyword", keyword)
		  .addObject("bList", bList)
		  .setViewName("book/bookSearchList");
		
		return mv;
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 목록 조회 (한진) 
	 * @param mv
	 * @param currentPage
	 * @param condition
	 * @param bkStatus
	 * @param bkSelStatus
	 * @param keyword
	 * @return
	 */
	@RequestMapping("adminSearch.bk")
	public ModelAndView adminBookSearch(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage, 
										String condition, String keyword,
										@RequestParam(value="array", defaultValue="0") String array) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("array", array);
		
		int conListCount = bookService.selectAdminSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(conListCount, currentPage, 10, 5);
		ArrayList<Book> bList = bookService.selectAdminSearchList(pi, map);
		
		int listCount = bookService.selectAllListCount();
		int selectStatusY = bookService.selectStatusYCount();
		int selectSelStatusY = bookService.selectSelStatusYCount();
		int selectStatusN = listCount - selectStatusY;
		int selectSelStatusN = listCount - selectSelStatusY;
		
		mv.addObject("pi", pi)
		  .addObject("bList", bList)
		  .addObject("conListCount", conListCount)
		  .addObject("listCount", listCount)
		  .addObject("selectStatusY", selectStatusY)
		  .addObject("selectStatusN", selectStatusN)
		  .addObject("selectSelStatusY", selectSelStatusY)
		  .addObject("selectSelStatusN", selectSelStatusN)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .addObject("ar", array)
		  .setViewName("book/adminBookList");
		
		return mv;
		
	}
	
	/*
	 * [공통] 도서 상세 조회 (연지)
	 */
	@RequestMapping("detail.bk")
	public ModelAndView selectBook(ModelAndView mv, int bkNo) {
		
		Book bk = bookService.selectBook(bkNo);
		mv.addObject("bk", bk).setViewName("book/bookDetailView");
		
		return mv;
	}
	
	/*
	 * [공통] 도서 장바구니 조회 (연지)
	 */
	@RequestMapping("cart.bk")
	public ModelAndView selectCartList(ModelAndView mv, int memNo) {

		ArrayList<Book> bList = bookService.selectCartList(memNo);
		
		int cpCount = memberService.selectCouponCount(memNo);
		ArrayList<Coupon> cList = memberService.selectCouponList(memNo);
		
		mv.addObject("bList", bList)
		  .addObject("cpCount", cpCount)
		  .setViewName("book/bookCartList");
		
		return mv;
	}
	
	/**
	 * [관리자] 도서 상태 변경 + 다중체크박스 (한진)
	 */
	@RequestMapping("adminBookStatusHandling.bk")
	public String updateBookStatus(HttpSession session, 
									@RequestParam(value="selectedBook") List<String> bkNoArr,
									String statusValue) {
		
		HashMap<String, String> map = new HashMap<>();
		
		for(int i=0; i<bkNoArr.size(); i++) {
			String bkNo = bkNoArr.get(i);
			map.put("bkNo", bkNo);
			map.put("statusValue", statusValue);
		}
		
		int result = bookService.updateBookStatus(map);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
		}else {
			session.setAttribute("errorMsg", "수정 실패하였습니다.");
		}
		
		return "redirect:/adminBookList.bk";
		
		
	}

	/*
	 * [공통] 도서 장바구니 추가 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="cartUpdate.bk", produces="text/html; charset=utf-8")
	public String updateCart(int memNo, int bkNo, @RequestParam(value="cartQty", defaultValue="1") int cartQty) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("bkNo", bkNo);
		map.put("cartQty", cartQty);
		
		int check = bookService.checkCart(map);
		int result = 0;
		
		if(check > 0) {
			result = bookService.updateCart(map);
		}else {
			result = bookService.insertCart(map);
		}
		
		return result> 0 ? "success" : "fail";
	}

	/*
	 * [공통] 도서 장바구니 삭제 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="cartDelete.bk", produces="text/html; charset=utf-8")
	public String deleteCart(int memNo, int bkNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("bkNo", bkNo);

		int result = bookService.deleteCart(map);
		
		return result> 0 ? "success" : "fail";
	}

	/*
	 * [공통] 도서 장바구니 수량 갱신 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="updateCartQty.bk", produces="text/html; charset=utf-8")
	public String updateCartQty(int memNo, int bkNo, int cartQty) {
		
		System.out.println(memNo);
		System.out.println(bkNo);
		System.out.println(cartQty);
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("bkNo", bkNo);
		map.put("cartQty", cartQty);

		int result = bookService.updateCartQty(map);
		
		return result> 0 ? "success" : "fail";
	}
	
	
	/**
	 * [관리자] 도서 상세 보기 (한진)
	 */
	@ResponseBody
	@RequestMapping("adminBookDetail.bk")
	public ModelAndView selectAdminBookDetail(ModelAndView mv, int bkNo) {
		
		ArrayList<Book> b = bookService.selectAdminBookDetail(bkNo);
		
		JsonArray jsonList = new JsonArray();
		
		for(Book bk :b) {
			
			JsonObject jObj = new JsonObject();
			jObj.addProperty("subCate", bk.getSubCateName());
			jObj.addProperty("interest", bk.getInterestContent());
			
			jsonList.add(jObj);
			
		}
		
		mv.addObject("book", b.get(0));
		mv.addObject("bkObj", jsonList);
		mv.setViewName("book/adminBookDetail");
		return mv;
	}
	
	/**
	 * [관리자] 도서 수정 (한진)
	 */
	@RequestMapping("adminBookUpdate.bk")
	public String updateAdminBook(Book b, int bkNo, String year, String month, String day, 
									@RequestParam(value="itrs") List<String> itrs, 
									@RequestParam(value="ganre")List<String> ganre) {
		
		
		String date = year + "-" + month + "-" + day;
		
		b.setBkDate(date);
		b.setBkNo(bkNo);
		
		int result = bookService.updateAdminBook(b);
		
		List<String> selectedIntr = bookService.selectAdminBookInterest(b);

		String interest = "";
		for(int i=0; i<selectedIntr.size(); i++) {
			if(!itrs.contains(selectedIntr.get(i))) {
				b.setInterestContent(selectedIntr.get(i));
				int delete = bookService.deleteAdminBookItrs(b);
			}
		}
		
		for(int i=0; i<itrs.size(); i++) {
			interest = itrs.get(i);
			
			if(!selectedIntr.contains(interest)) {
				b.setInterestContent(interest);
				int	result1 = bookService.insertAdminBookItrs(b);					
			}
		}
		
		return "redirect:/adminBookDetail.bk?bkNo=" + b.bkNo;
	}
	
	/**
	 * [관리자] 도서 등록 폼으로 이동 (한진)
	 */
	@RequestMapping("adminBookEnrollForm.bk")
	public String adminBookEnrollForm(){
		return "book/adminBookEnroll";
	}
	
	/**
	 * [관리자] 도서 등록 (한진)
	 */
	@RequestMapping("adminBookInsert.bk")
	public String insertAdminBook(Book b, String year, String month, String day,
							      @RequestParam(value="ganre") String subCateName,
							      @RequestParam(value="itrs") List<String> itrs) {
		String date = year + "-" + month + "-" + day;
		b.setBkDate(date);
		b.setSubCateName(subCateName);
		
		int result = bookService.insertAdminBook(b);
		
		int lastBkNo = bookService.selectAdminLastBkNo();
		int bkNo = lastBkNo - 1;
		b.setBkNo(bkNo);
		
		for(int i=0; i<itrs.size(); i++) {
			String interest = itrs.get(i);
			b.setInterestContent(interest);
			bookService.insertAdminBookItrs(b);					
		}
		
		
		return "redirect:/adminBookDetail.bk?bkNo=" + bkNo;
	}

	/*
	 * [공통] 도서 리스트 추가 (연지)
	 */
	@ResponseBody
	@RequestMapping(value="listInsert.bk", produces="text/html; charset=utf-8")
	public String insertList(int memNo, int bkNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("memNo", memNo);
		map.put("bkNo", bkNo);
		
		int check = bookService.checkList(map);
		String result = "";
		
		if(check != 0) {
			result = "done";
		}else {
			int i = bookService.insertList(map);
			result = i>0 ? "success" : "fail";
			
		}
		
		return result;
	}
}
