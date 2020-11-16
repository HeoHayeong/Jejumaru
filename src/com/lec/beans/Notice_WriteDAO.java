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
import java.util.List;

import common.D;

public class Notice_WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public Notice_WriteDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("공지사항 데이터베이스 연결됐다리, 데이터베이스 연결!!");
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
	
	
	// 새글 작성  <-- 제목, 내용
	public int insert(String title, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_N_WRITE_INSERT);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();
	
	
	// 새글작성 <-- DTO
	public int insert(Notice_WriteDTO dto) throws SQLException{
		String ntitle = dto.getNtitle();
		String ncontent = dto.getNcontent();
		
		int cnt = this.insert(ntitle, ncontent);
		return cnt;		
	}
	
	
	
	
	
	
	// ResultSet --> DTO 배열로 리턴
	public Notice_WriteDTO [] createArray(ResultSet rs) throws SQLException {
		Notice_WriteDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<Notice_WriteDTO> notice_list = new ArrayList<Notice_WriteDTO>();
		
		while(rs.next()) {
			int nno = rs.getInt("NNO");
			String title = rs.getString("NTITLE");
			String content = rs.getString("NCONTENT");
			if(content == null) content = "";
			int viewCnt = rs.getInt("NVIEWCNT");
			//int nmno = rs.getInt("NMNO");
			
			
			Date d = rs.getDate("NDATE");
			
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
			}
			
			Notice_WriteDTO dto = new Notice_WriteDTO(nno,/*nmno,*/ title, content, viewCnt);
			dto.setNregDate(regDate);
			notice_list.add(dto);
		} // end while
		
		arr = new Notice_WriteDTO[notice_list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		notice_list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
	} // end createArray()
	
	// 전체 SELECT
	public Notice_WriteDTO [] select() throws SQLException {
		Notice_WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_N_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		 
		return arr;
	} // end select();
	
	
	// 특정 nno 의 글만 SELECT
	public Notice_WriteDTO[] selectByNno(int nno) throws SQLException {
		Notice_WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_NNO);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectByNno()
	
	
	// 특정 nno 글 내용 읽기, 조회수 증가
	// viewcnt 도 +1 증가해야 하고, 읽어와야 한다 --> 트랜잭션 처리
	public Notice_WriteDTO [] readyByNno(int nno) throws SQLException{
		int cnt = 0;
		Notice_WriteDTO [] arr = null;
		
		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, nno);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_NNO);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);			
			conn.commit();
		} catch(SQLException e) {
			conn.rollback();  // 예외 발생하면 rollback
			throw e;		  // 예외를 다시 throw
		} finally {
			close();
		} // end try
		
		return arr;
	} // end readByNno()
	

	// 특정 nno 의 글 수정 (제목, 내용)
	public int update(int nno, String title, String content) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_N_WRITE_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, nno);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try		
		
		return cnt;
	} // end update()
	
	
	// 특정 nno 글 삭제하기
	public int deleteByNno(int nno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_NNO);
			pstmt.setInt(1, nno);
			cnt = pstmt.executeUpdate();			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByNno()
	
	
}





















