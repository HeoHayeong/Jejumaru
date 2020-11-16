package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Q_WriteDAO;

public class AWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("여긴오냐!!!!!!!!!!!!!!!!!!!!!");
		int qcnt = 0;
		Q_WriteDAO qdao = new Q_WriteDAO();
		
		// 입력한 값(parameter) 받아오기
		
		String qanswer = request.getParameter("qanswer");
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		
		// 유효성 체크
		
		
		if(qanswer != null && qanswer.trim().length() > 0) {
			try {
				qcnt = qdao.insert(qanswer, qno);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute("qresult", qcnt);
		System.out.println(qcnt);
	}

}
















