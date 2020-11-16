<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="arr" value='<%=(WriteDTO[])request.getAttribute("list") %>'/>
<c:set var="parr" value='<%=(PlaceDTO[])request.getAttribute("place") %>'/>
<c:set var="pno" value='<%=Integer.parseInt(request.getParameter("pno"))%>'/>

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

   <script>
   
      function chkDelete(rno){
         // 삭제 여부, 다시 확인 하고 진행하기
         var r = confirm("삭제하시겠습니까?");
         
         if(r){
            location.href = 'detailpage/deleteOk.do?rno=' + rno + '&pno=<%=Integer.parseInt(request.getParameter("pno")) %>';
         }
      } // chkDelete
   
    </script>
    
 

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



    
<!--------------------------------- section 시작 ----------------------------------------------- -->

    <div class="container section">
        <!--상세 설명 + 상세이미지 + 지도 시작  -->
         <c:forEach var="pelement" items="${parr}" varStatus="status">
        <div class="container">
            <div id="main_area">
                <!-- 명소 디비 가져오기  -->
                      <!-- <div>
                          <button>전체</button><button>${pelement.plabel }</button><span class="title">${pelement.ptitle }</span>
                        </div> -->
                        <!-- Slider -->
                        
                        <div class="row">
                            <div class="col-xs-12" id="slider">
                                <!-- Top part of the slider -->
                                <div class="row">
                                    <!-- 메인 이미지 -->
                                    <div class="col-sm-8" id="carousel-bounding-box">
                                        <div class="carousel slide" id="myCarousel">
                                            <div class="carousel-inner">
                                                <div class="active item" data-slide-number="0">
                                                    <img src="${pelement.pimg }">
                                                </div>
                                               <%--  <div class="item" data-slide-number="1">
                                                    <img src="${pelement.pthumb }">
                                                </div> --%>
                                            </div>
                                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"></span>                                       
                                            </a>
                                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"></span>                                       
                                            </a>                                
                                        </div>
                                    </div> <!-- end 메인 이미지  -->
    
                                    <!-- start 상제정보 & 미니 이미지  div-->
                                    <div class="col-sm-4" id="carousel-text"> 
                                        <!-- start 상세 정보 div-->
                                        <div id="slide-content" style="display: none;"> 
                                            <div id="slide-content-0">
                                                <div class="detail-list">
                                                    <h1 class="my-4 title">${pelement.ptitle }</h1><!-- 명소이름 -->
                                                   <!--  <h1 class="my-3"> 별점
                                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half"></i>4.5
                                                    </h1>  -->
                                                    <!-- <script>
                                                       var pintro = ${pelement.pintro };
                                                       var intro[] = pintro.split(".");   
                                                       var intro1 = intro[1];
                                                    </script> -->
                                                <span class="ssang">"</span><span class="my-3 introduction">${fn:split(pelement.pintro,'.')[0] }</span><span class="ssang">"</span><br> <!-- 정보 -->
                                                <div>주소 : <span class="address">${pelement.paddr }</span></div>
                                                <div>번호 : <span class="phoneno">${pelement.ptel }</span></div>
                                                <div>OPEN : <span class="opentime">${pelement.popentime }</span> </div>
                                                <div>CLOSE : <span class="closetime">${pelement.pclosetime }</span> </div>
                                            </div> <!-- end 상세 정보 div-->
                                              
                                            <!-- 미니 이미지 div -->
                                            <%-- <div class="row bullets" id="miniimg">
                                                <div class="thumbnail"  id="carousel-selector-0">
                                                    <img src="${pelement.pimg }">
                                                </div>
                                                
                                                <div class="thumbnail" id="carousel-selector-1">
                                                    <img src="${pelement.pthumb }">
                                                </div>
                                            </div><!-- end 미니 이미지 div --> --%>
                                        </div>
                                    </div> <!-- end 상제정보 & 미니 이미지  div-->
                                </div>
                            </div>
                        </div>
                    </div><!-- end 메인이미지 & 상세정보 & 미니이미지 -->
        </div>

        <div class="wleh">
            <span><i class="fas fa-map-marker-alt"></i>지도</span>
        </div>
    
        <div id="jejuMap" >${pelement.plat },${pelement.plong }</div>


    </div>
         </c:forEach>
                    
 

 <!----------------------  end  메인 이미지 & 상세 정보 & 미니 이미지 & 지도  -------------  -->                         
