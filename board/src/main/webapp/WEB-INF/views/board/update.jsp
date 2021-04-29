<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

	<title>Home</title>
<style type="text/css">
table{	
	text-align:center;
	width:600px;
	margin: auto 0;
	border-collapse:collapse;	
	border: 1px solid black;
	
	}
	


	 td,tr{
	border: 1px solid black;
	
	}

</style>
</head>
<body>
<h1>
게시판
</h1>
<hr>
<div>
<form action="/updateBoard" method="post">
<table>
<tr>
<td>번호</td><td>제목</td><td>내용</td><td>작성자</td><td>작성일</td><td>수정일</td><td>삭제</td><td>수정</td>
</tr>


<tr> 
<td><input type="text" name="bno" readonly="readonly" value=" ${vo.bno }"></td>
<td><input type="text" name="title" value="${vo.title }"></td>
<td><input type="text" name="content" value="${vo.content }"></td>
<td><input type="text" name="writer" value="${vo.writer }"></td>
<td><input type="text" readonly="readonly" value=" ${vo.regdate }"></td>
<td><input type="text" readonly="readonly" value=" ${vo.updatedate}"></td> 
<td><input type="submit" value="보내기"> </td>
<td><a href="/board/update">수정하기</a></td>
</tr>

</table>
</form>
</div>

</body>
</html>
