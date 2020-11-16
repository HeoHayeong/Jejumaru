<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<c:choose>
	<c:when test="${qresult == 0 }">
		<script>
			alert("삭제 실패");
			hisotry.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("삭제 성공했다구");
			location.href = "qanda_list.do";
		</script>
	</c:otherwise>
</c:choose>