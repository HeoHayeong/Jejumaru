<%@page import="com.lec.beans.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="dao" class="com.lec.beans.MemberDAO"/> 
<%
 	request.setCharacterEncoding("utf-8"); // 한글인코딩! post!
 %>
<jsp:useBean id="dto" class="com.lec.beans.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String id = request.getParameter("mid");
	String pw = request.getParameter("mpw");
	String pwchk = request.getParameter("mpwchk");
	String name = request.getParameter("mname");
	String email = request.getParameter("memail");
	String chknum = request.getParameter("chknum");
	String num = request.getParameter("num");

	System.out.println("비번 : " + pw);
	System.out.println("비번확인 : " + pwchk);
	System.out.println("이름 : " + name);
	System.out.println("이메일주소 : " + email);
	System.out.println("이메일로 보낸 인증번호 : " + num);
	System.out.println("입력받은 인증번호 : " + chknum);
	
	MemberDAO daao  = new MemberDAO();
	int cnt = daao.insert(id, pw, name, email);	// dao 내의 login 메소드 호출 후 리턴값 저장
	
	System.out.println("리턴 : " + cnt);
	
 	if (id.equals(null) || pw.equals(null) || pwchk.equals(null) || name.equals(null) || email.equals(null)) {
%>
	<script>
	alert("필수 입력 사항입니다.");
	history.back();
	</script>
<%
	} else if (!num.equals(chknum) && chknum.equals(null)) {
%>
	<script>
	alert("인증번호가 다릅니다.");
	history.back();
	chknum.focus();
	</script>
<%
	} else if ((cnt == (0))) {
%>
	<script>
	alert("회원 정보가 존재합니다. 로그인을 이용해주세요.");
	location.href="login.do";
	</script>
<%
	} else if ((cnt == (1)) && num.equals(chknum) && !chknum.equals(null)) {
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	System.out.println("회원가입 성공");
%>
	<script>
	alert("회원가입이 성공적으로 완료되었습니다.");
	location.href="main.do";
	</script>
<%
	} 
%>








    