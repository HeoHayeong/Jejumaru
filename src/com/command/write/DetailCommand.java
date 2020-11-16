package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;


// viewcommand


public class DetailCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO(); 
		WriteDTO[] arr = null;
		int writePages = 5;  // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
		int pageRows = 5;   // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
		int totalPage = 0;
		int curPage = 0;
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		try {
			arr = dao.select(pno, request.getParameter("page"));
			totalPage = dao.totPage();
			curPage = dao.curPage();
			
			for (WriteDTO dto : arr) {
				System.out.println(dto);
				
			}
			
			request.setAttribute("list", arr);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("curPage", curPage);
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
