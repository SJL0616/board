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
<table>

<tr>
<td>번호</td><td>제목</td><td>내용</td><td>작성자</td><td>작성일</td><td>수정일</td><td>삭제</td><td>수정</td>
</tr>


<tr> 
<td>${vo.bno }</td><td>${vo.title }</td><td>${vo.content }</td><td>${vo.writer }</td><td>${vo.regdate }</td><td>${vo.updatedate}</td> 
<td><a href="/board/delete?bno=${vo.bno }"><input type="button" value="삭제" onclick="confirm('정말로 삭제하시겠습니까?')"></a> </td>
<td><a href="/board/update?bno=${vo.bno }"">수정하기</a></td>
</tr>

</table>

</div>

</body>
</html>
