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
	
	String id = (String)request.getParameter("mid");
	String email = (String)request.getParameter("memail");
	String num = (String)request.getParameter("num");
	String chknum = (String)request.getParameter("chknum");
	
	System.out.println("아이디 : " + id);
	System.out.println("이메일주소 : " + email);
	System.out.println("이메일로 보낸 인증번호 : " + num);
	System.out.println("입력받은 인증번호 : " + chknum);
	
	MemberDAO daao = new MemberDAO();
	int cnt = daao.join(id, email);
	
	System.out.println("리턴 : " + cnt);
	

	if (cnt == (1)) {
%>
	<script>
	confirm("이미 회원가입이 된 정보입니다. 로그인을 이용해주세요.");
	location.href="login.do";
	</script>
<% 
	} else if (cnt == (0)) {
%>	
	<body>
	<!-- sendMail.do 를 통해 메일 보내기 -->
	<div style="display:none;">
	       	<form name="frm2" id="frm2" method="post" action="sendMail.do">
	       		<input type="hidden" name="email" id="email" value="<%= email %>"/>
	       		<input type="hidden" name="id" value="<%= id %>"/>
	       	</form></div>
	</body>
	<script>
		$.ajax({
			url : "sendMail.do",
			type : "post",
			cache : false,
			data : $("form#frm2").serialize(),
			success : function(data, status){
				if(status == "success"){
					alert("메일이 발송되었습니다.");
				}
			}
		});
	</script>
<% 
	} 
%>
	
	</html>








    