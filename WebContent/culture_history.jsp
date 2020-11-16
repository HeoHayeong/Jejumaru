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
    <title>JEJUMARU  제주스토리 > 문화와 역사</title>

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
                <a></a>
                <div class = "secWrap">
                    <a href="#" class="top">
                        <div class="topBtn">
                            <p>TOP</p>
                        </div>
                    </a>

                    <div class="titleWrap">
                        <div class="cropping">
                            <img src="https://cdn.pixabay.com/photo/2013/12/08/06/42/stone-224986_1280.jpg">
                        </div>
                        
                        <div class="boxTitle">
                            <h2>문화와 역사</h2>
                        </div>
                    </div>

                    <div class ="cultureWrap">
                        <h2>제주의 문화</h2>
                        
                        
                        <!-- 이미지 div -->

                        
                            <div class="cultureImgWrap1">
                                <br>
                                <div class="cultureImg">
                                    <img src="https://cdn.pixabay.com/photo/2017/09/05/14/38/jeju-2717838_1280.jpg" alt="">
                                </div>                  
                            </div>

                        
                        <!-- 제주의 역사 text div -->
                            <div class="cultureTxt">  
                                <br>
                                <h4>
                                <!-- <img src="assets/img/checkMark.png" alt=""> -->
                                    <i class="fas fa-angle-right">&nbsp</i>
                                    바람 - 바람 잘 날 없는 바람의 나라
                                </h4>
                                
                                <div class="txtArea">
                                    <p>
                                        태풍의 길목에 자리 잡은 제주는 바람의 섬이다. 태풍 부는 날은 바다에 서면 제주바람의 위력을 실감하고도 남는다.
                                        제주만큼 다양하고 독특한 이름의 바람을 지닌 곳이 또 있을까.
                                        하늬바람, 높하늬바람, 높새바람, 샛바람, 마파람, 동마파람, 갈바람, 섯바람, 섯하늬바람, 양두새바람, 양바람. 
                                        제주사람들은 온갖 이름으로 찾아오는 바람과 싸우고, 맞서고, 비끼고 때로는 달래고, 
                                        이용해가며 독특한 바람의 문화를 이루어왔다.
                                        이제 제주바람은 모아지고 가두어져 전기에너지로 태어나는 새로운 시대를 맞고 있다.
                                        <br><br><br>
                                    </p>
                                </div>
                                <hr>                           
                            </div>
                            
                            
                            
                            <div class="cultureImgWrap1">
                                <br>
                                <div class="cultureImg">
                                    <img src="https://cdn.pixabay.com/photo/2016/11/18/07/45/mark-1833559_1280.jpg" alt="">
                                </div>                         
                            </div>

                            <div class="cultureTxt">  
                                <h4>                          
                                    <br>
                                    <!-- <img src="assets/img/checkMark.png" alt=""> -->
                                    <i class="fas fa-angle-right">&nbsp</i>
                                    돌 - 돌 없이 상상할 수 없는 돌의 섬
                                </h4>
                            
                                <div class="txtArea">
                                    <p>돌을 빼놓고는 제주를 상상할 수도 이야기할 수도 없다. 제주는 섬을 이루고 있는 땅과 산은 물론이고 섬을 빙 두른 해안선까지 온통 돌투성이인 화산섬이기 때문이다.
                                        그것을 삶의 터전으로 삼아 일구며 살아야 했던 옛 제주사람들은 한 평생을 돌 속에서 돌과 더불어 살다가 돌 속으로 돌아갔다. 특히 손으로 일일이 쌓아 두른 돌담을 눈여겨보자.
                                        집 어귀의 '올렛담', 집 울타리인 '울담', 밭을 두른 '밭담' 바다밭의 돌그물인 '원담', 무덤을 두른 '산담'이 다 돌담이다. 어찌 그것뿐이랴. 읍성 ∙ 현성 ∙ 진성 등의 성을 두른
                                        '성담'도, 외침을 막기 위해 해안을 따라 두른 '환해장성'도 다 돌담이었다. 제주돌담속에는 제주의 삶과 문화와 역사가 고스란히 쌓여있는 것이다. 
                                        <br><br><br><br>
                                    </p>
                                </div>
                            </div>
                            <hr>


                            <div class="cultureImgWrap1">
                                <br><br>
                                <div class="cultureImg">
                                        <img src="https://cdn.pixabay.com/photo/2015/10/21/15/00/sea-999811_1280.jpg" alt="">
                                </div>                         
                            </div>

                            <div class="cultureTxt">  
                                <h4>
                                    <br><br>
                                    <!-- <img src="assets/img/checkMark.png" alt=""> -->
                                    <i class="fas fa-angle-right">&nbsp</i>
                                    여자 - 여신의 나라, 여자의 섬
                                </h4>
                                
                                <div class="txtArea">
                                    <p>
                                        제주섬은 여신의 나라다. 창조의 신 설문대, 생명의 신 삼승, 바람의 신 영등, 농경의 신 자청비, 운명의 신 가믄장아기 등 제주섬의 중요한 신들은 물론 마을을 관장하는 당신, 
                                        집안을 다스리는 가신들도 거의 여신들이다. 제주는 여신의 나라인 것이다.
                                        제주섬에는 왜 여신이 많은 것일까? 인류사의 기원이 담긴 초기신화의 원형이 남아있기 때문이고, 척박한 환경과 거친 역사속에서도 주체적으로 꿋꿋하게 삶을 이끌어온 
                                        제주여성들의 능동적인 기질과 무관하지 않다.
                                        바다에 나가 물질을 하는 사람도, 밭에 나가 김을 매는 사람도, 장터에 나가 장사하는 사람도, 땔감을 구하고 물을 길어 나르는 사람도 
                                        여성들이었으니 어찌 '여다의 섬'으로 비쳐지지 않을 것인가. 
                                        여다의 섬, 그 이름은 여성들이 중심되어 이어온 제주 섬의 오랜 역사를 반영하고 있는 것이다.
                                        <br><br><br><br>
                                    </p>
                                </div>                          
                            
                            <hr class = "hr3">
                        
                 </div>
                 <br>

                    <!-- 역사 -->
                    <div class ="cultureWrap">

                        <h2>제주의 역사</h2>

                        
                        <!-- 이미지 div -->
                        <div class="cultureImg">
                            <img src="Intro/assets/img/sea_bang.jpg" alt="">
                        </div>
                        
                        <!-- 제주의 역사 text div -->
                        <div class="cultureTxt">
                            
                            <h4>
                                <br>
                                 <!-- <img src="assets/img/checkMark.png" alt=""> -->
                                 <i class="fas fa-angle-right">&nbsp</i>
                                천년의 역사 탐라
                            </h4>

                            <div class="txtArea">
                                <p>
                                    '섬나라'라는 뜻을 지닌 '탐라'는 제주의 옛 이름이다. 
                                    제주섬에 탐라가 건국된 과정은 '삼성신화'로 알려진 '탐라개국신화'에 잘 나타나 있다.
                                    고고학적 흔적을 보고 싶다면 '삼양동 선사 유적'을 찾아가보면 된다. 
                                    국가사적 416호로 지정된 삼양동 선사 유적은 원삼국시대인 기원전 3세기경
                                    제주에 처음으로 형성된 대규모 마을 유적으로 탐라형성기(B.C.200~A.D.200)시대의 사회모습을 보여준다. 
                                    삼국시대의 탐라는 백제, 고구려, 신라와
                                    각각 교역했으며, 나당연합군에 의해 백제가 멸망한 직후에는 일본과 중국 당나라와도 외교관계를 맞는 등 
                                    독자적인 해상왕국의 역사를 이었다.
                                    <br><br><br><br>
                                </p>
                                
                                <hr>
                            </div>
                            <br>
                           
                            
                            <div class="cultureImg">
                                <img src="https://cdn.pixabay.com/photo/2017/04/26/01/11/jeju-island-2261311_1280.jpg" alt="">
                            </div>                         
                        

                            <h4>
                                <br>
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
                                    <br><br><br><br>
                                </p>
                            </div>

                            <hr>
                            <br>

                            <div class="cultureImg">
                                <img src="https://cdn.pixabay.com/photo/2017/09/05/15/35/jeju-island-2718103_1280.jpg" alt="">
                            </div>

                            <h4>
                                <br>
                                <!-- <img src="assets/img/checkMark.png" alt=""> -->
                                <i class="fas fa-angle-right">&nbsp</i>
                                한숨으로 얼룩진 '유배 1번지'
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
                                    <br><br><br><br>
                                </p>
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
    <script src="Intro/assets/js/jquery.min.js"></script>
    <script src="Intro/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="Intro/assets/js/script.min.js"></script>
    <script src="Main/assets/js/slide.js"></script>
</body>

</html>