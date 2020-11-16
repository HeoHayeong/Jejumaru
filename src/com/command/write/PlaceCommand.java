package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PlaceDAO;
import com.lec.beans.PlaceDTO;



public class PlaceCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PlaceDAO pdao = new PlaceDAO();
		PlaceDTO [] parr = null;
		
	
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("pno: "+pno);
		try {
			parr = pdao.rplaceselectByPno(pno);  
			request.setAttribute("place", parr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
		
		





