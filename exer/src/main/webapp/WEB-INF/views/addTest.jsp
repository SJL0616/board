<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">

function ajaxContentsInsert() {
		//javascript Object 만드는 방법
		var contentdate = {
				cname :$("#cname").val(),
				story : $("#story").val(),
				cast : $("#cast").val(),
				tags : $("#tags").val(),
				bc : $("#bc").val(),
				agelimit : $("#agelimit").val(),
				end : $("#end").val()
		};
		console.log("===================obj",contentdate);
		console.log("===================json",JSON.stringify(contentdate));
		
		
		$.ajax({
			url : '/contents/addContent',
			method : 'post',
			dataType :'json',
			
			//서버에게 보낼 때는 데이터형식 정의.
			data :JSON.stringify(contentdate),
			contentType: 'application/json; charset=UTF-8',
			
			success: function(data, status) {
				console.log(data);
				if(data.result == "success"){
				
					$("#result").text("입력완료");
					$("#showcname").val(data.cname);
			
				}else{
					alert("입력중 오류가 발생했습니다.");
				}
				
				//모달창 닫기
				
				//jsp파일은 기다리지 않기 떄문에 메세지가 전해지면 
				//닫히게 함.
				
				//리스트 조회하기
			
			
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		});
		
};


function sendFile() {
	

	var formData = new FormData(document.fileUploadForm);
	console.log("cname",formData.get("cname"));
	
	
	$.ajax({
		
		url: '/fileUploadAjax',
		method: 'post',
		dataType : 'json',
		processData: false,
		contentType: false,
		data: formData,
		
		success: function(data,result, textStatus, jqXHR) {
			console.log("callBack result :",result);
			$("#result2").text(data.result);
			//name속성이 attachno인 input에 attachno을 넣어줌.
			
			/* $("#attachno").val(data.attachno);
			$("#attachNum").val(data.attachno); 
			/* $("#attachno").val(data.attachno);  */
			 $("input[name=cname]").val(data.cname);
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

</script>


<head>
	<title>Home</title>
</head>
<body>
<h1>
 Contents Upload page
</h1>

<h4>  작품 text 업로드 </h4>
<!-- <form action="#" method="post"> -->
<!-- 번호<input type="text" id="cnum" ><br> -->
작품이름<input type="text" id="cname" ><br>
줄거리<textarea rows="4"  cols="30" id="story" ></textarea><br>
출연진이름(,구분)<input type="text" id="cast" ><br>
태그<input type="text" id="tags" ><br>
방송국<input type="text" id="bc" ><br>
연령제한<input type="text" id="agelimit" ><br>
완결유무<input type="text" id="end" >
<button type="button" id="addcontents"  onclick="ajaxContentsInsert()">입력</button>

<!-- </form> -->
<p id="result"></p><br>

<h4>  작품 포스터 이미지 업로드 </h4>
<form action="addContentsPhoto" method="post" name="fileUploadForm" enctype="multipart/form-data">
<input type="text" name="cname" id="showcname" >
<input type="file" name="uploadFile" id="uploadFileElement">
  <input type="button" value="보내기" id="sendBtn" onclick="sendFile()" >
</form>
<p id="result2"></p>
</body>
</html>
