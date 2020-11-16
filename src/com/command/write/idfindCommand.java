package com.command.write;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lec.beans.MemberDAO;

public class idfindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();  // DAO 객체 생성
		
		String name = request.getParameter("mname");
		String email = request.getParameter("memail");
		
		try {
			String id = dao.idfind(name, email);  // 트랜잭션 수행
			
			request.setAttribute("id", id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
