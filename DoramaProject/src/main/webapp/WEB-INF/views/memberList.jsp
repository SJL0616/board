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
	
	.contentList{
	border-collapse: collapse;
	width: 100%;
	}
	.contentList tr,td{
	border: 1px solid black;
	
	}
	.contentList td:nth-child(2) {
    width: 250px;
}
.notRecBtn{
color: red;
}
#ShowBtn{
color: blue;
}
</style>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		showTrueList();
		
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
	
	function showTrueList() {

		$.ajax({
			url: '/getTureAllList/',
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data);
			
			var length = data.length;
			$(".contentN").text(length);
			var htmlContent ="";
			$("#contentList").html("<tr><td>번호</td><td>컨텐츠 이름</td><td>추천</td><td>숨기기</td></tr>");
			$.each(data.list, function(index, item){
				console.log("==========아이템:"+item.pfilename);

					
					
					 htmlContent  +="<tr>"
						 +"<td>"+item.cno+"</td>"
						 +"<td>"+item.cname+"</td>";
						 
						 if(item.rec==1){
							 htmlContent  +="<td><button  type=\"button\" onclick=\"notRec("+item.cno+")\" class=\"notRecBtn\" value=\"추천 풀기\"/>추천 풀기</td>";
						 }else{
							 htmlContent  +="<td><button type=\"button\"  onclick=\"Rec("+item.cno+")\" class=\"RecBtn\" value=\"추천 하기\"/>추천 하기</td>";
						 }
						 
						 if(item.notshow==1){
							 htmlContent  +="<td><button id=\"ShowBtn\"  onclick=\"show("+item.cno+")\" value=\"숨기기\"/>보이기</td></tr>";
						 }else{
							 htmlContent  +="<td><button id=\"notShowBtn\" onclick=\"notShow("+item.cno+")\" value=\"숨기기\"/>숨기기</td></tr>";
						 }
						 
	
			
			});
			
			$("#contentList").append(htmlContent);

		},
		error : function() {
			console.log("error"); 
		}
		
		});
		

	}
	
	function notRec(cno) {
		
		$.ajax({
			url: '/notRec/'+cno,
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data);
			
			showTrueList();


		},
		error : function() {
			console.log("error"); 
		}
		
		});
		
	}
	function Rec(cno) {
		
		$.ajax({
			url: '/Rec/'+cno,
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data);
			
			showTrueList();


		},
		error : function() {
			console.log("error"); 
		}
		
		});
		
	}
function notShow(cno) {
		
		$.ajax({
			url: '/notShow/'+cno,
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data);
			
			showTrueList();


		},
		error : function() {
			console.log("error"); 
		}
		
		});
		
	}
	function show(cno) {
		
		$.ajax({
			url: '/show/'+cno,
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data);
			
			showTrueList();


		},
		error : function() {
			console.log("error"); 
		}
		
		});
		
	}
</script>
<body>
<div id="box">
<form method="get" action="/logout">
<button type=submit>로그아웃</button><br>
<a href="/index"><button type="button">홈으로</button></a>
<a href="/addTest"><button type="button">배우,작품등록</button></a>

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

<div>
<table id="contentList" class="contentList">
<tr>
<td>번호</td>
<td>컨텐츠 이름</td>
<td>추천</td>
<td>숨기기</td>
</tr>


</table>

</div>

</div>

</body>
</html>