<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#sendBtn").on("click", function (){
		var formData = new FormData(document.fileUploadForm);
		console.log("formData.get",formData.get("uploadFile"));
		
		$.ajax({
			
			url: '/fileUploadAjax',
			method: 'post',
			
			processData: false,
			contentType: false,
			data: formData,
			
			success: function() {
				console.log("success");
			},
			error : function() {
				console.log("error");
			}
			
		});
		
		
		
		
	});
	
});


</script>

<body>

  <form name="fileUploadForm" action="/uploadFormAction" method="post" enctype="multipart/form-data">
  
    <input type="file" name="uploadFile">
    <input type="button" value="보내기" id="sendBtn" >
  
  </form>

</body>
</html>