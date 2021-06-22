<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body{
		position: relative;
	}
	#box{
	position: absolute;
	margin : auto;
	top :10em;
	left: 50em;
	}
</style>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	function page(page){
		//location.href = "/board/list?pageNo="+page;
		document.listForm.action="/memberList";
		document.listForm.pageNo.value=page;
		document.listForm.submit();
		
	}
	
	function changeRole(id,index){
		console.log("id",id);
		console.log("index",index);
		var role ={
				id : id,
				role_id : $("#"+index).val()
		};
		var result = confirm('정말 변경하겠습니까?');
		if(result){
			console.log(role);
			$.ajax({
				url :'/updateRole',
				method :'post',
				dataType :'json',
				data :JSON.stringify(role),
				contentType:'application/json; charset=UTF-8',
				success: function(data){
					alert(data.Msg);
				},
				error: function(){
					console.log("에러에러에러에러에러");
				}
			});
		}else{
			return false;
		}
	}
</script>
<body>
<div id="box">
<form method="get" action="/logout">
<button type=submit>로그아웃</button><br>
<a href="/index">홈으로</a>
<h1>멤버 LIST</h1>
</form>

${Msg }
<table border="1">
	<tr>
		<td>id</td>
		<td>이름</td>
		<td>이메일</td>
		<td>권한</td>
		<td>변경</td>
	</tr>
	<c:forEach var="vo" items="${list }" varStatus="status">
	
	<tr>
		<td>${vo.id }</td>
		<td>${vo.name }</td>
		<td>${vo.email }</td>
		<td><select id="select${status.index }">
			<option <c:if test="${vo.role_id eq 'ROLE_ADMIN' }">selected</c:if> >ROLE_USER</option>
			<option <c:if test="${vo.role_id eq 'ROLE_ADMIN' }">selected</c:if> >ROLE_ADMIN</option>
		</select></td>
		<td><button id="btn_role" type="button" onclick="changeRole('${vo.id }','select${status.index }')">변경</button>
	</tr>	
	</c:forEach>
	<c:if test="${list.size() == 0 }">
		<tr><td colspan='4' align="center">회원이 없습니다.</td></tr>
	</c:if>
</table>

<form name="listForm" method="get">
						<nav aria-label="...">
							  
							  <ul class="pagination">
							  
							  <!-- prev 표시 -->
							  <c:if test="${pageNavi.prev }">
							    <li class="page-item" onClick="javascript:page(${pageNavi.startPage-1});">
							      <a class="page-link" href="#" tabindex="-1">Previous</a>
							    </li>
							  </c:if>
							  <c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
							  
							  	<c:choose>
							  		<c:when test="${page eq pageNavi.cri.pageNo }">
									  	<li class="page-item active" onClick="page(${page})">
									      <a class="page-link" href="#" >${page } <span class="sr-only">(current)</span></a>
									    </li>
								    </c:when>
								  	<c:otherwise>
								    	<li class="page-item" onClick="page(${page})"><a class="page-link" href="#">${page }</a></li>
								    </c:otherwise>
							  	</c:choose>
							  
							  </c:forEach>
							  <!-- next 표시 -->
							  <input type="hidden" name="pageNo">
							  <c:if test="${pageNavi.next }">
							    <li class="page-item" onClick="page(${pageNavi.endPage + 1})">
							      <a class="page-link" href="#">Next</a>
							    </li>
							  </c:if>
							  </ul>
							  
							</nav>
</form>
</div>

</body>
</html>