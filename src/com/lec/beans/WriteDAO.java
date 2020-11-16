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

public class WriteDAO {
	int writePages = 5;  // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
	int pageRows = 5;   // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
	int totalPage = 0;   // 총 몇 '페이지' 분량인가?
	int curPage = 1; // 현재 페이지 (디폴트는 1 page)
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public WriteDAO() {
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
	
	
	
	// 새글 작성  <--  유저,  별점 , 내용, 명소, 사진 
	public int insert(int rmno, double rstar, String rcontent, int rplace, 
			 		String rimg) 
			 				throws SQLException {
		int cnt = 0;
		
		try {
			
			pstmt = conn.prepareStatement(D.SQL_REVIEW_INSERT);
			pstmt.setInt(1, rmno);
			pstmt.setDouble(2, rstar);
			pstmt.setString(3, rcontent);
			pstmt.setInt(4, rplace);
			pstmt.setString(5, rimg);
		
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();
	
	
	// 새글작성 <-- DTO int rmno, int rstar, String rcontent, int rplace, String rimg
/*	public int insert(WriteDTO dto) throws SQLException{
		
		int rmno = dto.getRno();
		double rstar = dto.getRstar();
		String rcontent = dto.getRcontent();
		int rplace = dto.getRplace();
		for (String s : dto.getRplace()) {
			
		}

		
		int cnt = this.insert(rmno, rstar, rcontent, rplace, rimg);
		return cnt;		
	}
*/	
	
	
	// 새글작성 <-- 제목, 내용, 작성자
	//         <-- 첨부파일(들) ★
/*	public int insert(String subject, String content, String name,
//			List<String> originalFileNames,
//			List<String> fileSystemNames
//			) throws SQLException {
//		int cnt = 0;
//		int uid = 0;  // 새로 INSERt 된 글 의 자동생성(auto-generated)된 wr_uid 값
//		
//		try {
//			// 자동 생성되는 컬럼의 이름(들) 이 담긴 배열 준비 (auto-generated keys 배열)
//			String [] generatedCols = {"wr_uid"};
//			
//			// Statement 나 PreparedStatement 생성시 두번째 매개변수로
//			// auto-generated keys 배열을 넘긴다.
//			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT, generatedCols);
//			pstmt.setString(1, subject);
//			pstmt.setString(2, content);
//			pstmt.setString(3, name);
//			cnt = pstmt.executeUpdate();
//			
//			// auto-generated keys 값 뽑아오기
//			rs = pstmt.getGeneratedKeys();
//			if(rs.next()) {
//				uid = rs.getInt(1);
//			}
//			
//			pstmt.close();
//			
//			// 첨부파일(들) 정보테이블에 INSERT 하기
//			pstmt = conn.prepareStatement(D.SQL_FILE_INSERT);
//			for(int i = 0; i < originalFileNames.size(); i++) {
//				pstmt.setString(1, originalFileNames.get(i));
//				pstmt.setString(2, fileSystemNames.get(i));
//				pstmt.setInt(3, uid);
//				pstmt.executeUpdate();
//			}
//			
//		} finally {
//			close();
//		}
//		
//		return cnt;
//	} // end insert()
	
*/	
	
	
	// ResultSet --> DTO 배열로 리턴
	public WriteDTO [] createArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int rno = rs.getInt("rno");
			int rmno = rs.getInt("rmno");
			String mid = rs.getString("mid");
			String rcontent = rs.getString("rcontent");
			if(rcontent == null) rcontent = "";
//			Date rdate = rs.getDate("rdate");
			
			Date d = rs.getDate("rdate");
			
			String rdate = "";
			if(d != null) {
				rdate = new SimpleDateFormat("yyyy-MM-dd").format(d) ;
						
			}
			
			int rplace =rs.getInt("rplace");
			double rstar = rs.getDouble("rstar");
			String img = rs.getString("rimg");
			String[] rimg = null;
			if(img != null) {
				rimg = img.split(";");
			}
		
			System.out.println(Arrays.toString(rimg));
			WriteDTO dto = new WriteDTO(rno, rmno, mid, rcontent, rdate, rplace, rstar, rimg);
			dto.setRdate(rdate);
			list.add(dto);
		} // end while
		
		arr = new WriteDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
	} // end createArray()
	
	public WriteDTO [] createMyArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열로 리턴
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			String ptitle = rs.getString("ptitle");
			int rno = rs.getInt("rno");
			int rmno = rs.getInt("rmno");
			String rcontent = rs.getString("rcontent");
			if(rcontent == null) rcontent = "";
//			Date rdate = rs.getDate("rdate");
			
			Date d = rs.getDate("rdate");
			
			String rdate = "";
			if(d != null) {
				rdate = new SimpleDateFormat("yyyy-MM-dd").format(d) ;
						
			}
			
			int rplace =rs.getInt("rplace");
			double rstar = rs.getDouble("rstar");
			String img = rs.getString("rimg");
			String[] rimg = null;
			if(img != null) {
				rimg = img.split(";");
			}
//			String rimg = rs.getString("rimg");
//			String rimg2 = rs.getString("rimg2");
//			String rimg3 = rs.getString("rimg3");
//			String rimg4 = rs.getString("rimg4");
			System.out.println(Arrays.toString(rimg));
			WriteDTO dto = new WriteDTO(ptitle, rno, rmno, rcontent, rdate, rplace, rstar, rimg);
			dto.setRdate(rdate);
			list.add(dto);
		} // end while
		
