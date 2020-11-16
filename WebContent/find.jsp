<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.jeju.mail.*" %>
<%@ page import="com.lec.beans.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>ID/PW FIND</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="Find/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="Find/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="Find/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="Find/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="Find/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="Find/assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:600'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <!-- Bootstrap core CSS -->
       <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i" rel="stylesheet">  
       <!-- Custom styles for this template -->
        <link rel="icon" href="Find/images/logo.png"/>
        <link href="Find/css/style.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Find/find.css?ver=1">
        <link rel="stylesheet" href="Login/css/button.css">
</head>
<body>
    <nav class="navbar navbar-light navbar-expand-xl fixed-top bg-white clean-navbar">
        <div class="container">
            <a class="navbar-brand logo" href="main.do">
                <img src="Find/assets/img/img/logo.png"></a>
            <div class="search float-left float-md-right mt-0 mt-md-0 search-area">
                <i class="fas fa-search float-left search-icon"></i>
                <input class="float-left float-sm-right custom-search-input" type="search" placeholder="검색어를 입력하세요"></div>
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange !important;">제주스토리</a>
                       <div class="dropdown-menu" style="border-style: none; background-color: orange;">
                           <a class="dropdown-item" href="#" style="color: white;">소개</a>
                           <a class="dropdown-item" href="#" style="color: white;">문화와 역사</a>
                       </div>
                   </li>
                   <li class="nav-item dropdown">
                       <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange !important;">제주플레이스</a>
                       <div class="dropdown-menu" style="border-style: none; background-color: orange;">
                           <a class="dropdown-item" href="#" style="color: white;">제주시</a>
                           <a class="dropdown-item" href="#" style="color: white;">서귀포시</a>
                       </div>
                   </li>
                   <li class="nav-item dropdown">
                       <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange !important;">나의여행</a>
                       <div class="dropdown-menu" style="border-style: none; background-color: orange;">
                           <a class="dropdown-item" href="#" style="color: white;">찜 목록</a>
                           <a class="dropdown-item" href="#" style="color: white;">내가 쓴 글</a>
                           <a class="dropdown-item" href="#" style="color: white;">회원정보수정</a>
                       </div>
                   </li>
                   <li class="nav-item dropdown" style="margin-right: 0px;">
                       <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#" style="font-size: 16px; color:orange !important;">고객센터</a>
                       <div class="dropdown-menu" style="border-style: none; background-color: orange;">
                           <a class="dropdown-item" href="#" style="color: white;">Q&A</a>
                           <a class="dropdown-item" href="#" style="color: white;">공지사항</a>
                       </div>
                   </li>
               </ul>
         <a id="login" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(1)">로그인</a>
         <a id="join" style="font-size: 14px; color:#8a8a8a !important;" onclick="changeView(2)">회원가입</a>
		</div>
    	  </div>
    	  </nav>
   <div class="clear"></div>
 <section>
   <div class="login-wrap">
     <div class="login-html">
         <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">ID 찾기</label>
         <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">PW 찾기</label>
         <div class="login-form">

             <div class="sign-in-htm">
    		 <form name="frm1" action="idfindOk.do" method="post" onsubmit="return chkSubmit()">
               <div class="group">
                   <label for="name" class="label" style="margin-top: 30px;">Username</label>
                   <input id="name" type="text" name="mname" class="input" placeholder="이름 입력">
               </div>
                 <div class="group">
                     <label for="email" class="label">Email Address</label>
                     <input id="email" type="email" name="memail" class="input" data-type="email" placeholder="이메일 입력">
                 </div>
                 <div class="group">
                     <button type="submit" class="button">찾기</button>
                     <!-- 찾기 누르면 이메일로 ID/PW를 보낸다. ID는 전체공개, PW는 뒤에 4자리 ****처리 -->
                 </div>
               </form>
                 <div class="hr"></div>
                 <div class="foot-lnk">
                   <a href="login.do">회원가입</a>
                   <a href="login.do" style="margin-left: 10px;">로그인</a>
               </div>
             </div>
             
                  <!-- sendPwMail.do 를 통해 메일 보내기 -->
		        
		       	
             <div class="sign-up-htm">
              <form name="frm3" action="pwfindOk.do" method="post" onsubmit="return chkSubmit()">
                 <div class="group">
                     <label for="user" class="label" style="margin-top: 30px;">ID</label>
                     <input id="user" type="text" name="mid" class="input" placeholder="아이디 입력">
                 </div>
                 <div class="group">
                   <label for="name" class="label">Username</label>
                   <input id="name" type="text" name="mname" class="input" placeholder="이름 입력">
               </div>
                 <div class="group">
                     <label for="email" class="label">Email Address</label>
                     <input id="email" type="text" name="memail" class="input" placeholder="이메일 입력">
                 </div>
                 <div class="group">
                     <button type="submit" class="button" >찾기</button>	
                     <!-- 찾기 누르면 이메일로 ID/PW를 보낸다. ID는 전체공개, PW는 뒤에 4자리 ****처리 -->
                 </div>
		        </form>
                 <div class="hr"></div>
                 <div class="foot-lnk">
                   <a href="login.do">회원가입</a>
                   <a href="login.do" style="margin-left: 10px;">로그인</a>
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
    <script src="Find/assets/js/jquery.min.js"></script>
    <script src="Find/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="Find/assets/js/script.min.js"></script>
    <script src="Find/find.js"></script>
    <script src="Main/assets/js/slide.js"></script>
</body>

</html>
