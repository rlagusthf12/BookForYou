package com.bookforyou.bk4u.booklist.conroller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.booklist.model.service.BooklistService;
import com.bookforyou.bk4u.booklist.model.vo.Booklist;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.common.template.Pagination;
import com.bookforyou.bk4u.like.model.vo.Like;
import com.bookforyou.bk4u.reply.model.vo.Reply;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class BooklistController {
	
	@Autowired
	private BooklistService blService;
	
	/** 독서록 리스트 조회용 + 페이징
	 * @author daeunlee
	 */
	@RequestMapping("list.bl")
	public String selectList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = blService.selectListCount(); // 독서록 총 게시글 갯수 조회
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Booklist> list = blService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "booklist/booklistListView";
	}
	
	/** 독서록 작성 페이지 호출용
	 * @author daeunlee
	 */
	@RequestMapping("enrollForm.bl")
	public String enrollForm() {
		return "booklist/booklistEnrollForm";
	}
	
	/** 독서록 작성용
	 * @author daeunlee
	 */
	@RequestMapping("insert.bl")
	public String insertBooklist(Booklist bl, Model model, HttpSession session) {
		
		int result = blService.insertBooklist(bl);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "독서록이 작성되었습니다!");
			return "redirect:list.bl";
		}else {
			model.addAttribute("errorMag", "독서록을 작성하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	/** summernote 사진첨부용
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="uploadSummernoteImageAjax", produces = "application/json; charset=utf-8")
	public String uploadSummernoteImage(@RequestParam("file") MultipartFile upfile, HttpSession session){
		
		JsonObject jsonObject = new JsonObject();
		
		String savePath = session.getServletContext().getRealPath("/resources/summernoteImage/");
		// 첨부파일 원본명
		String originName = upfile.getOriginalFilename(); 
		// 수정명 20210805104300(년월시분초) + 23445(랜덤값) + .png(원본파일확장자)
		String currentTime = new SimpleDateFormat("yyyymmdd").format(new Date());
		int ranNum = (int)(Math.random()*90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf(".")); //끝에서부터 "."을 찾기 시작, subString으로 .이후 값을 가져옴
		String changeName = currentTime + ranNum + ext;
		
		File file = new File(savePath+changeName);
		
		try {
			//받아온 객체를 업로드 처리하지 않으면 임시파일에 저장된 파일이 자동적으로 삭제되기 때문에 MultipartFile객체의 transferTo메서드를 이용해서 업로드처리
			upfile.transferTo(file);
			jsonObject.addProperty("url", "resources/summernoteImage/"+changeName);
			jsonObject.addProperty("responseCode", "success");
		} catch (IllegalStateException | IOException e) {
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String imageUrl = jsonObject.toString();
		return imageUrl;
	}
	
	
	/*
	@RequestMapping("searchBk.bl")
	public ModelAndView selectBookSearchList(String condition, String keyword, ModelAndView mv,
											@RequestParam(value="currentPage", defaultValue="1") int currentPage){
		// HashMap은 key+value 세트로 구성. Map 자료구조를 사용
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		int listCount = blService.selectSearchListCount(map);
		PageInfo pi = Pagination.getpageInfo(listCount, currentPage, 10, 5);
		ArrayList<Book> list = blService.selectSearchList(pi, map);
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword);
		return mv;
	}
	*/
	
	/** 도서 검색 모달창(1) : 도서 갯수 조회용
	 * 	도서 검색 모달창(2) : 도서 조회용
	 * @author daeunlee
	 */
	
	@ResponseBody
	@RequestMapping(value="searchBkAjax.bl", produces = "application/json; charset=utf-8")
	public String selectBookSearchList(Model model, String condition, String keyword) {
		
		// HashMap은 key+value 세트로 구성. Map 자료구조를 사용
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		ArrayList<Book> list = blService.selectBookSearchList(map);
		
		return new Gson().toJson(list);
	}
	
	/** 독서록 상세조회용
	 * @author daeunlee
	 */
	@RequestMapping("detail.bl")
	public ModelAndView selectBooklist(Booklist booklist, Like l, ModelAndView mv){
		int blNo = booklist.getBlNo();
		
		// 해당 게시글 조회수 증가용 서비스 호출 => update
		int result = blService.increaseCount(blNo);
		
		if(result > 0) {
			// 게시글 조회용 서비스 호출
			Booklist bl = blService.selectBooklist(blNo);
			
			// 좋아요 조회용 서비스 호출
			int likeCount =  blService.selectLikeCount(l);
			//int scrapCount =  blService.selectScrapCount(blNo);
			
			// 해당 게시글의 책정보 조회 서비스 호출
			Book bk = blService.selectBook(blNo);
			
			mv.addObject("bl", bl)
			  .addObject("bk", bk)
			  .addObject("l", l)
			  .setViewName("booklist/booklistDetailView");
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** 댓글 리스트 조회
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="rlistAjax.bl", produces="application/json; charset=utf-8")
	public String selectReplyList(int blNo) {
		ArrayList<Reply> list = blService.selectReplyList(blNo);
		return new Gson().toJson(list);
	}
	
	/** 댓글 작성
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="rinsertAjax.bl", produces="application/json; charset=utf-8")
	public String insertReply(Reply r) {
		int result = blService.insertReply(r);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/** 독서록 수정페이지 요청용
	 * @author daeunlee
	 */
	@RequestMapping("updateForm.bl")
	public String updateForm(int blNo, Model model) {
		model.addAttribute("bl", blService.selectBooklist(blNo));
		return "booklist/booklistUpdateForm";
	}
	
	/** 독서록 수정용
	 * @author daeunlee
	 */
	@RequestMapping("update.bl")
	public String updateBooklist(Booklist bl, Model model, HttpSession session) {
		int result = blService.updateBooklist(bl);
		System.out.println(bl);
		
		if(result>0) {
			session.setAttribute("alertMsg", "독서록을 수정했습니다.");
			return "redirect:detail.bl?blNo=" + bl.getBlNo();
		}else {
			model.addAttribute("errorMsg", "독서록을 수정하지 못했습니다.");
			return "common/errorPage";
		}
	}
	
	/** 독서록 삭제용
	 * @author daeunlee
	 */
	@RequestMapping("delete.bl")
	public String deleteBooklist(int blNo, String file, Model model, HttpSession session) {
		int result = blService.deleteBooklist(blNo);
		if(result > 0) {
			/*
			if(!file.equals("")) { // 첨부파일 있으면 파일삭제
				String removeFilePath = session.getServletContext().getRealPath(file);
				new File(removeFilePath).delete();
			}
			*/
			session.setAttribute("alertMsg", "독서록이 삭제되었습니다!");
			return "redirect:list.bl";
		}else {
			model.addAttribute("errorMsg", "독서록 삭제를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	/** 독서록 검색용
	 * @author daeunlee
	 */
	@RequestMapping("search.bl")
	public ModelAndView selectBooklistSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
			                                     String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = blService.selectSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Booklist> list = blService.selectBooklistSearchList(map, pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("booklist/booklistListView");
		
		return mv;
	}
	
	
	/** 좋아요 조회용
	 * @author daeunlee
	 */
	/*
	@ResponseBody
	@RequestMapping(value="selectLike.li", produces="application/json; charset=utf-8")
	public String selectLikeCount(Like l) {
		Like li = blService.selectLikeCount(l);
		return new Gson().toJson(li);
	}*/
	
	
	/** 좋아요 등록용
	 * @author daeunlee
	 */
	@ResponseBody
	@RequestMapping(value="insertLike.li", produces="application/json; charset=utf-8")
	public String insertLike(Like l) {
		int result = blService.insertLike(l);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="topList.bl", produces="application/json; charset=utf-8")
	public String selectTopBooklist(){
		return new Gson().toJson(blService.selectTopBooklist());
	}
	
	
	
	
	
	// 파일명 수정용 메소드 공동모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		// * 물리적 경로 알아내기 위해선 세션객체 필요함 why? ServletContext객체 얻어내기 위해  => 세션 매개변수에 추가하기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles");
		
		// 첨부파일 원본명
		String originName = upfile.getOriginalFilename();
		
		// 수정명 20210805104300(년월시분초) + 23445(랜덤값) + .png(원본파일확장자)
		String currentTime = new SimpleDateFormat("yyyymmdd").format(new Date());
		int ranNum = (int)(Math.random()*90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf(".")); //끝에서부터 "."을 찾기 시작, subString으로 .이후 값을 가져옴
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			//받아온 객체를 업로드 처리하지 않으면 임시파일에 저장된 파일이 자동적으로 삭제되기 때문에 MultipartFile객체의 transferTo메서드를 이용해서 업로드처리
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}

}
