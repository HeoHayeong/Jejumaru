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
	String id = request.getParameter("user");
	String pw = request.getParameter("pass");
	System.out.println("아이디 : " + id);
	System.out.println("비번 : " + pw);
	
	MemberDAO daao  = new MemberDAO();
	int cnt = daao.login(id, pw);	// dao 내의 login 메소드 호출 후 리턴값 저장
	int mno = daao.mno();
	System.out.println("리턴 : " + cnt);
	
	
	if(cnt == (1)) {
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	session.setAttribute("mno", mno);
	System.out.println("회원번호 : " + mno);
	System.out.println("로그인 성공");
%>
	<script>
	alert(<%= id %> + "님 반갑습니다!");
	<% response.sendRedirect("main.do"); %>
	</script>
<% 
	} else if(cnt == (0)) { 
	System.out.println("로그인 실패");
%>
	<script>
	alert("아이디 또는 비밀번호를 다시 확인해주세요.");
	history.back();
	</script>
<%
	} 
%>








    