		arr = new WriteDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
		
		return arr;
	} // end createArray()
	
	
	
	// 전체 SELECT       elect( 매개변수로 명소 번호 받아오기 )
	public WriteDTO [] select(int pno, String pageParam) throws SQLException {
		WriteDTO [] arr = null;
		
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
			pstmt = conn.prepareStatement(D.SQL_REVIEW_COUNT);	
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);  // 전체 개수 구하기
			
			rs.close();
			pstmt.close();
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows);  // 총 몇 페이지 분량인가?
			
			int fromRow = (curPage - 1) * pageRows + 1;   // 몇번째  row 부터?
			
			System.out.println(conn);
			pstmt = conn.prepareStatement(D.SQL_REVIEW_SELECT);
			pstmt.setInt(1, pno); // (1, 매개변수)
			pstmt.setInt(2, fromRow);
			pstmt.setInt(3, fromRow + pageRows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		 
		return arr;
	} // end select();
	
	public WriteDTO [] myreview(int mno, String pageParam) throws SQLException {
		WriteDTO [] arr = null;
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_MYREVIEW_COUNT);	
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);  // 전체 개수 구하기
			
			rs.close();
			pstmt.close();
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows);  // 총 몇 페이지 분량인가?
			
			int fromRow = (curPage - 1) * pageRows + 1;   // 몇번째  row 부터?
			
			System.out.println(conn);
			pstmt = conn.prepareStatement(D.SQL_MYREVIEW_SELECT);
			pstmt.setInt(1, mno); // (1, 매개변수)
			pstmt.setInt(2, fromRow);
			pstmt.setInt(3, fromRow + pageRows);
			rs = pstmt.executeQuery();
			arr = createMyArray(rs);
		} finally {
			close();
		}
		 
		return arr;
	}
	
	public int totPage() throws SQLException {
		return totalPage;
	}
	
	public int curPage() throws SQLException {
		return curPage;
	}
	// 특정 uid 의 글만 SELECT
/*	public WriteDTO[] selectByUid(int uid) throws SQLException {
//		WriteDTO [] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
//			pstmt.setInt(1, uid);
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		} // end try
//		
//		return arr;
//	} // end selectByUid()
*/
	
	
//	// 특정 명소(rpalce)  글 내용 읽기, 조회수 증가
//	// viewcnt 도 +1 증가해야 하고, 읽어와야 한다 --> 트랜잭션 처리
//	public WriteDTO [] readByUid(int uid) throws SQLException{
//		int cnt = 0;
//		WriteDTO [] arr = null;
//		
//		try {
//			// 트랜잭션 처리
//			conn.setAutoCommit(false);
////			pstmt = conn.prepareStatement(D.SQL_WRITE_INC_VIEWCNT);
//			pstmt.setInt(1, uid);
//			cnt = pstmt.executeUpdate();
//			
//			pstmt.close();
//			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
//			pstmt.setInt(1, uid);
//			rs = pstmt.executeQuery();
//			
//			arr = createArray(rs);			
//			conn.commit();
//		} catch(SQLException e) {
//			conn.rollback();  // 예외 발생하면 rollback
//			throw e;		  // 예외를 다시 throw
//		} finally {
//			close();
//		} // end try
//		
//		return arr;
//	} // end readByUid()
	

	// 특정 rno 의 글 수정 (내용, 이미지)
	public int update(int rno, String rcontent, String rimg) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_UPDATE);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, rimg);
			pstmt.setInt(3, rno);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try		
		
		return cnt;
	} // end update()
	
	
	// 특정 rno 글 삭제하기
	public int deleteByRno(int rno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_REVIEW_DELETE_BY_RNO);
			pstmt.setInt(1, rno);
			cnt = pstmt.executeUpdate();			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByRno()
	
//	public WriteDTO[] selectReviewPage(int page, int rplace) throws SQLException{
//		WriteDTO[] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(D.SQL_SELECT_FROM_ROW);
//			pstmt.setInt(1, rplace);
//			pstmt.setInt(2, 1 + (5 * (page-1)));
//			pstmt.setInt(3, 6 + (5 * (page-1)));
//			
//			rs = pstmt.executeQuery();
//			
//			arr = createArray(rs);
//		} finally {
//			close();
//		}
//		
//		return arr;
//	}
}











