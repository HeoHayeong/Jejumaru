package com.lec.beans;

public class Notice_WriteDTO {
	private int nno;
	//private int nmno;
	private String ntitle;
	private String ncontent;
	private int nviewcnt;
	private String nregDate;
	
	
	
	public Notice_WriteDTO() {
		super();
	}
	
	public Notice_WriteDTO(int nno,/*int nmno,*/ String ntitle, String ncontent, int nviewcnt) {
		super();
		this.nno = nno;
		//this.nmno = nmno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nviewcnt = nviewcnt;
	}


	
	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public int getNviewcnt() {
		return nviewcnt;
	}

	public void setNviewcnt(int nviewcnt) {
		this.nviewcnt = nviewcnt;
	}

	public String getNregDate() {
		return nregDate;
	}

	public void setNregDate(String nregDate) {
		this.nregDate = nregDate;
	}

	

	@Override
	public String toString() {
		return String.format("WriteDTO] %d : %s : %s : %d : %s", 
				nno, ntitle, ncontent, nviewcnt, nregDate);
	}
	
	
	
	
	
	
	
	
	
}
