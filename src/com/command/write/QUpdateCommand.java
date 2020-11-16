package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class QUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		Q_WriteDAO dao = new Q_WriteDAO();
		
		
		
		// parameter
		int qno = Integer.parseInt(request.getParameter("qno"));
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		
		
		if(qtitle != null && qtitle.trim().length() > 0) {
			try {
				System.out.println(request.getParameter("qno"));
				cnt = dao.update(qno, qtitle, qcontent);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("qresult", cnt);

	}

}
