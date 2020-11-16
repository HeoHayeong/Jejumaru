package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;

public class QSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Q_WriteDAO dao = new Q_WriteDAO();
		Q_WriteDTO [] arr = null;
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		
		
		
		try {
			arr = dao.selectByQno(qno);  // 읽어오기
			
			request.setAttribute("q_list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
