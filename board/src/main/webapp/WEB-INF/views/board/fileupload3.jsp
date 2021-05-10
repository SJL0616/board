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
				//name속성이 attachno인 input에 attachno을 넣어줌.
				
				/* $("#attachno").val(data.attachno);
				$("#attachNum").val(data.attachno); */
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
			console.log("==========인코딩전:"+item.s_savepath);
			var s_savePath = encodeURIComponent(item.s_savepath);
			var savePath = encodeURIComponent(item.savepath);
			
			 htmlContent ; 
			 if(item.filetype = "Y"){
				
					console.log("==========인코딩후:"+savePath);
				 htmlContent  +="<li><a href=/download?filename="+savePath+">"
				          +"<img src=/display?filename="+s_savePath+">"
				          +item.filename+"</a>"
				         +"<span onclick=attachFileDelete('"+item.uuid+"','"+item.attachno+"') data-type='image'>X</span></li>";
						
			 }else{
				 htmlContent +="<li>"+item.filename
				 +"<a href=/download?filename="+savePath+"></li>"; 
						 //파일네임에는 파라메터로 넘길수없는 데이터가 있어서 인코딩이 필요.
			 }
		
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

function attachFileDelete(uuid,attachno) {
	console.log("attachFileDelete===============uuid",uuid);
	console.log("attachFileDelete===============attachno",attachno);
	$.ajax({
		
		url: '/attachFileDelete/'+uuid+'/'+attachno,
		method: 'get',
		
		success: function(res) {
			console.log(res);
			showList(attachno);
		
		},
	    error:function(error) {
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
  <input type="text" name="attachno" id="attachno" value="0">
  <label id="uploadFileLable"></label>
    <input type="file" name="uploadFile" id="uploadFileElement">
    <input type="button" value="보내기" id="sendBtn" onclick="sendFile()" >
<!--     <input type="button" value="보내기" id="showBtn" onclick="showList()" > -->

  
  </form>
<p id="text"><br>
<p id="text2"><br>
<div class="uploadResult">
	<ul class="fileListView" id="uploadResult">
</ul>
</div>


</body>
</html>