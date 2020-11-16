package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
	//	FileDAO fileDao = new FileDAO();  //  첨부파일 
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		try {
			
//			fileDao.deleteByWrUid(rno, request);
			
			cnt = dao.deleteByRno(rno);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("delete", cnt);
	}

}
