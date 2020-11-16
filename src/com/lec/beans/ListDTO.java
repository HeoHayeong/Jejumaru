package com.lec.beans;

// DTO : Data Transfer Object
public class ListDTO {
	private int pno;    // wr_uid
	private String pthumb;  // wr_subject
	private String ptitle;
	private String plabel;
	private String paddr;  // wr_content
	private String ptel;   // wr_name

	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	// 기본생성자
	public ListDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public ListDTO(int pno, String pthumb, String ptitle, String plabel, String paddr, String ptel) {
		super();
		this.pno = pno;
		this.pthumb = pthumb;
		this.ptitle = ptitle;
		this.plabel = plabel;
		this.paddr = paddr;
		this.ptel = ptel;
//		System.out.printf("WriteDTO(%d, %s, %s, %s, %d) 객체 생성", uid, subject, content, name, viewCnt);
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPthumb() {
		return pthumb;
	}

	public void setPthumb(String pthumb) {
		this.pthumb = pthumb;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPaddr() {
		return paddr;
	}

	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}

	public String getPtel() {
		return ptel;
	}

	public void setPtel(String ptel) {
		this.ptel = ptel;
	}

	public String getPlabel() {
		return plabel;
	}

	public void setPlabel(String plabel) {
		this.plabel = plabel;
	}

	
} // end DTO

















