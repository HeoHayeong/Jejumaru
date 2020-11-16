package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class QWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qcnt = 0;
		
		Q_WriteDAO qdao = new Q_WriteDAO();
		
		// 입력한 값(parameter) 받아오기
		
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		int qmno = Integer.parseInt(request.getParameter("qmno"));
		
		
		// 유효성 체크
		
		
		if(qtitle != null && qtitle.trim().length() > 0) {
			try {
				qcnt = qdao.insert(qtitle, qcontent, qmno);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute("qresult", qcnt);
		
	}

}
















