package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.D;

public class MemberDAO {
	int mno = 0;
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public MemberDAO() {
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
	
	
	// 회원가입
	public int insert(String mid, String mpw, String mname, String memail) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			pstmt.setString(3, mname);
			pstmt.setString(4, memail);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();
	
	
	// 회원가입 <-- DTO
	public int insert(MemberDTO dto) throws SQLException{
		String mid = dto.getMid();
		String mpw = dto.getMpw();
		String mname = dto.getMname(); 
		String memail = dto.getMemail();
		
		int cnt = this.insert(mid, mpw, mname, memail);
		return cnt;		
	}
	
	// ResultSet --> DTO 배열로 리턴
	public MemberDTO [] createArray(ResultSet rs) throws SQLException {
		MemberDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		while(rs.next()) {
			int mno = rs.getInt("mno");
			String mid = rs.getString("mid");
			String mpw = rs.getString("mpw");
			String mname = rs.getString("mname");
			String memail = rs.getString("memail");
			
			MemberDTO dto = new MemberDTO(mno, mid, mpw, mname, memail);
			list.add(dto);
		} // end while
		
		arr = new MemberDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
	} // end createArray()
	
	
	// 회원가입 시 정보 존재 확인 (이메일인증 전 체크)
	public int join(String mid, String memail) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_INFO);
			pstmt.setString(1, mid);
			pstmt.setString(2, memail);
			cnt = pstmt.executeUpdate();
					
		} finally {
			close();
		}
		return cnt;
	} // end login();
	

	
	
	//-------------------------------------------------------------
	
		// ID찾기
		public String idfind(String mname, String memail) throws SQLException {
			
			String id = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_MID);
				pstmt.setString(1, mname);
				pstmt.setString(2, memail);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					id = rs.getString("mid");
				}
			} finally {
				close();
			}
			return id;
		} // end idfind();

		
		//-------------------------------------------------------------
		
		// PW찾기
		public String pwfind(String mid, String mname, String memail) throws SQLException {
			
			String pw = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_MPW);
				pstmt.setString(1, mid);
				pstmt.setString(2, mname);
				pstmt.setString(3, memail);
				rs = pstmt.executeQuery();

				while(rs.next()) {
					pw = rs.getString("mpw");
				}
			} finally {
				close();
			}
			return pw;
		} // end pwfind();
		
		
		//-------------------------------------------------------------
		
			
	// 로그인
	public int login(String mid, String mpw) throws SQLException {
		int cnt = 0;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_LOGIN);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_MNO);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mno = rs.getInt("mno");
			}
		} finally {
			close();
		}
		return cnt;
	} // end login();
	
	public int mno() {
		return mno;
	}
	
	
	// 로그인 <-- DTO
	public int login(MemberDTO dto) throws SQLException{
		String mid = dto.getMid();
		String mpw = dto.getMpw();
		
		int cnt = this.login(mid, mpw);
		return cnt;		
	}

	//-------------------------------------------------------------
	
	// 회원정보 수정 (비밀번호 변경)
	public int update(String mid, String mpw) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
			pstmt.setString(1, mpw);
			pstmt.setString(2, mid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try		
		
		
		return cnt;
	} // end update()
	

	
	// 회원탈퇴
	public int deleteByMid(String mid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_MID);
			pstmt.setString(1, mid);
			cnt = pstmt.executeUpdate();			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByUid()
	
	
}





















