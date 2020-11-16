package com.command.write;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.beans.MemberDAO;

public class pwfindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();  // DAO 객체 생성
		
		String id = request.getParameter("mid");
		String name = request.getParameter("mname");
		String email = request.getParameter("memail");
		
		try {
			String pw = dao.pwfind(id, name, email);  // 트랜잭션 수행
			
			request.setAttribute("pw", pw);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
