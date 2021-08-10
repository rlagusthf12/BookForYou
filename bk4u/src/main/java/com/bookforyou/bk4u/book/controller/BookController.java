package com.bookforyou.bk4u.book.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.book.model.service.BookService;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.member.model.service.MemberService;
import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.store.model.service.StoreService;
import com.bookforyou.bk4u.store.model.vo.OffBook;
import com.bookforyou.bk4u.store.model.vo.Store;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoreService storeService;
	
	/**
	 * [관리자] 전체 도서 목록 조회 + 페이징, 상태별 도서 개수&목록 조회(한진)
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
		
		int listCount = 0;
		int storeNo = 0;
		Store st = null;
		ArrayList<Book> bList = null;
		ArrayList<OffBook> obList = null;

		if(condition == "searchAll" || condition == "bookTitle" || condition == "writerName" || condition == "publisher") {
			listCount = bookService.selectSearchBookCount(map);
		}else {
			storeNo = Integer.parseInt(condition);
			listCount = storeService.selectSearchOffBookCount(map);
			st = storeService.selectStoreDetail(storeNo);
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		if(condition == "searchAll" || condition == "bookTitle" || condition == "writerName" || condition == "publisher") {
			bList = bookService.selectSearchBook(pi, map);
			mv.setViewName("book/bookSearchList");
		}else {
			obList = storeService.selectSearchOffBook(pi, map);
			mv.setViewName("store/offBookSearchList");
			System.out.println(obList);
		}
		
		System.out.println(st);
		
		mv.addObject("pi", pi)
		  .addObject("st", st)
		  .addObject("keyword", keyword)
		  .addObject("bList", bList)
		  .addObject("obList", obList);
		
		return mv;
	}
	
	/**
	 * [관리자] 검색조건에 일치하는 도서 목록 조회 (한진) 
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
		
		int result = 0;
		for(int i=0; i<bkNoArr.size(); i++) {
			String bkNo = bkNoArr.get(i);
			map.put("bkNo", bkNo);
			map.put("statusValue", statusValue);
			result = bookService.updateBookStatus(map);
		}
		
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
									@RequestParam(value="ganre") String subCateName,
									MultipartFile[] bkFile, HttpSession session) {
		
		
		String date = year + "-" + month + "-" + day;
		b.setBkDate(date);
		b.setBkNo(bkNo);
		b.setSubCateName(subCateName);
		
		System.out.println("b : " + b);
		System.out.println("sub : " + subCateName);
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 후 => 원본명, 서버업로드된 경로 b에 담기
		if(!bkFile[0].getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 삭제
			if(b.getIntroOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getIntroChangeName())).delete();
			}
			// 새로 넘어온 첨부파일 업로드 시키기
			String introChangeName = saveFile(session, bkFile[0]);
			// b에 새로 넘어온 첨부파일에 대한 정보 담기
			b.setIntroOriginName(bkFile[0].getOriginalFilename());
			b.setIntroChangeName("resources/book/" + introChangeName);
		}

		if(!bkFile[1].getOriginalFilename().equals("")) {
			if(b.getWriterOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getWriterChangeName())).delete();
			}
			String writerChangeName = saveFile(session, bkFile[1]);
			b.setWriterOriginName(bkFile[1].getOriginalFilename());
			b.setWriterChangeName("resources/book/" + writerChangeName);
		}
		
		int result = bookService.updateAdminBook(b);
		
		List<String> selectedIntr = bookService.selectAdminBookInterest(b);

		// 수정된 관심사목록이 원래 관심사목록에 포함되어있지 않을 경우 해당 관심사는 삭제하기
		String interest = "";
		for(int i=0; i<selectedIntr.size(); i++) {
			if(!itrs.contains(selectedIntr.get(i))) {
				b.setInterestContent(selectedIntr.get(i));
				int delete = bookService.deleteAdminBookItrs(b);
			}
		}

		// 새롭게 등록된 관심사 목록은 추가
		for(int i=0; i<itrs.size(); i++) {
			interest = itrs.get(i);
			if(!selectedIntr.contains(interest)) {
				b.setInterestContent(interest);
				int	result1 = bookService.insertAdminBookItrs(b);					
			}
		}
		
		return "redirect:/adminBookDetail.bk?bkNo=" + b.bkNo;
	}
	
	private String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/book/");
		
		String originName = upfile.getOriginalFilename(); // 20210702170130(년월일시분초) + 랜덤값 + .jpg (확장자)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}

	/**
	 * [관리자] summernote 사진첨부 ajax(한진)
	 */
	@ResponseBody
	@RequestMapping(value="uploadAdminSummernoteImageAjax", produces="application/json; charset=utf-8")
	public String uploadAdminSummernoteImage(@RequestParam("file") MultipartFile upfile, HttpSession session) {
		
		JsonObject jObj = new JsonObject();
		
		String savePath = session.getServletContext().getRealPath("/resources/summernoteImage/");
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyymmdd").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		File file = new File(savePath + changeName);
		
		try {
			InputStream fileStream = upfile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, file); // 파일 저장
			
			/*upfile.transferTo(file);*/
			
			jObj.addProperty("url", "resources/summernoteImage/" + changeName); // contextroot + resources + 저장할 내부 폴더명
			jObj.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(file); // 저장된 파일 삭제
			jObj.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String imageData = jObj.toString();
		return imageData;
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
							      @RequestParam(value="itrs") List<String> itrs,
							      MultipartFile[] bkFile, HttpSession session) {
		String date = year + "-" + month + "-" + day;
		b.setBkDate(date);
		b.setSubCateName(subCateName);
		
		System.out.println(bkFile);
		
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 후 => 원본명, 서버업로드된 경로 b에 담기
		if(!bkFile[0].getOriginalFilename().equals("")) {
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 삭제
			if(b.getIntroOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getIntroChangeName())).delete();
			}
			// 새로 넘어온 첨부파일 업로드 시키기
			String introChangeName = saveFile(session, bkFile[0]);
			// b에 새로 넘어온 첨부파일에 대한 정보 담기
			b.setIntroOriginName(bkFile[0].getOriginalFilename());
			b.setIntroChangeName("resources/book/" + introChangeName);
		}

		if(!bkFile[1].getOriginalFilename().equals("")) {
			if(b.getWriterOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getWriterChangeName())).delete();
			}
			String writerChangeName = saveFile(session, bkFile[1]);
			b.setWriterOriginName(bkFile[1].getOriginalFilename());
			b.setWriterChangeName("resources/book/" + writerChangeName);
		}
		
		
		int result = bookService.insertAdminBook(b);

		int lastBkNo = bookService.selectAdminLastBkNo();
		int bkNo = lastBkNo - 1;
		b.setBkNo(bkNo);
		
		System.out.println(b);
		

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
	
	/*
	 * [관리자] 도서 삭제 (한진)
	 */
	@RequestMapping("adminBookDelete.bk")
	public String adminBookDelete(ModelAndView mv,
									@RequestParam(value="selectedBook") List<String> bkNoArr) {
		
		System.out.println("bkNoArr : " + bkNoArr);
		for(String bn : bkNoArr) {
			System.out.println("bn : " + bn);
			int adminBookItrsDelete = bookService.deleteAdminBookInterest(bn);
			int adminBookDelete = bookService.deleteAdminBook(bn); 
		}
		
		mv.addObject("alertMsg", "도서가 삭제되었습니다.");
		
		return "redirect:/adminBookList.bk";
	}
}
