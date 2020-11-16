<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	System.out.println("로그아웃");
%>
	<script>
	alert("로그아웃 되었습니다.");
	location.href = "main.do";
	</script>
<% 
	session.invalidate();
%>






















    
    