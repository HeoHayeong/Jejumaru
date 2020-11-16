package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;

public class NSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_WriteDAO dao = new Notice_WriteDAO();
		Notice_WriteDTO [] arr = null;
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		try {
			arr = dao.selectByNno(nno);  // 읽어오기
			request.setAttribute("notice_list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
