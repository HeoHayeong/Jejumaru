<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.jeju.mail.Mail" %>
<%@ page import="com.lec.beans.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dao" class="com.lec.beans.MemberDAO"/> 
<%
	request.setCharacterEncoding("utf-8"); // 한글인코딩! post!
%>
<jsp:useBean id="dto" class="com.lec.beans.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>LOGIN</title>

<meta name="viewport" content="Login/width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Login/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="Login/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="Login/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="Login/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="Login/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="Login/assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
  	<link rel="stylesheet" href="Login/css/button.css">

        <!-- Bootstrap core CSS -->
 <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">  
 <!-- Custom styles for this template -->
        <link rel="icon" href="Login/images/logo.png"/>
        <link href="Login/css/style.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Login/login.css?ver=1">
</head>
<body>
    <nav class="navbar navbar-light navbar-expand-xl fixed-top bg-white clean-navbar">
        <div class="container">
            <a class="navbar-brand logo" href="main.do">
                <img src="Login/assets/img/img/logo.png"></a>
            <div class="search float-left float-md-right mt-0 mt-md-0 search-area">
                <i class="fas fa-search float-left search-icon"></i>
                <input class="float-left float-sm-right custom-search-input" type="search" placeholder="검색어를 입력하세요"></div>
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
        <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange;">제주스토리</a>
        <div class="dropdown-menu" style="border-style: none; background-color: orange;">
            <a class="dropdown-item" href="introduction.jsp" style="color: white;">소개</a>
            <a class="dropdown-item" href="culture_history.jsp" style="color: white;">문화와 역사</a>
        </div>
    </li>
    <li class="nav-item dropdown">
	     <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange;">제주플레이스</a>
	     <div class="dropdown-menu" style="border-style: none; background-color: orange;">
	         <a class="dropdown-item" href="list.do?cate=all&page=1" style="color: white;">전체</a>
	         <a class="dropdown-item" href="list.do?cate=jeju&page=1" style="color: white;">제주시</a>
	         <a class="dropdown-item" href="list.do?cate=seo&page=1" style="color: white;">서귀포시</a>
	         <a class="dropdown-item" href="list.do?cate=island&page=1" style="color: white;">섬 속의 섬</a>
	     </div>
	 </li>
    <li class="nav-item dropdown">
                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange;">나의여행</a>
	                    <div class="dropdown-menu" style="border-style: none; background-color: orange;">
		                  <c:choose>
		                  <c:when test="${sessionScope.mno ne null}">
		                  <form name="mymno" id="mymno" action="My_write_list.do" method="post">
			                  <input type="hidden" name="mno" value="<%= session.getAttribute("mno") %>"/>
        	                    <a class="dropdown-item" href="javascript:void()" onclick="document.getElementById('mymno').submit();" style="color: white;">내가 쓴 Q&A</a>
       		                </form>
		                  <form name="myremno" id="myremno" action="myreview.do" method="post">
			                  <input type="hidden" name="mno" value="<%= session.getAttribute("mno") %>"/>
	                            <a class="dropdown-item" href="javascript:void()" onclick="document.getElementById('myremno').submit();" style="color: white;">내가 쓴 리뷰</a>
       		                </form>
       		                </c:when>
       		                <c:otherwise>
        	                    <a class="dropdown-item" onclick="alert('로그인 후 이용하실 수 있습니다.');" style="color: white;">내가 쓴 Q&A</a>
	                            <a class="dropdown-item" onclick="alert('로그인 후 이용하실 수 있습니다.');"  style="color: white;">내가 쓴 리뷰</a>
       		                
       		                </c:otherwise>
       		                </c:choose>
                  		 </div>
                    </li>
    <li class="nav-item dropdown" style="margin-right: 0px;">
                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange;">고객센터</a>
                        <div class="dropdown-menu" style="border-style: none; background-color: orange;">
                            <a class="dropdown-item" href="qanda_list.do" style="color: white;">Q&A</a>
                            <a class="dropdown-item" href="notice_list.do" style="color: white;">공지사항</a>
                        </div>
                    </li>
         </ul>
         <a id="login" href="#" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(1)">로그인</a>
         <a id="join" href="#" style="font-size: 14px; color:#8a8a8a !important;" onclick="changeView(2)">회원가입</a>
		</div>
    	  </div>
  </nav>
  <div class="clear"></div>
