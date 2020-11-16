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
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<% 
	
	String id = (String)request.getAttribute("id");
	/*
	String[] result = pw.split("");
	for(int i = 0; i < result.length-4; i++){
		result[i]="*";
	}
	*/
	String name = (String)request.getParameter("mname");
	String email = (String)request.getParameter("memail");
	
	
	System.out.println("보내질 아이디 : " + id);
	System.out.println("이름 : " + name);
	System.out.println("이메일주소 : " + email);

	if (id == null) {
%>
	<script>
	alert("존재하지 않는 정보입니다. 다시 확인 해 주세요.");
	historys.back();
	</script>
<% 
	} else if (id != null) {
%>	
	<body>
	<div style="display:none;">
	       	<form name="frm2" id="frm2" method="post" action="sendIdMail.do">
	       		<input type="hidden" name="email" id="email" value="<%= email %>"/>
	       		<input type="hidden" name="id" value="<%= id %>"/>
	       	</form></div>
	</body>
	<script>
		$.ajax({
			url : "sendIdMail.do",
			type : "post",
			cache : false,
			data : $("form#frm2").serialize(),
			success : function(data, status){
				if(status == "success"){
					alert("메일이 발송되었습니다.");
					location.href="login.do";
				}
			}
		});
	</script>
<% 
	} 
%>
	
	</html>




    