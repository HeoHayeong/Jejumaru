package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class NWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		Notice_WriteDAO dao = new Notice_WriteDAO();
		
		// 입력한 값(parameter) 받아오기
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		
		
		
		// 유효성 체크
		if(ntitle != null && ntitle.trim().length() > 0) {
			try {
				cnt = dao.insert(ntitle, ncontent);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		
		
		
		request.setAttribute("result", cnt);
		
	}

}
















