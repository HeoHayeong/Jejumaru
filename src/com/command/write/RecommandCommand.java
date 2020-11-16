package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ListDAO;
import com.lec.beans.ListDTO;

public class RecommandCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ListDAO dao = new ListDAO(); // DAO 객체 생성
		ListDTO [] arr = null;
		
		try {
			arr = dao.recommand();
			request.setAttribute("recommand", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}  
	}

}
