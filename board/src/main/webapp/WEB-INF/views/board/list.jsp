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
<script type="text/javascript">
if('${resMsg }' !=""){
	
	alert('${resMsg}');
}else{
	
}


</script>


<table>

<tr>
<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>수정일</td>
</tr>

<c:forEach items="${list}" var="list" >
<tr> 
<td>${list.bno }</td><td><a href="/board/get?bno=${list.bno}">${list.title }</a></td><td>${list.writer }</td><td>${list.regdate }</td><td>${list.updatedate}</td>
</tr>
</c:forEach>
</table>

</div>
<div>


<table>



<tr>
<script type="text/javascript">
if('${lastPage }' >1){
	
		<td><a href="/board/list?PageNum=${pageNum}">i</a></td>
	}
	
out.println("<td><a href='/board/list?pageNum="+i+">next</a></td>")
}else{
	var i=1
}
</script>
<td><a href="/board/list?PageNum=${pageNum}"></a></td>
<td><a href="/board/list?PageNum=${pageNum+1}">${lastPage-4 }</a></td>
<td><a href="/board/list?PageNum=${pageNum+2}">${lastPage-3}</a></td>
<td><a href="/board/list?PageNum=${pageNum+3}">${lastPage-2}</a></td>
<td><a href="/board/list?PageNum=${pageNum+4}">${lastPage-1}</a></td>

</tr>


</table>

</div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
