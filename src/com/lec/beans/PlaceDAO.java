package com.lec.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import common.D;

public class PlaceDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public PlaceDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("PlaceDAO생성, 데이터베이스 연결!!");
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // end 생성자
	
	
	// DB 자원 반납 메소드, 만들어 놓으면 편함.
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	
	
	// ResultSet --> DTO 배열로 리턴
	public PlaceDTO [] createArray(ResultSet rs) throws SQLException {
		PlaceDTO [] parr = null;  // DTO 배열로 리턴
		
		ArrayList<PlaceDTO> place = new ArrayList<PlaceDTO>();
		
		while(rs.next()) {
			System.out.println("while!");
			int pno = rs.getInt("pno"); //1
			String pcontentsid = rs.getString("pcontentsid"); //2
			String ptitle = rs.getString("ptitle"); //3
			String plabel = rs.getString("plabel"); //4
			String paddr = rs.getString("paddr"); //5
			String proad = rs.getString("proad"); //6
			String pintro = rs.getString("pintro"); //7
			
			float plat = rs.getFloat("plat"); //8
			float plong = rs.getFloat("plong"); //9
			String ptel = rs.getString("ptel"); //10
			String pimg = rs.getString("pimg"); //11
			String pthumb = rs.getString("pthumb"); //12
			String popentime = rs.getString("popentime"); //13
			String pclosetime = rs.getString("pclosetime"); //13
			
			// double rstar = rs.getDouble("rstar"); 별점 
		
			
			PlaceDTO pdto = new PlaceDTO(pno, pcontentsid, ptitle, plabel, paddr, proad, pintro, plat, plong, ptel, pimg, pthumb, popentime, pclosetime);
			System.out.println(pdto);
			
			place.add(pdto);
		} // end while
		
		parr = new PlaceDTO[place.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		place.toArray(parr);  // 리스트 -> 배열
			
		return parr;
	} // end createArray()
	
	
	
	// 전체 SELECT       elect( 매개변수로 명소 번호 받아오기 )
//	public WriteDTO [] select() throws SQLException {
//		WriteDTO [] arr = null;
//		
//		try {
//			System.out.println(conn);
//			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT);
//			pstmt.setInt(1, 50); // (1, 매개변수)
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		}
//		 
//		return arr;
//	} // end select();
	
	
	// 특정 uid 의 글만 SELECT
	public PlaceDTO[] rplaceselectByPno(int pno) throws SQLException {
		PlaceDTO [] parr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RPLACE_SELECT_BY_PNO);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			parr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return parr;
	} // end selectByUid()


}











