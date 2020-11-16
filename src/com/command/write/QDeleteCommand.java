package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class QDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qcnt = 0;
		
		Q_WriteDAO qdao = new Q_WriteDAO();
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		try {
			qcnt = qdao.deleteByQno(qno);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("qresult", qcnt);
	}

}
