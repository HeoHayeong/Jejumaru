package com.lec.beans;

import java.util.Date;

//DTO : data transfer Object
public class WriteDTO {
	
	private int rno;  // 리뷰번호 
	private int rmno;  // 회원번호 -> 회원이름 
	private String rcontent; // 내용 
	private String rdate; // 리뷰 등록한 날짜
	private int rplace; // 명소번호 -> 명소이름 
	private double rstar; // 별점 
	private String[] rimg; // 리뷰사진 
	private String mid;
	private String ptitle;
	//private String rimg; // 리뷰사진 
//	private String rimg2; // 리뷰사진 2
//	private String rimg3; // 리뷰사진 3
//	private String rimg4; // 리뷰사진 4
	
	// 개발시..
	// 다음 3가지 네이밍은 일치시켜주는 것이 좋다 .
	// 클래스 필드명 = DB 필드명  = form 의 name명
	
	//기본 생성자
	public WriteDTO() {
		super();
		//System.out.println("WriteDTO() 객체 생성");
	}
	
	//매개변수를 받는 생성자

	public WriteDTO(int rno, int rmno, String mid, String rcontent, String rdate, int rplace, double rstar, 
					String[] rimg) {
		super();
		this.rno = rno;
		this.rmno = rmno;
		this.mid = mid;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rplace = rplace;
		this.rstar = rstar;
		this.rimg = rimg;
//		this.rimg2 = rimg2;
//		this.rimg3 = rimg3;
//		this.rimg4 = rimg4;
	}
	
	public WriteDTO(String ptitle, int rno, int rmno, String rcontent, String rdate, int rplace, double rstar, 
			String[] rimg) {
		super();
		this.ptitle = ptitle;
		this.rno = rno;
		this.rmno = rmno;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rplace = rplace;
		this.rstar = rstar;
		this.rimg = rimg;
	}

	

	// getter/setter
	
		public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

		public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

		public int getRno() {
			return rno;
		}
		
		public void setRno(int rno) {
			this.rno = rno;
		}
		
		public int getRmno() {
			return rmno;
		}
		
		public void setRmno(int rmno) {
			this.rmno = rmno;
		}
		
		public String getRcontent() {
			return rcontent;
		}
		
		public void setRcontent(String rcontent) {
			this.rcontent = rcontent;
		}
		
		public String getRdate() {
			return rdate;
		}
		
		public void setRdate(String rdate) {
			this.rdate = rdate;
		}
		
		public int getRplace() {
			return rplace;
		}
		
		public void setRplace(int rplace) {
			this.rplace = rplace;
		}
		
		public double getRstar() {
			return rstar;
		}
		
		public void setRstar(double rstar) {
			this.rstar = rstar;
		}
		
		
		public String[] getRimg(){
			return rimg;
		}
		
		public void setRimg(String[] rimg) {
			this.rimg = rimg;
		}

		@Override
		public String toString() {
			return "WriteDTO [rstar=" + rstar + "]";
		}
		


	
}
