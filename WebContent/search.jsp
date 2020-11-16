<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JEJUMARU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>JEJUMARU</title>
    <link rel="stylesheet" href="List/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="List/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="List/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="List/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="List/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="List/assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="List/list/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="List/list/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	<link rel="stylesheet" href="List/list/css/common.css"/>
	<link rel="stylesheet" href="Login/css/button.css">
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
    <section class="py-5">
        <div class="container">
            <div class="filtr-controls text-center lead text-uppercase mb-3">
            	'<b>${param.searchVal }</b>' 에 대한 검색결과입니다.
            </div>
            <div class="row filtr-container">
            	<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>
			
			<c:otherwise>
				<c:forEach var="dto" items="${list }">	<%-- request.getAttribute("list") --%>
                <div class="col-md-6 col-lg-4 filtr-item" data-category="1,2,3">
                    <div class="bg-light border rounded shadow card" data-bs-hover-animate="pulse"><a href="detailJspPage.do?pno=${dto.pno }&page=1"><img class="card-img-top" src="${dto.pthumb }"></a>
                        <div class="card-body" onclick="location.href='detailJspPage.do?pno=${dto.pno }&page=1'" style="cursor: pointer;">
                            <h3 class="card-title" style="font-family: Antic, sans-serif;color: rgb(81,87,94);font-size: 18px;text-align: center;">${dto.ptitle }</h3>
                            <h5 class="card-sub-title" style="font-family: Antic, sans-serif;color: orange;text-align: center;font-size: 15px;">${fn:split(dto.paddr,' ')[1] } ${fn:split(dto.paddr,' ')[2] }</h5>
                            <p class="card-text" style="font-family: Antic, sans-serif;color: rgb(81,87,94);"></p><p id="lorem" style="text-align: center;">${dto.ptel }</p></div>
                        </div>
                </div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
                
            </div>
        </div>
    </section>
    <section style="margin-top: 10px;">
        <jsp:include page="pagination.jsp">
					<jsp:param value="${requestScope.writePages }" name="writePages"/>
					<jsp:param value="${requestScope.totalPage }" name="totalPage"/>
					<jsp:param value="${requestScope.curPage }" name="curPage"/>	
		</jsp:include>
    </section>
    
    
           
    <a href="#" class="top">
        <div class="topBtn">
           <img class = "topimg" src="QandA/assets/img/top_arrow.png">
        </div>
     </a>
    
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
    <script src="List/category.js"></script>
    <script src="https://kit.fontawesome.com/bb29575d31.js"></script>
    <script src="List/assets/js/jquery.min.js"></script>
    <script src="List/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="List/assets/js/script.min.js"></script>
    <script src="List/assets/js/slide.js"></script>
    <script src="List/list/bootstrap/js/bootstrap.min.js"></script>
    <script src="List/list/js/script.min.js"></script>
</body>

</html>