<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function() {
	//화면이 다 호출되면 이 jsp를 실행해라
	
	$("#getListBtn").on("click", function() {
		console.log("test");
		 getAjaxList(); 
	});
});


function getAjaxList(pageNo, bno, callback, error){
	
	$.ajax({
		// 서버 접속 URL
		url : '/reply/list/7',  /* +pageNo+'/'+bno, */
		method  : 'get',
		// 반환 데이터 타입
		dataType : 'json',
		
		// 처리 성공
		success : function(data, textStatus, jqXHR){
			console.log(data);
			//console.log("data", data);
			//console.log("textStatus", textStatus);
			//console.log("jqXHR", jqXHR);
			
			// 콜백함수가 있으면 콜백함수 실행
			if(callback){
				callback(data);
			}
			
		},
		
		// 처리 실패
		error : function(jqXHR, textStatus, errorThrown){
			console.log("textStatus", textStatus);
			/* console.log("errorThrown", errorThrown);
			console.log("textStatus", textStatus);
			console.log("jqXHR", jqXHR); */
			
			// 콜백함수가 있으면 콜백함수 실행
			if(error){
				error(errorThrown);
			}
			
		}
		
	});
	
}



</script>
<head>
</head>
<body>
<button id="getListBtn">리스트</button>
<table border="1" id="repleTbl">
<tr>
<td>리플</td>
<td>작성자</td>
</tr>
</table>
</body>

</html>
