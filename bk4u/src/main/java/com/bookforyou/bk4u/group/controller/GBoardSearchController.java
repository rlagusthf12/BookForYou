package com.bookforyou.bk4u.group.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.service.GroupServiceImpl;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;

/**
 * Servlet implementation class GBoardSearchController
 */
@WebServlet("/search.gbo")
public class GBoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GBoardSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
				
		HashMap<String, String> map = new HashMap<>();
		map.put("condtion", condition);
		map.put("keyword", keyword);
		
		GroupService gService = new GroupServiceImpl();
		int searchCount = gService.selectSearchGListCount(map);
		
		ArrayList<GroupBoard> list = gService.selectSearchListOne(map);
		
		request.setAttribute("list", list);
		
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		
		request.getRequestDispatcher("WEB-INF/views/group/groupList.jsp").forward(request, response);
	}
		
 	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
