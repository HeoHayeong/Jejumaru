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
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	String mpw = (String)request.getParameter("mpw");
	
	MemberDAO daao  = new MemberDAO();
	int cnt = daao.login(id, pw);	// dao 내의 login 메소드 호출 후 리턴값 저장
	
	if (pw.equals((String)request.getParameter("mpw"))) {
	//response.sendRedirect("list.jsp"); 	// 로그인 성공 시 메인으로 이동
	System.out.println("접속아이디 : " + id);
	System.out.println("접속비번 : " + pw);
	System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	System.out.println("입력비번 : " + mpw);
%>
	<script>
	<% response.sendRedirect("modify.do"); %>
	</script>
<% 
	} else if (!pw.equals((String)request.getParameter("mpw"))) { 
%>
	<script>
	alert("비밀번호를 다시 확인해주세요.");
	history.back();
	</script>
<%
	} 
%>








    