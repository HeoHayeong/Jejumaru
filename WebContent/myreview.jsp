<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JEJUMARU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>JEJUMARU</title>


    <link rel="stylesheet" href="detailpage/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="detailpage/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="detailpage/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="detailpage/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="detailpage/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="detailpage/assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
  <link rel="stylesheet" href="Login/css/button.css">
	<link rel="stylesheet" href="List/list/css/common.css"/>
	
	<link href="detailpage/detailpage.css?<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">


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


<div class="titleh2" style="margin-top:130px;">
	                <h2>나의 리뷰</h2>
	                <hr class="hr3color">
	            </div>
    
<div class="flqb"><span><i class="far fa-sticky-note"></i>리뷰</span></div>
        <!-- 전체 리뷰 5개씩 페이징, 쓰는란 -->
        <div class="review-wrap-wrap" style="margin-left: 23%;">
            <!-- 리뷰가 없을때 -->
            <c:if test='${fn:length(arr) == 0 }'>
                <div class="reviewNO">
                   리뷰가 없습니다. 리뷰를 등록해주세요. <i class="far fa-frown"></i>
                </div>
            </c:if>
            
            <!-- 게시된 리뷰 목록들  -->
            <c:if test='${fn:length(arr) != 0 }'>
                <c:forEach var="element" items="${arr }" varStatus="status">
                    <div class="review-wrap" style="width: 70%">
                        <div class="review">
                        <div class="myplace" style="font-size: 26px; cursor: pointer; margin-bottom: 5px;" onclick="location.href='detailJspPage.do?pno=${element.rplace}'">${element.ptitle }</div>
                            <span class="star" rstar="${element.rstar }">
                                <c:choose>
                                    <c:when test="${element.rstar == 0.5}">
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>0.5</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 1}">
                                        <i class="fas fa-star"></i>
                                        <span>1.0</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 1.5}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>1.5</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 2}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>2.0</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 2.5}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>2.5</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 3}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>3.0</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 3.5}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>3.5</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 4}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>4.0</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 4.5}">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>4.5</span>
                                    </c:when>
                                    <c:when test="${element.rstar == 5}">
                                       
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>5.0</span>
                                    </c:when>
                               </c:choose>   
                            </span> <!-- end 등록한 별점 모양-->
                            <c:choose>
                            <c:when test="${element.mid eq sessionScope.id }">
                            
                            </c:when>
                       
                            </c:choose>
                            <br> <!-- 수정등록 버튼 -->
                            
                            <span class="regdate">${element.rdate }</span>      
                            
                        </div> <!-- end 리뷰 목록에 이름, 날짜, 별점, 수정버튼 삭제버튼 div -->                                   
                        
                        <form name="updateForm" id="updateForm" action="detailpage/updateOk.do?pno=${pno }" method="POST" 
                        enctype="Multipart/form-data" accept-charset="UTF-8">
                        	<input name="rno" type="hidden" id="hhyrno" value="${element.rno }" />
                        
                        	<div class="review-text" style="white-space: pre-wrap;">${element.rcontent }</div> <!-- 리뷰쓴 내용  -->
                        
	                        <div class="reviewImg" style="width: 100%"> <!-- 게시된 이미지 -->
	                            <div class="imgs">
	                               <c:if test="${element.rimg != null }">
	                                   <c:forEach var="img_src" items="${element.rimg }">
	                                       <img style=" height: auto" src="${img_src }" />
	                                   </c:forEach>
	                               </c:if>
	                            </div>
	                            <% int i = 1; %>
	                            <div class="updateImg">
	                               <c:forEach var="img_src" items="${element.rimg }">
	                                  <c:set var="i" value="<%= i++ %>" />
	                                </c:forEach>
	                            </div>
	                        </div>
                       	</form>
                    </div> 
                </c:forEach>
         	</c:if>
           
           <%-- <jsp:include page="pagination.jsp">
               <jsp:param value="${requestScope.writePages }" name="writePages"/>
               <jsp:param value="${requestScope.totalPage }" name="totalPage"/>
               <jsp:param value="${requestScope.curPage }" name="curPage"/>   
         </jsp:include> --%>
           
        </div> <!-- end review-wrap-wrap -->

    <a href="#" class="top">
        <div class="topBtn">
           <img class = "topimg" src="QandA/assets/img/top_arrow.png">
        </div>
     </a>

    <!--- 푸터 ---------------------------------------------------------------------------------------------->
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
    <script src="detailpage/assets/js/jquery.min.js"></script>
    <script src="detailpage/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="detailpage/assets/js/script.min.js"></script>
</body>


<script src="detailpage/reviewupdate.js?<%=System.currentTimeMillis() %>" type="text/javascript"></script> <!-- 리뷰수정할때 js-->
<script src="detailpage/detailpage1.js" type="text/javascript"> </script>    <!-- 지도 API.js-->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script> <!-- 푸터 아이콘을 위해 이거 추가  -->
<script src="Main/assets/js/slide.js"></script>

</html>


    


