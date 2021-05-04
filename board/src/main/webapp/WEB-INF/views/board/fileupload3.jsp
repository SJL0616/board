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

$(document).ready(function(){
	$("#attachno").on("change", function(){
		showList($("#attachno").val());	
	});

});


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
			
			success: function(data,result, textStatus, jqXHR) {
				console.log("callBack result :",result);
				$("#text").text(data.result);
				$("#attachno").val(data.attachno);
				$("#uploadFileElement").val("");
				showList(data.attachno);
				/* $("#uploadFileElement").remove();
				$("#uploadFileLable").append("<input type='file' name='uploadFile' id='uploadFileElement'>"); */
				
			},
			error : function() {
				console.log("error");
			}
			
		});
	
}

function showList(attachno) {

	$.ajax({
		url: '/getFileList/'+attachno,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
		
		$("#text2").text(data);
		var htmlContent ="";
		$.each(data, function(index, item){
			
				console.log("==========아이템:"+item.filename);
			 htmlContent +="<li>"+item.filename+"</li>"; 
		
		});
		console.log($(".fileListView").html(htmlContent));
		
		$(".fileListView").html(htmlContent);
/* 		var file ="<img alt='immage' src='C:\upload\'"+data.savepath+">";
		$("#text2").html(file);  */
	},
	error : function() {
		console.log("error"); 
	}
	
	});
	

}
</script>

<body>

  <form name="fileUploadForm" action="/uploadFormAction" method="post" enctype="multipart/form-data">
  <input type="text" name="attachno" id="attachno" value="0">
  <label id="uploadFileLable"></label>
    <input type="file" name="uploadFile" id="uploadFileElement">
    <input type="button" value="보내기" id="sendBtn" onclick="sendFile()" >
    <input type="button" value="보내기" id="showBtn" onclick="showList()" >
  
  </form>
<p id="text"><br>
<p id="text2"><br>

<ul class="fileListView">
</ul>

</body>
</html>