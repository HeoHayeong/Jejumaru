<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
	Update 의 경우가 의외로 처리 할 것들이 많다.
	
	일단, 기존의 데이터를 불러 들어 와야 한다. SELECT
	그리고, 편집가능한 영역과 그렇지 않은 영역을 분리해서 사용자에게 form 을 제공해야 한다.
	표시내용은 view.jsp 에서 비슷하게 시작가능
	
	나중에 updateOk.jsp 로 넘겨서 실제 UPDATE 쿼리를 실행하기 위해선 uid 값도 넘어가야 한다.
	그래서 넘겨 받은 id 값을 hidden 으로 담아 두었다가 넘겨준다.
	
 --%>

<c:set var="arr" value='<%=(WriteDTO[]) request.getAttribute("list")%>' />
<c:set var="arrLength" value='${fn:length(arr) }'/>

<c:if test="${arr == null || arrLength == 0 }">
	<script>
		alert("해당 정보가 삭제되거나 없습니다.");
		history.back();
	</script>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 수정</title>
<!-- title에 글제목 넣기 -->
</head>
<script>
	//form 검증
	//작성자와 제목은 필수
	function chkSubmit(){
		frm = document.forms['frm'];
		
		var name = frm['name'].value.trim();
		var subject = frm['subject'].value.trim();
		
		if(subject == ""){
			alert("제목란은 반드시 입력해야 합니다.");
			frm["subject"].focus();
			return false;
		}
		
		return true;
	}	
</script>
<body>
	<form name="frm" action="updateOk.do" method="post"
		onsubmit="return chkSubmit()"
		enctype="Multipart/form-data"> <%-- 수정단계에서 파일 추가 업로드 가능 --%>
		<input type="hidden" name="rmno" value="${element.rmno }"> 
		작성자: ${element.rmno }<br>
		<%-- 작성자 이름은 변경 불가 --%>
		
		
		<textarea class="textwrtie" name="rcontent" style="overflow-x: hidden; overflow-wrap:break-word;">
		${element.rcontent }</textarea>

		<br><br> 
		
		<%-- 첨부파일 목록( 삭제가 될수 있는 대상) --%>
		<%-- <c:if test="${fn:length(fileList) > 0 }">
         <div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border:1px solid #000;">
            <h4>첨부파일 - 삭제할 것에 체크해 주세요</h4>
            <div id="delFiles">
               <c:forEach var="filedto" items="${fileList }">
                  <div>
                     <button type="button" onclick="deleteFiles(${fileDto.uid}); $(this).parent().remove();">삭제</button> ${fileDto.source }
                  </div>
               </c:forEach>
            </div>
         </div>
      	</c:if> --%>
      	
		<script>
				
			function deleteFiles(fileUid) {
				// 삭제할 file의 bf_uid값(들)을 #delFiles에 담아 submit 한다
				$("#delFiles").append("intput type='hidden' name='delFile' value='" +fileUid +"'>");
			}
		</script>
		
		<!-- 첨부파일(추가) -->
		<div style="background-color: beige; padding: 2px 10px; margin-bottom: 5px; border:1px solid #000;">
			<h4>첨부파일 - 추가</h4>
			<button type="button" id="btnAdd">추가</button>
			<div id="files"></div>
			
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			
		<script>
			var i = 0;
			$("#btnAdd").click(function(){
				$("#files").append("<div><input type='file' name = 'upfile" +i+ "'/><button type='button' onclick='$(this).parent().remove()'>삭제</button></div>");
			});

		</script>
		
		
		
		<input type="submit" value="수정" />
		<button type="button" onclick="history.back()">이전으로</button>
		<button type="button" onclick="location.href='list.do'">목록보기</button>
		<br>
	</form>
</body>
</html>