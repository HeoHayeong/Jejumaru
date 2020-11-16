<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cnt" value='<%= (Integer)request.getAttribute("delete") %>'/>

<c:if test='${cnt == 0 }'>
	<script>
		alert("삭제실패!");
		history.back();
	</script>
</c:if>

<c:if test="${cnt != 0 }">
	<script>
		alert("삭제성공"); 
		location.href = '../detailJspPage.do?pno=<%=Integer.parseInt(request.getParameter("pno")) %>';
		
	</script>
</c:if>
