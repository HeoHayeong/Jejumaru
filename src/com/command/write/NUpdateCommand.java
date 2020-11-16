package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;

public class NUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Notice_WriteDAO dao = new Notice_WriteDAO();
		
		// parameter
		int nno = Integer.parseInt(request.getParameter("nno"));
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		
		if(ntitle != null && ntitle.trim().length() > 0) {
			try {
				cnt = dao.update(nno, ntitle, ncontent);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
