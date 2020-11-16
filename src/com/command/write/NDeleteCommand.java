package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class NDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		Notice_WriteDAO dao = new Notice_WriteDAO();
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		try {
			cnt = dao.deleteByNno(nno);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}
