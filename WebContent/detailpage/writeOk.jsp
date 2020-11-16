<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%--
	${result}  ==> request.getAttrubute("result")
 --%>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("리뷰를 작성해주세요✏");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			alert("소중한 리뷰 감사합니다.🍊🍊 ");
			location.href = '../detailJspPage.do?pno=<%=Integer.parseInt(request.getParameter("pno")) %>';
		</script>
	</c:otherwise>
</c:choose>



