<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>제주마루</title>
<link rel="stylesheet" href="Main/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
<link rel="stylesheet" href="Main/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="Main/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="Main/assets/fonts/simple-line-icons.min.css">
<link rel="stylesheet" href="Main/assets/fonts/fontawesome5-overrides.min.css">
<link rel="stylesheet" href="Main/assets/css/styles.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
<link rel="stylesheet" href="Main/event/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="Main/event/fonts/font-awesome.min.css">
<link rel="stylesheet" href="Main/event/css/styles.min.css">
<link rel="stylesheet" href="Login/css/button.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.2.0/aos.css">
<link rel="stylesheet" href="Main/style.css"><link rel="stylesheet" href="Login/css/button.css">
</head>
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
<a id="login" style="margin-right: 10px; font-size: 14px; color:#8a8a8a !important;" onclick="changeView(1)">로그인</a>
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
<section style="text-align: center; max-height: calc(100vh - 100px); overflow: hidden; margin-top: 100px;">
<video style="width: 100vw;" autoplay muted loop id="myVideo">
<source src="https://storage.googleapis.com/null_jeju/%EC%84%9C%EA%B7%80%ED%8F%AC%20%EA%B4%80%EA%B4%91%ED%99%8D%EB%B3%B4%EC%98%81%EC%83%81%20%EB%93%9C%EB%A1%A05%EB%B6%84-wo.gl.mp4#t=8,288">
</video>
</section>
<section>
<div class="container">
<div class="row">
<div class="col-8">
    <h2 class="mb-3 text-warning">추천 플레이스</h2>
</div>
<div class="col-4 text-right">
    <a class="btn btn-warning mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev" style="border: none;">
    <i class="fas fa-angle-left" style="width: 100%; height: 100%; color: white;"></i>
    </a>
    <a class="btn btn-warning mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next" style="border: none;">
    <i class="fas fa-angle-right" style="width: 100%; height: 100%; color: white;"></i>
    </a>
</div>
<div class="col-12">
    <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">

        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
				<c:forEach var="dto" items="${recommand }" begin="0" end="0">
                <div class="col-lg-4 mb-3">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
				<c:forEach var="dto" items="${recommand }" begin="1" end="2">
                <div class="col-lg-4 mb-3 d-none d-lg-block">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                <c:forEach var="dto" items="${recommand }" begin="3" end="3">
                <div class="col-lg-4 mb-3">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
				<c:forEach var="dto" items="${recommand }" begin="4" end="5">
                <div class="col-lg-4 mb-3 d-none d-lg-block">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
				<c:forEach var="dto" items="${recommand }" begin="6" end="6">
                <div class="col-lg-4 mb-3">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
				<c:forEach var="dto" items="${recommand }" begin="7" end="8">
                <div class="col-lg-4 mb-3 d-none d-lg-block">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                            </div>
                </div>
                </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<div class="container">
<div class="row space-rows">
<div class="col-8 text-left event-head" style="margin-bottom: -20px;">
<h2 class="mb-3 text-warning event-title">공지사항</h2>
</div>
<div class="col-4 text-right" style="margin-bottom: -20px; padding: 0;">
<a class="btn mb-3 mr-1" href="notice_list.do" role="button" style="width: 40px; height: 40px; border: none;">
<i class="fas fa-plus" style="width: 100%; height: 100%; color: orange; font-size: 20px;"></i>
</a>
</div>
<div class="col-12">
<div class="row">
<div class="col col-lg-4 event-box">
<img class="card cards-shadown cards-hover event-img" src="Main/event/img/event1.png" data-aos="fade" data-aos-duration="950">
</div>
<div class="col col-lg-4 event-box d-none d-lg-block">
<img class="card cards-shadown cards-hover event-img" src="Main/event/img/event2.png" data-aos="fade" data-aos-duration="950">
</div>
<div class="col col-lg-4 event-box d-none d-lg-block">
<img class="card cards-shadown cards-hover event-img" src="Main/event/img/event3.png" data-aos="fade" data-aos-duration="950">
</div>
</div>
</div>
</div>
</div>
</section>
<article>
<div class="container text-center">
    <div class="row mx-auto my-auto">
        <div id="myCarousel" class="carousel slide w-100" data-ride="carousel" data-interval="3000">
            <div class="carousel-inner w-100" role="listbox">
                <div class="carousel-item active">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="http://www.jeju.go.kr/index.htm"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/201803/05/642142e9-8151-4b28-aa32-5a50327f1f2e.png"></a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="https://ijto.or.kr/korean/"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/201803/05/a7f18930-e495-435d-8378-7f70be4da0a8.png"></a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="http://www.visitjeju.or.kr/"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/201803/05/24a62ad1-98a7-4a3d-9540-4e1553d84dfb.png"></a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="http://jeju.kma.go.kr/"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/201803/05/dca087bf-158b-43bb-a844-e0d0c08e86cf.png"></a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="http://www.visitkorea.or.kr/intro.html"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/201908/27/58fe78d1-365f-45f1-9d67-93096ecf6279.png"></a>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                        <a href="http://www.kcg.go.kr/jejucgh/main.do"><img class="img-fluid" src="https://api.cdn.visitjeju.net/imageResource/file/202007/10/725465d7-5785-4749-af8b-33eb523d2604.png"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</article>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="Main/assets/js/jquery.min.js"></script>
<script src="Main/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="Main/event/js/script.min.js"></script>
<script src="Main/event/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.2.0/aos.js"></script>
<script src="Main/assets/js/script.min.js"></script>
<script src="Main/assets/js/slide.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="Main/carousel.js"></script>
<script src="Main/main.js"></script>
</body>

</html>