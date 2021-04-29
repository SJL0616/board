<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

	<title>Home</title>
<style type="text/css">

</style>
</head>
<body>
<h1>
게시판
</h1>
<hr>
<div>
<h4>
등록페이지
</h4>
</div>
<div>


<form action="/board/register" method="post">
<table>
<tr>
<td>제목</td> <td><input type="text" name="title"></td>
</tr>
<tr>
<td>내용</td> <td><input type="text" name="content"></td>
</tr>
<tr>
<td>작성자</td> <td><input type="text" name="writer"></td>
<tr>
<tr>
<td colspan="2">
<input type="submit" value="보내기"></td>
</tr>

</table>
</form>
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
