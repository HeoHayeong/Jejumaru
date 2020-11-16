<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<c:choose>
	<c:when test="{qresult == 0 }">
		<script>
			alert("수정 실패 메롱");
			hisotry.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("수정 성공");
			location.href = "q_view.do?qno=${param.qno}";
		</script>
	</c:otherwise>
</c:choose>