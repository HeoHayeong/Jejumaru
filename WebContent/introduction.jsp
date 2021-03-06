<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
Z<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JEJUMARU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>JEJUMARU  제주스토리 > 소개</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="Intro/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="Intro/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="Intro/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="Intro/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="Intro/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="Intro/assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
	<link rel="stylesheet" href="Login/css/button.css">

    <link href="Intro/assets/css/culture_history.css" rel="stylesheet" type="text/css">

</head>

<script src="Intro/assets/js/culture_history.js"></script>

<body>
    <nav class="navbar navbar-light navbar-expand-xl fixed-top bg-white clean-navbar">
<div class="container">
<a class="navbar-brand logo" href="main.do">
<img src="Main/assets/img/img/logo.png"></a>
<form action="search.do" method="GET" name="searchFrm" class="needs-validation" novalidate>
<div class="float-left float-md-right mt-0 mt-md-0 search-area">
<button type="submit" class="bg-transparent border-0 p-0"><i class="fas fa-search float-left search-icon"></i></button>
<input class="float-left float-sm-right custom-search-input" type="search" placeholder="검색어를 입력하세요" name="searchVal">
<input type="hidden" name="page" value="1"/>
</div>
</form>
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
                <% if(session.getAttribute("id") == null){ %>
            <a id="login" href="login.jsp" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(1)">로그인</a>
            <a id="join" style="font-size: 14px; color:#8a8a8a !important;" onclick="changeView(2)">회원가입</a>
            <!-- 로그인 되었을 경우 로그아웃 버튼을 보여준다. -->
            <% } else if(session.getAttribute("id") != null){ %>
            <a id="modify" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(4)">비밀번호변경</a>
            <a id="logout" style="font-size: 14px; color:#8a8a8a !important;" onclick="changeView(3)">로그아웃</a>
            <% } else if(session.getAttribute("id") == "admin") { %>
            <!-- 관리자 ID 로그인 -->
            <a id="adminlogin" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(3)">로그아웃</a>
            <% } %>
                </div>
        </div>
    </nav>



    <!-- section 부분 -->
    <section>  

        <div class = "secWrap">
            <a href="#" class="top">
                <div class="topBtn">
                    <p>TOP</p>
                </div>
            </a>

            <div class="titleWrap">
                <div class="cropping">
                    <img src="https://cdn.pixabay.com/photo/2020/05/13/06/37/korea-5166066_1280.jpg">
                </div>
                
                <div class="boxTitle">
                    <h2>제주 이야기</h2>
                </div>
            </div>

            <div class ="cultureWrap">




                <div class="cultureTxt">
                    <h2>제주마루</h2>

                    <div class="cultureImgWrap1">
                        <br>
                        <div class="cultureImg">
                            <img src="https://cdn.pixabay.com/photo/2019/10/30/07/43/jeju-4588910_1280.jpg" alt="">
                        </div>                         
                    </div>
    
                    <br><br>

                    <h4>
                       <!-- <img src="assets/img/checkMark.png" alt=""> -->
                       <i class="fas fa-angle-right">&nbsp</i>
                        마루란?
                    </h4>

                    <div class="txtArea">
                        <p>
                            등성이를 이루는 지붕이나 산 따위의 꼭대기를 일컫는말.
                        </p>
                        <br><br><br><br><br><br><br><br><br><br><br>
                    </div>

                    <hr>
                    <br><br>

                    <div class="cultureImg">
                        <img src="https://cdn.pixabay.com/photo/2015/11/21/04/33/jeju-1054348_1280.jpg" alt="">
                    </div>

                    <h4>
                        <!-- <img src="assets/img/checkMark.png" alt=""> -->
                        <i class="fas fa-angle-right">&nbsp</i>
                        '탐라'가 '제주'로 바뀌다
                    </h4>
                    
                    <div class="txtArea">
                        <p>
                            고대 해양국가 탐라가 독립국으로서의 지위를 잃어버린 것은 고려 숙종 10년(1105)때였다. 
                            고종(1213~1259) 때에 이르러서는
                            
                            이름 또한 '바다 건너 큰 고을'이란 뜻을 지닌 '제주'로 바뀌었다. 
                            고려시대 제주의 대표적인 흔적은 삼별초와 관련된 유적들이다.
                            
                            제주섬은 고려시대 대몽항쟁의 주력군으로 활약했던 삼별초의 마지막 격전지였던 것. 
                            고려정부군과 삼별초군이 번갈아가며 해안에 쌓았던
                            
                            환해장성이 남아 있고, 삼별초군이 주둔했던 항몽유적지가 있다. 
                            삼별초군은 애월에 각종 방어시설뿐만 아니라 궁궐과 관아까지 갖춘 항파두리성을 쌓고
                            
                            여몽연합군에 맞섰지만 고려 원종 14년(1273)에 함락되었다. 
                            그 후 제주는 고려 말 최영 장군이 목호군을 토벌할 때까지 몽골의 지배 속에 놓여 있었다.
                            
                            새별오름, 외돌개, 막숙, 범섬 등이 최영장군과 목호군이 격전을 벌였던 고려시대의 유적지들이다.
                            
                        </p>
                        <br><br>
                    </div>

                    <hr>
                    <br><br>

                    <div class="cultureImg">
                        <img src="https://cdn.pixabay.com/photo/2018/08/05/15/41/beach-3585794_1280.jpg" alt="">
                    </div>

                    

                    <h4>
                        <!-- <img src="assets/img/checkMark.png" alt=""> -->
                        <i class="fas fa-angle-right">&nbsp</i>
                        제주마루는
                    </h4>

                    <div class="txtArea">
                        <p>
                            누구나 아는 핫 플레이스부터 감성충전 힐링여행지까지, 다채롭고 아름다운 섬 제주의 구석구석을 소개하는 사이트입니다.
                             제주마루는 제주관광공사에서 제공받은 정보를 바탕으로 정확하고 신뢰성 있는 제주도 관광정보를 제공합니다.
                             제주마루 회원들의 생생한 리뷰와 평가를 참고하여 나만의 여행 일정을 만들어 보세요!<br>
                            상쾌한 바람과 깨끗한 바다가 기다리는 제주도로 혼저옵서예~
                            
                        </p>
                    </div>

                    
                </div>
                
                <hr class = "hr3">
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
    <script src="Intro/assets/js/jquery.min.js"></script>
    <script src="Intro/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="Intro/assets/js/script.min.js"></script>
    <script src="Main/assets/js/slide.js"></script>
</body>

</html>