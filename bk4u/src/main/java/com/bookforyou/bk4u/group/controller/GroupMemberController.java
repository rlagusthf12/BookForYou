package com.bookforyou.bk4u.group.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.bookforyou.bk4u.group.model.service.GroupService;
import com.bookforyou.bk4u.group.model.service.GroupServiceImpl;
import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.group.model.vo.GroupMember;

/**
 * Servlet implementation class GroupMemberController
 */
@WebServlet("/groupMemberList")
public class GroupMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
		/*
		String condition = request.getParameter("condition");
		String keyword = request.getParameter("keyword");
				
		GroupMember map = new HashMap<>();

		
		GroupService gService = new GroupServiceImpl();
		
		//PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 1 , 4);
		ArrayList<GroupMember> list = gService.insertGMem(map);
		
		request.setAttribute("list", list);
		
	*/
		GroupService gService = new GroupServiceImpl();

		int list = gService.insertGMem(null);
		request.getRequestDispatcher("WEB-INF/views/group/groupDetailView.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
