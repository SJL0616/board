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
<script type="text/javascript">
if('${resMsg }' !=""){
	
	alert('${resMsg}');
}else{
	
}
</script>

<h1>
상세보기
</h1>
<hr>

<div>


<form action="/board/register" method="post">
<table>
<tr>
<td>제목</td> <td>${vo.title }</td>
</tr>
<tr>
<td>내용</td> <td>${vo.content }</td>
</tr>
<tr>
<td>작성자</td> <td>${vo.writer}</td>
<tr>
<tr>
<td>수정</td> <td><a href="/board/edit?bno=${vo.bno }"><input type="button" value="수정하기"/></a></td>
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
