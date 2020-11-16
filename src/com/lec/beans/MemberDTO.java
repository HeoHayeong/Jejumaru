package com.lec.beans;

// DTO : Data Transfer Object
public class MemberDTO {
	private int mno;    // mno
	private String mid;  // mid
	private String mpw;  // mpw
	private String mname;   // mname
	private String memail;   // memail

	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	// 기본생성자
	public MemberDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자 (회원가입)
	public MemberDTO(int mno, String mid, String mpw, String mname, String memail) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.memail = memail;
	}
	
	// 매개변수 받는 생성자 (로그인)
	public MemberDTO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}

	// 매개변수 받는 생성자 (ID/PW찾기)
	public MemberDTO(String mid, String mname, String memail) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.memail = memail;
	}
	
	// getter & setter
	public int getMno() {
//		System.out.println("getUid() 호출");
		return mno;
	}
	public void setMno(int mno) {
//		System.out.println("setUid(" + mno + ") 호출");
		this.mno = mno;
	}
	public String getMid() {
//		System.out.println("getSubject() 호출");
		return mid;
	}
	public void setMid(String mid) {
//		System.out.println("setSubject(" + subject + ") 호출");
		this.mid = mid;
	}
	public String getMpw() {
//		System.out.println("getContent() 호출");
		return mpw;
	}
	public void setMpw(String mpw) {
//		System.out.println("setContent(" + content + ") 호출");
		this.mpw = mpw;
	}
	public String getMname() {
//		System.out.println("getName() 호출");
		return mname;
	}
	public void setMname(String mname) {
//		System.out.println("setName(" + name + ") 호출");
		this.mname = mname;
	}
	public String getMemail() {
//		System.out.println("getViewCnt() 호출");
		return memail;
	}
	public void setMemail(String memail) {
//		System.out.println("setViewCnt(" + viewCnt + ") 호출");
		this.memail = memail;
	}
	

	// 개발할때  Class 의   toString() 오버라이딩 해주면
	// 디버깅이나 테스트 하기 좋다.
	@Override
	public String toString() {
		return String.format("[WriteDTO] %d : %s : %s : %s : %d : %s", 
				mno, mid, mpw, mname, memail);
	}
	

		
} // end DTO

















