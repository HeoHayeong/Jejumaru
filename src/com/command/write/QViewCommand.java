package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;
import com.lec.beans.Q_WriteDTO;
import com.lec.beans.Q_WriteDAO;

public class QViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("왜...? 왜안돼? -- QViewCommand.jsp");
		Q_WriteDAO qdao = new Q_WriteDAO();
		Q_WriteDTO[] qarr = null;
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		try {
			qarr = qdao.readyByQno(qno);
			request.setAttribute("q_list", qarr);
			request.setAttribute("answerTxt", qdao.answerTxtQno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		

	}

}
