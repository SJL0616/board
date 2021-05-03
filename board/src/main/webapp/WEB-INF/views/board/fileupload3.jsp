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

function sendFile() {
	

		var formData = new FormData(document.fileUploadForm);
		console.log("attachNo",formData.get("attachno"));
		
		$.ajax({
			
			url: '/fileUploadAjax',
			method: 'post',
			dataType : 'json',
			processData: false,
			contentType: false,
			data: formData,
			
			success: function(result) {
				console.log("callBack result :",result);
			},
			error : function() {
				console.log("error");
			}
			
		});
		
		
		
		

	
}


</script>

<body>

  <form name="fileUploadForm" action="/uploadFormAction" method="post" enctype="multipart/form-data">
  <input type="text" name="attachno" value="0">
    <input type="file" name="uploadFile">
    <input type="button" value="보내기" id="sendBtn" onclick="sendFile()" >
  
  </form>

</body>
</html>