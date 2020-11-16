package com.lec.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.D;

public class Q_WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	String answerTxt = null;
	
	public Q_WriteDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("Q 데이터베이스 연결됐다리, 데이터베이스 연결!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	/*INSERT!!!!*/
	public int insert(String title, String content, int qmno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_Q_INSERT) ;
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, qmno);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// answer insert
	public int insert(String content, int qno) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_A_INSERT);
			
			pstmt.setString(1, content);
			pstmt.setInt(2, qno);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
		
	}
	
	
	
	
	public int insert(Q_WriteDTO dto) throws SQLException {
		String qtitle = dto.getQtitle();
		String qcontent = dto.getQcontent();
		int qmno = dto.getQmno();
		
		int cnt = this.insert(qtitle, qcontent, qmno);
		
		return cnt;
	}
	
	
	
	// dto 배열로 rs 리턴
	public Q_WriteDTO[] createArray(ResultSet rs) throws SQLException {
		Q_WriteDTO[] arr = null;
		
		ArrayList<Q_WriteDTO> q_list = new ArrayList<Q_WriteDTO>();
		
		while(rs.next()) {
			System.out.println("*************************************");
			int qno = rs.getInt("QNO");
			String title = rs.getString("QTITLE");
			String content = rs.getString("QCONTENT");
			if(content==null) content="";
			int viewcnt = rs.getInt("QVIEWCNT");
			int qmno = rs.getInt("QMNO");
			
			answerTxt = rs.getString("QANSWER");
//			if(answerTxt == null) answerTxt ="";
			
			
			Date d = rs.getDate("QDATE");
			
			String regdate = "";
			if(d != null) {
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d);
			}
			
			
			String qmid = rs.getString("MID");
			String qmname = rs.getString("MNAME");
			
			String qinfo = qmname+"("+qmid.substring(0,2)+"**)";
			System.out.println(qinfo+"--이름");
			System.out.println(qmid+"--id");
			
			Q_WriteDTO dto = 
					new Q_WriteDTO(qno, qmno, title, content, viewcnt, answerTxt, qmid, qmname);
			
			dto.setQregdate(regdate);
			dto.setQmname(qinfo);
			
			q_list.add(dto);
		}
		
		arr = new Q_WriteDTO[q_list.size()];
		q_list.toArray(arr);
		
		return arr;
	}
	
	// 전체글 select
	public Q_WriteDTO[] select() throws SQLException {
		Q_WriteDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_Q_SELECT);
			
			System.out.println("Q_select() 모든글");
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	
	
	
	
	// 특정 qno 글 색출
	public Q_WriteDTO[] selectByQno(int qno) throws SQLException {
		Q_WriteDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_Q_SELECT_BY_QNO);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			
			
			
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	// id별 q&a 글 색출
	public Q_WriteDTO[] selectByQmno(int qmno) throws SQLException {
		Q_WriteDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_Q_SELECT_BY_QMNO);
			pstmt.setInt(1, qmno);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	
	// 글 viewcnt 증가
	public Q_WriteDTO[] readyByQno(int qno) throws SQLException{
		int cnt = 0;
		Q_WriteDTO[] arr = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_Q_INC_VIEWCNT);
			pstmt.setInt(1, qno);
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_Q_SELECT_BY_QNO);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return arr;
		
	}
	
	// 특정 qno 글 수정 (제목, 내용)
	public int update(int qno, String title, String content ) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt= conn.prepareStatement(D.SQL_Q_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, qno);
			
			cnt = pstmt.executeUpdate();
			
			
			System.out.println("++++++++"+pstmt.executeUpdate());
			
		} finally {
			close();
		}
		return cnt;
	}
	
	
	
	// 특정 qno 글 삭제하기
	public int deleteByQno(int qno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_Q_DELETE_BY_QNO);
			pstmt.setInt(1, qno);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	public String answerTxtQno() {
		return answerTxt;
	}
	
	
	
	
	
}
