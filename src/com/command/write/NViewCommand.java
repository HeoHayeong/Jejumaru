package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;
import com.lec.beans.Q_WriteDTO;
import com.lec.beans.Q_WriteDAO;

public class NViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_WriteDAO dao = new Notice_WriteDAO();
		Notice_WriteDTO [] arr = null;
		
		System.out.println(request.getParameter("nno"));
//		String aa = request.getParameter("form");
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		
		try {
			arr = dao.readyByNno(nno);   // 읽기 + 조회수 증가	
			request.setAttribute("notice_list", arr);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}		
		
		
		
		
		
		
		
		
		

	}

}
