<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@page import="com.lec.beans.MemberDAO"%>
<jsp:useBean id="dao" class="com.lec.beans.MemberDAO"/> 
<%
 	request.setCharacterEncoding("utf-8"); // 한글인코딩! post!
 %>
<jsp:useBean id="dto" class="com.lec.beans.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/> 
    
<%
     	String id = ((String)session.getAttribute("id"));
     	
     	MemberDAO daao = new MemberDAO();
     	daao.deleteByMid(id);
     	
     	System.out.println("삭제할 아이디 : " + id);
     %>
	<script>
	alert("탈퇴가 성공적으로 완료되었습니다. 이용해주셔서 감사합니다.");
	<% session.invalidate(); %>
	location.href="main.do";
	</script>
