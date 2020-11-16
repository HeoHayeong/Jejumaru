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

import common.D;

public class ListDAO {
	int writePages = 10;  // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
	int pageRows = 9;   // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
	int totalPage = 0;   // 총 몇 '페이지' 분량인가?
	int curPage = 1; // 현재 페이지 (디폴트는 1 page)
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public ListDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO생성, 데이터베이스 연결!!");
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
	public ListDTO [] createArray(ResultSet rs) throws SQLException{
		ListDTO [] arr = null; // DTO 배열로 리턴
		 
		ArrayList<ListDTO> list = new ArrayList<ListDTO>();
		
		while(rs.next()) {
			int pno = rs.getInt("pno");
			String pthumb = rs.getString("pthumb");
			String ptitle = rs.getString("ptitle");
			String plabel = rs.getString("plabel");
			String paddr = rs.getString("paddr");
			String ptel = rs.getString("ptel");
			if(ptel == null) ptel = "--";
			
			ListDTO dto = new ListDTO(pno, pthumb, ptitle, plabel, paddr, ptel);
			list.add(dto);
		} // end while
		
		arr = new ListDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
		
		return arr;
	} // end createArray()
	
	// 전체 SELECT
	public ListDTO [] select(String cate, String pageParam) throws SQLException {
		ListDTO [] arr = null;
		String con1 = "";
		String con2 = "";
		String con3 = "";
		
		int cnt = 0;
		
		// 현재 몇 페이지 인지 parameter 받아오기
		if(pageParam != null && !pageParam.trim().equals("")){
			try{			
				curPage = Integer.parseInt(pageParam);
			} catch(NumberFormatException e){
				// ※ page parameter 에러 처리
			}
		}
		
		try {
			switch(cate) {
			case "jeju":
				con1 = "제주시";
				break;
			case "seo":
				con1 = "서귀포시";
				break;
			case "island":
				con1 = "섬 속의 섬";
				break;
			default:
				con1 = "제주시";
				con2 = "서귀포시";
				con3 = "섬 속의 섬";
				break;
			}
			
			pstmt = conn.prepareStatement(D.SQL_COUNT_ALL);	
			pstmt.setString(1, con1);
			pstmt.setString(2, con2);
			pstmt.setString(3, con3);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);  // 전체 개수 구하기
			
			rs.close();
			pstmt.close();
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows);  // 총 몇 페이지 분량인가?
			
			int fromRow = (curPage - 1) * pageRows + 1;   // 몇번째  row 부터?
			
			pstmt = conn.prepareStatement(D.SQL_LIST_SELECT);
			
			pstmt.setString(1, con1);
			pstmt.setString(2, con2);
			pstmt.setString(3, con3);
			pstmt.setInt(4, fromRow);
			pstmt.setInt(5, fromRow + pageRows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		 
		return arr;
	} // end select();
	
	public ListDTO [] recommand() throws SQLException {
		ListDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RECOMMAND_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	public ListDTO [] search(String pageParam, String searchValue) throws SQLException {
		ListDTO [] arr = null;
		System.out.println(searchValue);
		int cnt = 0;
		String searchVal = "%" + searchValue.trim() + "%";
		if(searchValue.trim().equals("")) {
			searchVal = null;
		}
		// 현재 몇 페이지 인지 parameter 받아오기
		if(pageParam != null && !pageParam.trim().equals("")){
			try{			
				curPage = Integer.parseInt(pageParam);
			} catch(NumberFormatException e){
				// ※ page parameter 에러 처리
			}
		}
		
		try {
			pstmt = conn.prepareStatement(D.SQL_COUNT_SEARCH);	
			pstmt.setString(1, searchVal);
			pstmt.setString(2, searchVal);
			pstmt.setString(3, searchVal);
			pstmt.setString(4, searchVal);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);  // 전체 개수 구하기
			
			rs.close();
			pstmt.close();
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows);  // 총 몇 페이지 분량인가?
			
			int fromRow = (curPage - 1) * pageRows + 1;   // 몇번째  row 부터?
			
			pstmt = conn.prepareStatement(D.SQL_SEARCH_SELECT);
			
			pstmt.setString(1, searchVal);
			pstmt.setString(2, searchVal);
			pstmt.setString(3, searchVal);
			pstmt.setString(4, searchVal);
			pstmt.setInt(5, fromRow);
			pstmt.setInt(6, fromRow + pageRows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end select();
	
	public int totPage() throws SQLException {
		return totalPage;
	}
	
	public int curPage() throws SQLException {
		return curPage;
	}
}





















