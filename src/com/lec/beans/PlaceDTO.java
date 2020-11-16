package com.lec.beans;

import java.util.Date;

//DTO : data transfer Object
public class PlaceDTO {
	
	private int pno;  // 1 명소번호 
	private String pcontentsid;  // 2  
	private String ptitle; // 3 명소이름 
	private String plabel; // 4 카테고리
	private String paddr; // 5 주소 
	private String proad; // 6 도로명주소
	private String pintro; // 7 설명 
	private float plat; // 8 위도 
	private float plong; // 9 경도
	private String ptel; // 10 전화번호 
	private String pimg; // 11 이미지1
	private String pthumb; // 12 이미지2
	private String popentime; // 13 오픈시간
	private String pclosetime; // 14 클로즈시간
	
	
//	private double pstar; // 별점 
	
	
	// 개발시..
	// 다음 3가지 네이밍은 일치시켜주는 것이 좋다 .
	// 클래스 필드명 = DB 필드명  = form 의 name명
	
	//기본 생성자
	public PlaceDTO() {
		super();
		//System.out.println("WriteDTO() 객체 생성");
	}
	
	//매개변수를 받는 생성자

	

		
		public PlaceDTO(int pno, String pcontentsid, String ptitle, String plabel, String paddr, String proad,
				String pintro, float plat, float plong, String ptel, String pimg, String pthumb, String popentime,
				String pclosetime) {
			super();
			this.pno = pno;
			this.pcontentsid = pcontentsid;
			this.ptitle = ptitle;
			this.plabel = plabel;
			this.paddr = paddr;
			this.proad = proad;
			this.pintro = pintro;
			this.plat = plat;
			this.plong = plong;
			this.ptel = ptel;
			this.pimg = pimg;
			this.pthumb = pthumb;
			this.popentime = popentime;
			this.pclosetime = pclosetime;
		}
		// getter/setter
		
		public int getPno() {
			return pno;
		}

		public void setPno(int pno) {
			this.pno = pno;
		}

		public String getPcontentsid() {
			return pcontentsid;
		}

		public void setPcontentsid(String pcontentsid) {
			this.pcontentsid = pcontentsid;
		}

		public String getPtitle() {
			return ptitle;
		}

		public void setPtitle(String ptitle) {
			this.ptitle = ptitle;
		}

		public String getPlabel() {
			return plabel;
		}

		public void setPlabel(String plabel) {
			this.plabel = plabel;
		}

		public String getPaddr() {
			return paddr;
		}

		public void setPaddr(String paddr) {
			this.paddr = paddr;
		}

		public String getProad() {
			return proad;
		}

		public void setProad(String proad) {
			this.proad = proad;
		}

		public String getPintro() {
			return pintro;
		}

		public void setPintro(String pintro) {
			this.pintro = pintro;
		}

		public float getPlat() {
			return plat;
		}

		public void setPlat(float plat) {
			this.plat = plat;
		}

		public float getPlong() {
			return plong;
		}

		public void setPlong(float plong) {
			this.plong = plong;
		}

		public String getPtel() {
			return ptel;
		}

		public void setPtel(String ptel) {
			this.ptel = ptel;
		}

		public String getPimg() {
			return pimg;
		}

		public void setPimg(String pimg) {
			this.pimg = pimg;
		}

		public String getPthumb() {
			return pthumb;
		}

		public void setPthumb(String pthumb) {
			this.pthumb = pthumb;
		}

		public String getPopentime() {
			return popentime;
		}

		public void setPopentime(String popentime) {
			this.popentime = popentime;
		}

		public String getPclosetime() {
			return pclosetime;
		}

		public void setPclosetime(String pclosetime) {
			this.pclosetime = pclosetime;
		}

		@Override
		public String toString() {
			return "PlaceDTO [pno=" + pno + ", pcontentsid=" + pcontentsid + ", ptitle=" + ptitle + ", plabel=" + plabel
					+ ", paddr=" + paddr + ", proad=" + proad + ", pintro=" + pintro + ", plat=" + plat + ", plong="
					+ plong + ", ptel=" + ptel + ", pimg=" + pimg + ", pthumb=" + pthumb + ", popentime=" + popentime
					+ ", pclosetime=" + pclosetime + "]";
		}

		

}
