<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="/logout">
user:${sessionScope.user}<br>
<button type=submit>로그아웃</button><br>
<a href="/viewMember">${sessionScope.user.id }상세보기</a>


</form>
</body>
</html>