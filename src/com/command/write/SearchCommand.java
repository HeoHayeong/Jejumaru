package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.ListDAO;
import com.lec.beans.ListDTO;

public class SearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ListDAO dao = new ListDAO(); // DAO 객체 생성
		ListDTO [] arr = null;
		int writePages = 10;  // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
		int pageRows = 9;   // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
		int totalPage = 0;
		int curPage = 0;
		System.out.println(request.getParameter("page"));
		try {
			arr = dao.search(request.getParameter("page"), request.getParameter("searchVal"));
			totalPage = dao.totPage();
			curPage = dao.curPage();
			// "list" 란  name 으로 request 에 arr 을 저장
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("list", arr);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("curPage", curPage);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
