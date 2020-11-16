<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  


<c:choose>
	<c:when test="${qresult == 0 }">
		<script>
			alert("등록실패 !!!메롱");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			alert("등록 성공 리스트로");
			location.href = "qanda_list.do";
		</script>
	</c:otherwise>
</c:choose>





















    
    