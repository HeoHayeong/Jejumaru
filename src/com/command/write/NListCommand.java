package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.Notice_WriteDAO;
import com.lec.beans.Notice_WriteDTO;
import com.lec.beans.Q_WriteDAO;
import com.lec.beans.Q_WriteDTO;

public class NListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_WriteDAO dao = new Notice_WriteDAO();  // DAO 객체 생성
		Notice_WriteDTO [] arr = null;
		
		
		try {
			arr = dao.select();  // 트랜잭션 수행
			
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("notice_list", arr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
