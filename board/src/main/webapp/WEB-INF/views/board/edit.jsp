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
수정페이지
</h4>
</div>
<div>


<form action="/updateBoard" method="post">
<table>
<tr>
<td>번호</td> <td><input type="text" name="bno" value="${vo.bno }"></td>
</tr>
<tr>
<td>제목</td> <td><input type="text" name="title" value="${vo.title }"></td>
</tr>
<tr>
<td>내용</td> <td><input type="text" name="content"  value="${vo.content }"></td>
</tr>
<tr>
<td>작성자</td> <td><input type="text" name="writer"  value="${vo.writer}"></td>
<tr>
<tr>
<td>
<input type="submit" value="보내기"></td>
<td><a href="/deleteBoard?bno=${vo.bno }"><input type="button" value="삭제" onclick="confirm('정말로 삭제하시겠습니까?')"></a> </td>
</tr>

</table>
</form>
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
