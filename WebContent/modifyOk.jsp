<%@page import="com.lec.beans.MemberDAO"%>
<%@page import="com.lec.beans.MemberDTO"%>
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
	String id = ((String)session.getAttribute("id"));
	String pw = ((String)session.getAttribute("pw"));
	String mid = request.getParameter("mid");
	String mpw1 = request.getParameter("mpw");
	String mpw2 = request.getParameter("mompwchk");
	
	MemberDAO daao  = new MemberDAO();
	daao.update(id, mpw1);

	System.out.println("접속아이디 : " + id);
	System.out.println("기존비번 : " + pw);
	System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	System.out.println("아이디 : " + mid);
	System.out.println("입력비번 : " + mpw1);
	System.out.println("입력비번 : " + mpw2);

	

	if (pw.equals(mpw1) && pw.equals(mpw2)) {
%>
	<script>
	alert("기존의 비밀번호와 같습니다. 다시 입력 해 주세요.");
	historys.back();
	</script>
<%
	} else if (!mpw1.equals(mpw2)) {	
%>
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	historys.back();
	</script>
<%
	} else if (!pw.equals(mpw1)) {	
%>
	<script>
	alert("비밀번호 변경이 완료되었습니다.");
	<% session.setAttribute("pw", mpw1); %>
	location.href="main.do";
	</script>
<%
	}
%>