<script src="detailpage/detailboot2/js/jquery.min.js"></script> <!-- boot2 -->
<script src="detailpage/detailboot2/bootstrap/js/bootstrap.min.js"></script> <!-- boot2 -->
<script src="detailpage/detailboot2/js/script.min.js"></script> <!-- boot2 -->

<!-----------------------------------  end 지도  --------------------  -->
<!-----------------------------------  start 리뷰   --------------------  -->
        <div class="flqb"><span><i class="far fa-sticky-note"></i>리뷰</span></div>
        <!-- 전체 리뷰 5개씩 페이징, 쓰는란 -->
        <div class="review-wrap-wrap">
            <!-- 리뷰가 없을때 -->
            <c:if test='${fn:length(arr) == 0 }'>
                <div class="reviewNO">
                   리뷰가 없습니다. 리뷰를 등록해주세요. <i class="far fa-frown"></i>
                </div>
            </c:if>
            
            <!-- 게시된 리뷰 목록들  -->
            <c:if test='${fn:length(arr) != 0 }'>
                <c:forEach var="element" items="${arr }" varStatus="status">
                                            <!-- arr : DTO 배열 -->
                    <div class="review-wrap">
                    <!-- <form action="" method="POST"> -->
                        <div class="review">
                            
                            
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
                            <button class="deletebnt" onclick="chkDelete(${element.rno })"><i class="far fa-trash-alt"></i></button> <!-- 삭제-->
                            <button type="button" class="rupdate" onclick="updateBtn(this)"><i class="fas fa-eraser"></i></button> <!-- 수정 -->
                            <button type="button" class="updatechk" onclick="updateOkBtn(this)"><i class="fas fa-check"></i></button>
                            <button type="button" class="updateXX" onclick="updateXX(this)">X</button>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                            </c:choose>
                            <br> <!-- 수정등록 버튼 -->
                            <span class="username">${element.mid }</span>
                            <span class="line">|</span>
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
                                    <div class="img-wrap">
                                         <input name="img${i }" type="hidden" value="${img_src }" />
                                        <div class="img_src">${img_src }</div><input type="button" onclick='$(this).parent().remove()' value="삭제"/>
                                    </div>
                                </c:forEach>
                                    <div class="updatefile-wrap">
                                       <button type="button" id="btnUpdate" onclick="appendBtn($(this).parent().children('#updatefiles'))"><i class="fas fa-camera"></i></button>
                                    <div id="updatefiles"></div>
                                    </div>
                            </div>
                                    
                                    
                        </div>
                       </form>
                        <script>
                                $(".updatechk").hide();
                                $(".updateXX").hide();
                                $(".updateImg").hide();
                                
                                function updateBtn($this) {
                                   if($("button[class=updatechk]:visible").length == 0){
                                     var $review_wrap = $($this).parents(".review-wrap");
                                   
                                   $review_wrap.children("form[name=updateForm]").children(".review").children(".updatechk").show();
                                   $($this).hide();
                                   $review_wrap.children("form[name=updateForm]").children(".reviewImg").children(".imgs").hide();
                                   $review_wrap.children("form[name=updateForm]").children(".reviewImg").children(".updateImg").show();                                   
                                 
                                }
                                }

                                var i = 0;
                         function appendBtn(updatefiles){
                            console.log(updatefiles)
                            $(updatefiles).html($(updatefiles).html() + "<div class='picadd'><input type='file' name = 'upfile" +i+ "'/><button type='button' onclick='$(this).parent().remove()'>삭제</button></div>");
                            i++;
                         }; 
                            </script>
                       <!--  </form> --> <!-- end  리뷰에 게시된 이미지 -->
                    </div> <!-- end 게시된 리뷰 div wrap-->
                </c:forEach>
         </c:if>
           
           <jsp:include page="pagination.jsp">
               <jsp:param value="${requestScope.writePages }" name="writePages"/>
               <jsp:param value="${requestScope.totalPage }" name="totalPage"/>
               <jsp:param value="${requestScope.curPage }" name="curPage"/>   
         </jsp:include>
            <!-- -->
            <div class="Tmrl"><i class="fas fa-edit"></i>리뷰쓰기</div>
            
            
            
               <c:if test='${sessionScope.id eq null }'>
                <div class="reviewNO">
                  	 리뷰쓰기는 로그인이 필요합니다 *^^*
                </div>
            </c:if>
            
            
      		<c:choose>
      		<c:when test="${sessionScope.id ne null }">

            <form name="frm" action='detailpage/writeOk.do?pno=${pno }' method="post" onsubmit="return chkSubmit()"
                enctype="Multipart/form-data">
                
            
                <div class="review-write">
                    <div class="write-wrap">
                      
                      
                        <div class="username"><%= session.getAttribute("id") %></div>
                      <input type="hidden" name="rmno" value="<%= session.getAttribute("mno") %>">
                      <input type="hidden" name="rplace" value="${pno }">
                      <button type="submit" class="review-submit"> 입력 </button>
                
                        <!---------------------  별점  시작 --------------------->
                        <div class="startRadio" >
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="0.5" checked="checked">
                                <span class="startRadio__img"><span class="blind">0.5</span></span>
                            </label>
                        
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="1">
                                <span class="startRadio__img"><span class="blind">1</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="1.5" >
                                <span class="startRadio__img"><span class="blind">1.5</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="2">
                                <span class="startRadio__img"><span class="blind">2</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="2.5">
                                <span class="startRadio__img"><span class="blind">2.5</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="3">
                                <span class="startRadio__img"><span class="blind">3</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="3.5">
                                <span class="startRadio__img"><span class="blind">3.5</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="4">
                                <span class="startRadio__img"><span class="blind">4</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="4.5">
                                <span class="startRadio__img"><span class="blind">4.5</span></span>
                            </label>
                            <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="5">
                                <span class="startRadio__img"><span class="blind">5</span></span>
                            </label>
                       <!--      <label class="startRadio__box">
                                <input type="radio" name="rstar" id="" value="5">
                                <span class="startRadio__img"><span class="blind">5</span></span>
                            </label> -->
                        </div>                        <!-- 별점 끝 -->
                
                
                        <!-- 쓰는 란  -->
                        <textarea class="textwrtie" rows="10" cols="16" name="rcontent" onKeyUp="javascript:fnChkByte(this,'500')" placeholder="리뷰를 남겨주세요!" style="overflow-x: hidden; overflow-wrap: break-word; "></textarea>
                        <span id="byteInfo">0</span><span class="dhqor">/500</span>
                        <br>

                        <button type="button" id="btnAdd"><i class="fas fa-camera"></i></button>
                       
                        <div id="files"></div>

                  <script>
                  
                     var i = 0;
                     $("#btnAdd").click(function(){
                        $("#files").append("<div class='picadd'><input type='file' name = 'upfile" +i+ "'/><button type='button' onclick='$(this).parent().remove()'><i class='far fa-trash-alt'></i></button></div>");
                        i++;
                     });
                     
                  </script>
                    </div>
                </div>
            </form> <!-- end 리뷰 쓰기 박스 끝 -->
            </c:when>
            <c:otherwise>
            <div style="height: 100px;">
            </div>
            </c:otherwise>
            </c:choose>
        </div> <!-- review-wrap-wrap -->
        <!---------------------  end 리뷰   -----------------------------  -->
        
    </div> <!-- section 완전 끝내는 div -->
    <!--------------------------------- end section  ----------------------------------------------- -->
    
    


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



<script src="detailpage/reviewupdate.js" type="text/javascript"></script> <!-- 리뷰수정할때 js-->
<script src="detailpage/detailpage1.js" type="text/javascript"> </script>    <!-- 지도 API.js-->
<!-- 지도 api -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEB_jTOd7HufTs0QET3gfw-MQ2qF4Xf5Q&callback=myMap"></script>

<script src="https://kit.fontawesome.com/bb29575d31.js"></script> <!-- 푸터 아이콘을 위해 이거 추가  -->
<script src="Main/assets/js/slide.js"></script>
    



</html>