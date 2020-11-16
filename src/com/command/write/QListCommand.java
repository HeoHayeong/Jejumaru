package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;

public class QListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Q_WriteDAO qdao = new Q_WriteDAO();
		Q_WriteDTO[] qarr = null;
		
		
		try {
			qarr = qdao.select();
			
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("q_list", qarr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
