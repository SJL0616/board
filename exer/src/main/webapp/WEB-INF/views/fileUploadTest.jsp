<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">



function sendFile2() {
	

		 var formData = new FormData(document.fileUploadForm); 
		
		console.log("fileInfo",formData.get("uploadFile"));
	/* 	var res = $("#uploadFileElement").val();
		console.log("============="+res); */
		$.ajax({
			
			url: '/fileUploadAjax2',
			method: 'post',
			/* dataType : 'json', */
		/* 	dataType : 'json', */
			processData: false,
			contentType: false,
		 	data: formData, 
			
			success: function(data,result, textStatus, jqXHR) {
				console.log("============data :",data);
							},
			error : function() {
				console.log("error");
			}
			
		});
	
}

</script>
<style>
#uploadResult {
	width: 100%;
	background-color: gray;
}

#uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

#uploadResult ul li {
	list-style: none;
	padding: 10px;
}

#uploadResult ul li img {
	width: 100px;
}
</style>




<body>

  <form name="fileUploadForm" action="/uploadFormAction" method="post" enctype="multipart/form-data">

    <input type="file" name="uploadFile" id="uploadFileElement"> 
 <!--    <input type="text" name="uploadFile" id="uploadFileElement"> -->
    <input type="button" value="보내기" id="sendBtn" onclick="sendFile2()" >

  
  </form>



</body>
</html>