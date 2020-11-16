package com.command.write;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.beans.MemberDAO;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

	/*	MemberDAO dao = new MemberDAO();  // DAO 객체 생성
		
		String email = request.getParameter("memail");
		
		try {
			String mail = dao.mail(email);  // 트랜잭션 수행
			
			request.setAttribute("mail", mail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
	}
}