<section>
  <div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
        <div class="login-form">
            <div class="sign-in-htm">
            <form name="frm1" id="frm1" action="loginOk.jsp" method="post">
           <div class="group">
               <label for="user" class="label" style="margin-top: 100px;">ID</label>
               <input id="user" type="text" name ="user" class="input" placeholder="아이디 입력">
           </div>
           <div class="group">
               <label for="pass" class="label">Password</label>
               <input id="pass" type="password" name ="pass" class="input" placeholder="비밀번호 입력">
           </div>
           <div class="group" style="margin: 30px auto;">
             <button type="submit" class="button" onclick="return logSubmit()">로그인</button>
           </div>
           </form>
           <div class="hr"></div>
           <div class="foot-lnk">
             <a href="find.jsp" style="margin-bottom: 10px;">아이디 또는 비밀번호 찾기</a><br><br>
           </div>
       </div>
       <!-- sendMail.do 를 통해 메일 보내기 -->
       <div style="display:none;">
       	<form name="frm3" id="frm3" action="sendMail.do" method="post">
       		<input type="hidden" name="email"/>
       		<input type="hidden" name="num"/>
       	</form>
       </div>
       
       <div class="sign-up-htm">
       <form name="frm2" id="fm" action="joinOk.do" class="needs-validation" method="post" onsubmit="return chkSubmit()" novalidate>
           <div class="group">
               <label for="user" class="label" style="margin-top: 30px;">ID</label>
               <input id="user" type="text" name="mid" class="input form-control" placeholder="아이디 입력" required>
           		      <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        필수 입력 사항입니다
				      </div>
           </div>
           <div class="group">
             <label for="name" class="label">Username</label>
             <input id="name" type="text" name="mname" class="input form-control" placeholder="이름 입력" required>
           		      <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					    	  
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        필수 입력 사항입니다
				      </div>
         </div>
           <div class="group">
               <label for="pass" class="label">Password</label>
               <input id="pass" type="password" name="mpw" class="input form-control" placeholder="비밀번호 입력" required>
           		       <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					    	  
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        필수 입력 사항입니다
				      </div>
           </div>
           <div class="group">
               <label for="pass" class="label">Repeat Password</label>
               <input id="passchk" type="password" name="mpwchk" class="input form-control" placeholder="비밀번호 확인" required>
           		       <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					    	  
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        필수 입력 사항입니다
				      </div>
           </div>
           <div class="group">
               <label for="email" class="label">Email Address</label>
               <input id="email" type="text" name="memail" class="input form-control" placeholder="이메일 입력" required>
           		      <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					    	  
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        필수 입력 사항입니다
				      </div>
           </div>
           <div class="group">
             <button type="button" class="button" onclick="sendmail()">이메일 인증</button>
         </div>
         <div class="group">
             <label for="chknum" class="label" style="margin-top: 30px;">Certification Number</label>
             <input id="chknum" type="text" name="chknum" class="input form-control" placeholder="인증번호 입력" required>
           		     <div class="valid-feedback" style="height: 18px; font-size: 13px !important; font-weight:lighter !important;">
					    	  
					      </div>
					      <div class="invalid-feedback" style="font-size: 13px !important; font-weight:lighter !important;">
					        받은 이메일을 확인 해 주세요
				      </div>
         </div>
         <input type="hidden" name="num"/>
         <div class="group" style="margin: 30px auto;">
             <button type="submit" class="button" id="button" onclick="check()" >회원가입</button>
         </div>
         </form>
         <div class="hr"></div>
         <div class="foot-lnk">
             <a href="find.jsp" style="margin-bottom: 10px;">아이디 또는 비밀번호 찾기</a><br><br>
              </div>
            </div>
        </div>
    </div>
</div>
</section>
  <footer id="footerpad" style="background-color: lightgray;">
 <div class="container">
     <div class="row">
         <div class="col-md-8 col-lg-8 mx-auto">
             <ul class="list-inline text-center">
                 <li class="list-inline-item" ><a href="#"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x" style="color: orange;"></i><i class="fa fa-facebook fa-stack-1x fa-inverse"></i></span></a></li>
                 <li class="list-inline-item"><a href="#"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x" style="color: orange;"></i><i class="fa fa-twitter fa-stack-1x fa-inverse"></i></span></a></li>
                 <li class="list-inline-item"><a href="#"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x" style="color: orange;"></i><i class="fa fa-instagram fa-stack-1x fa-inverse"></i></span></a></li>
             </ul>
             <p class="copyright text-muted text-center" style="font-size: 10px;">Copyright © JEJUMARU, All rights reserved.<br></p>
                </div>
            </div>
        </div>
    </footer>
    <script src="Login/assets/js/jquery.min.js"></script>
    <script src="Login/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="Login/assets/js/script.min.js"></script>
    <script src="Login/login.js"></script>
    <script src="Main/assets/js/slide.js"></script>
</body>

</html>