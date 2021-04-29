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
	 getAjaxList();
	$("#getListBtn").on("click", function() {
		console.log("test");
		 
	});
});


function getAjaxList(pageNo, bno, callback, error){
	
	$.ajax({
		
		url :'/reply/list/2',
		method : 'get',
		dataType : 'json',
		
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			
			console.log($("#repleTbl").html());
			
			
			$("#repleTbl").html("");
			
			var tblContent= "";
			
			$.each(data, function(index, item){
				tblContent += "<tr><td>"+item.rno+"</td><td>"+item.reply+"</td><td>"+item.replyer+"</td><td>"+item.replydate+"</td><td>"+item.updatedate+"</td></tr>";
			});
			
		
       
			$("#repleTbl").html(tblContent);
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("textStatus", textStatus);
			
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
