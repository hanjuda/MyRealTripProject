<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "com.join.vo.Checkagree" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 해준다</title>
</head>
<body>



<c:choose>
	<c:when test="${r==1}">
		<script>
			alert("회원가입 완료!")
			location.href="Controller?command=sign_in"
		</script>
	</c:when>
 	<c:otherwise>
		<script>
			alert("회원가입 실패!")
			location.href="Controller?command=sign_up"
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>