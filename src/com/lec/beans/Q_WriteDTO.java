package com.lec.beans;

public class Q_WriteDTO {
	private int qno;
	private int qmno;
	private String qtitle;
	private String qcontent;
	private String qregdate;
	private String qmid;
	private String qanswer;
	private String qmname;
	



	private int qviewcnt;
	
	
	
	public Q_WriteDTO() {
		super();
		
	}

	public Q_WriteDTO(int qno, int qmno, String qtitle, String qcontent,
						int qviewcnt, String qanswer, String qmid, String qmname) {
		super();
		this.qno = qno;
		this.qmno = qmno;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qanswer = qanswer;
		this.qviewcnt = qviewcnt;
		this.qmid = qmid;
		this.qmname = qmname;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getQmno() {
		return qmno;
	}

	public void setQmno(int qmno) {
		this.qmno = qmno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQregdate() {
		return qregdate;
	}

	public void setQregdate(String qregdate) {
		this.qregdate = qregdate;
	}

	public int getQviewcnt() {
		return qviewcnt;
	}

	public void setQviewcnt(int qviewcnt) {
		this.qviewcnt = qviewcnt;
	}



	public String getQmid() {
		return qmid;
	}



	public void setQmid(String qmid) {
		this.qmid = qmid;
	}



	public String getQanswer() {
		return qanswer;
	}



	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
	
	
	public String getQmname() {
		return qmname;
	}

	public void setQmname(String qmname) {
		this.qmname = qmname;
	}
	
	
	
	
	
}
