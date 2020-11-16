package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;

public class MyListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Q_WriteDAO qdao = new Q_WriteDAO();
		Q_WriteDTO[] qarr = null;
		
		System.out.println(Integer.parseInt(request.getParameter("mno"))+"///00000000000000000000000000000000");
		
		int qmno = Integer.parseInt(request.getParameter("mno"));
		
		try {
			qarr = qdao.selectByQmno(qmno);
			
			
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("m_list", qarr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
