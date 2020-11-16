package common;

/*
 * DB접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "NULLTEST";
	public static final String USERPW = "1234";
	
	public static final String SQL_LIST_SELECT = 
	"SELECT * FROM " +
	"(SELECT ROWNUM AS RNUM, T.* FROM " +
	"(SELECT * FROM place WHERE plabel in (?,?,?) ORDER BY pno) T) " +
	"WHERE RNUM >= ? AND RNUM < ?";
	
	public static final String SQL_COUNT_ALL = "SELECT COUNT(*) FROM place WHERE plabel in (?,?,?)";
	
	public static final String SQL_SEARCH_SELECT =
	"SELECT * FROM " +
	"(SELECT ROWNUM AS RNUM, T.* FROM " +
	"(SELECT * FROM place WHERE pintro like ? or ptitle like ? or paddr like ? or proad like ? ORDER BY pno) T) " +
	"WHERE RNUM >= ? AND RNUM < ?";
	
	public static final String SQL_COUNT_SEARCH = "SELECT COUNT(*) FROM place WHERE pintro like ? or ptitle like ? or paddr like ? or proad like ?";
	
	// 명소 관련 쿼리문 
	public static final String SQL_RPLACE_SELECT_BY_PNO =
			"SELECT * FROM PLACE WHERE pno = ?";
	
	// 리뷰 관련 쿼리문                                       
	public static final String SQL_REVIEW_INSERT = 
			"INSERT INTO review"
			+ "(rno, rmno, rstar, rcontent, rdate, rplace, rimg) "
			+ "VALUES"
			+ "(review_write_seq.nextval, ?, ?, ?, SYSDATE, ?, ?)";
	
	public static final String SQL_REVIEW_DELETE_BY_RNO =
			"DELETE FROM review WHERE rno = ?";
	
	public static final String SQL_REVIEW_UPDATE =
			"UPDATE review SET rcontent = ?, rimg = ? WHERE rno = ?";
	
	public static final String SQL_SELECT_FROM_ROW = "SELECT * FROM" +
	         "(SELECT ROWNUM AS RNUM, T.* FROM " +
	            "(SELECT * FROM REVIEW WHERE RPLACE = ? ORDER BY RNO DESC) T) "+
	               "WHERE RNUM >= ? AND RNUM < ?"  
	               ;
	
	// 특정 첨부파일(bf_uid) 하나를 delete
		public static final String SQL_FILE_DELETE_BY_UID =
				"DELETE FROM test_file WHERE bf_uid = ?";

		// 특정 글의(wr_uid) 의 첨부파일(들)을 delete 없어도됨 강사님은 글디비랑 이미지디비 따로있어서 쓴것.
		public static final String SQL_FILE_DELETE_BY_WRUID =
				"DELETE FROM test_file WHERE wr_uid = ?";
		
//		-----------------------------------------------------------------------------------
		
		public static final String SQL_REVIEW_SELECT = 
				"SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM REVIEW JOIN member ON rmno = mno where rplace =? ORDER BY RNO DESC) T) WHERE RNUM >= ? AND RNUM < ?";

		public static final String SQL_MYREVIEW_SELECT = 
				"SELECT * FROM (SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM REVIEW join place on pno = rplace where rmno =? ORDER BY RNO DESC) T) WHERE RNUM >= ? AND RNUM < ?";

		public static final String SQL_REVIEW_COUNT =
				"SELECT COUNT(*) FROM REVIEW WHERE rplace = ?";

		public static final String SQL_MYREVIEW_COUNT =
				"SELECT COUNT(*) FROM REVIEW WHERE rmno = ?";
		
		public static final String SQL_RECOMMAND_SELECT =
				"SELECT * FROM (SELECT * FROM place ORDER BY dbms_random.value) WHERE rownum >= 1 and rownum <= 9";

		// 회원가입 쿼리문
		public static final String SQL_WRITE_INSERT = 
				"INSERT INTO member"
				+ "(mno, mid, mpw, mname, memail) "
				+ "VALUES"
				+ "(member_seq.nextval, ?, ?, ?, ?)";
		
		// 회원정보 가져오기
		public static final String SQL_WRITE_SELECT_INFO = 
				"SELECT * FROM member WHERE mid=? AND memail=?";
		
		// 로그인
		public static final String SQL_WRITE_SELECT_BY_LOGIN =
				"SELECT * FROM member WHERE mid=? AND mpw=?";

	/*	// memail를 뽑아오는 쿼리
		public static final String SQL_WRITE_SELECT_BY_MEMAIL =
				"SELECT * FROM member WHERE memail=?";
		*/
		
		// mno를 뽑아오는 쿼리
		public static final String SQL_WRITE_SELECT_BY_MNO =
				"SELECT mno FROM member WHERE mid=?";

		// id 가져오기
		public static final String SQL_WRITE_SELECT_BY_MID =
				"SELECT mid FROM member WHERE mname=? AND memail=?";
		
		// pw 가져오기
		public static final String SQL_WRITE_SELECT_BY_MPW =
				"SELECT * FROM member WHERE mid=? AND mname=? AND memail=?";
		
		// 회원 탈퇴
		public static final String SQL_WRITE_DELETE_BY_MID =
				"DELETE FROM member WHERE mid = ?";

		// 회원정보수정 (비밀번호 변경)
		public static final String SQL_WRITE_UPDATE =
				"UPDATE member SET mpw = ? WHERE mid = ?";
		
	 

		
		//****************************************************************************
		
		/* 게시글 */
		   public static final String SQL_N_WRITE_INSERT = 
		         "INSERT INTO NOTICE "
		         + "(NNO, NTITLE, NCONTENT, NMNO, NDATE) "
		         + "VALUES"
		         + " (NOTICE_SEQ.nextval, ?, ?, 0, SYSDATE)";
		   
		   public static final String SQL_N_WRITE_SELECT =
		         "SELECT * FROM NOTICE ORDER BY NNO DESC";
		   
		   public static final String SQL_WRITE_SELECT_BY_NNO =
		         "SELECT * FROM NOTICE WHERE NNO=?";
		   
		   public static final String SQL_WRITE_INC_VIEWCNT =
		         "UPDATE NOTICE SET NVIEWCNT = NVIEWCNT + 1"
		         + " WHERE NNO=?";
		   
		   public static final String SQL_WRITE_DELETE_BY_NNO = 
		         "DELETE FROM NOTICE WHERE NNO=?";
		   
		   public static final String SQL_N_WRITE_UPDATE = 
		         "UPDATE NOTICE SET NTITLE =?, NCONTENT=?"
		         + "WHERE NNO=?";
		   
		   /////////////////////////////// QUESTION //////////////////////////////////////
		   
		   // member 테이블과 연결되어있는 qmno를 통해 mid 알아내기
		   public static final String SQL_QMID_SELECT = 
		         "SELECT Q.QNO, Q.QTITLE, M.MNAME, M.MID, Q.QVIEWCNT, Q.QDATE "
		         + "FROM MEMBER M, QUESTION Q "
		         + "WHERE M.MNO = Q.QMNO;";
		   
		   
		   //질문
		   public static final String SQL_Q_INSERT = 
		         "INSERT INTO QUESTION "
		         + "(QNO, QTITLE, QCONTENT, QMNO, QDATE) "
		         + "VALUES "
		         + "(QUESTION_SEQ.nextval, ?, ?, ?, SYSDATE)";
		   
		   public static final String SQL_Q_SELECT =
		         "SELECT * FROM MEMBER, QUESTION WHERE MNO = QMNO"
		         + " ORDER BY QNO DESC";
		   
		   
		   public static final String SQL_Q_SELECT_BY_QNO =
		         "SELECT * FROM MEMBER M, QUESTION Q WHERE MNO = QMNO AND QNO=?";
		   
		   public static final String SQL_Q_SELECT_BY_QMNO = 
		         "SELECT * FROM MEMBER M, QUESTION Q WHERE MNO = QMNO and MNO= ?";
		   
		   
		   //질문 조회수 증가
		   public static final String SQL_Q_INC_VIEWCNT =
		         "UPDATE QUESTION SET QVIEWCNT = QVIEWCNT + 1"
		         + " WHERE QNO=?";
		   
		   public static final String SQL_Q_DELETE_BY_QNO = 
		         "DELETE FROM QUESTION WHERE QNO=?";
		   
		   
		   public static final String SQL_Q_UPDATE = 
		         "UPDATE QUESTION SET QTITLE =?, QCONTENT=?"
		         + " WHERE QNO=?";
		   
		   
		   //답변
		   public static final String SQL_A_INSERT =
		         "UPDATE QUESTION "
		         +"SET "
		         +"QANSWER = ? "
		         +"WHERE "
		         +"QNO = ?";
		   
		   

		   

		
		
		
		
		
		
		
		
} // end D


