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
function sendCastFile() {//캐스트 정보입력
	
	
	var formData = new FormData(document.addcastForm);
	console.log("castname",formData.get("castname"));
	console.log("cno",formData.get("cno"));
	console.log("uploadFile",formData.get("uploadFile"));
	

$.ajax({
		
		url: '/addCast',
		method: 'post',
		dataType : 'json',
		processData: false,
		contentType: false,
		data: formData,
		
		success: function(data,result, textStatus, jqXHR) {
			console.log("callBack result :",result);
			$("#result").text(data.castname+"의 t_cast DB입력완료");
			
			
		},
		error : function() {
			console.log("error");
		}
		
	});
	
	
}


function sendMatchInfo(i) {//캐스트 match 정보입력
	
	 var strCastname = document.all.castname.value;
		console.log("===================strCastname",strCastname);
		
		//실험
		var castname = document.getElementById(i).value;
		console.log("===================castname ",castname );
		var cast = document.getElementById("cast"+i).value;
		console.log("===================cast ",cast );
		
		var cno = $("#showcno").val();
		console.log("===================cno ",cno );
		
		$.ajax({
			url: '/addCastMatch/'+cno+'/'+castname+'/'+cast,
			method: 'get',
			dataType : 'json',
			
		success: function(data) {
			console.log("callBack result :",data.result);
			
			$("#result3").text(data.castname+"의 배역 입력완료");

		},
		error : function() {
			console.log("error"); 
			$("#result3").text("error");
			
		} 
		
		});
}


function ajaxContentsInsert() {
		//javascript Object 만드는 방법
		var strValue = document.all.cast.value;
		console.log("===================strValue",strValue);
		 if (strValue != "") {
			  var arrValue = strValue.split(",");
	            var strInput = "";
	            var strBtn = "<input type=\"button\" value=\"보내기\" id=\"sendCastBtn\" onclick=\"sendCastFile()\" ><br/>";
	            console.log("===================arrValue",arrValue);
	            for (var i = 0; i < arrValue.length; i++){
	            	strInput += "<form action=# method=\"get\" name="+i+" >"
	                +"<input type=\"text\"  name=\"castname\" id="+i+" value="+arrValue[i] +" /><br/>"
	            	+ "<input type=\"text\"  name=\"cast\" id=cast"+i+" /><br/>"
	            	+"<input type=\"text\" name=\"cno\" id=\"showcno\"><br/>"
	            	+"<input type=\"button\" value=\"보내기\" id=\"addcastBtn\" onclick=sendMatchInfo("+i+") ></form><br/>";
	            document.getElementById("insDiv").innerHTML = strInput;
	         
	            }
	         
		 }
		       
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
				
					$("#result2").text("T_CONTENTT에 DB 입력완료");
					$("#showcname").val(data.cname);
					 $("input[name=cno]").val(data.list.cno);
			
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

	
	
	/* $.ajax({
		
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
		/*	 $("input[name=cname]").val(data.cname);
			$("#uploadFileElement").val("");
		
			/* $("#uploadFileElement").remove();
			$("#uploadFileLable").append("<input type='file' name='uploadFile' id='uploadFileElement'>"); */
			
			/*	},
		error : function() {
			console.log("error");
		}
		
	}); */
	

}

function moreInputBar() {
	 var strInput = "";
	/*  var strBtn =""; */
	/*  for(int i=0; i<n;i++){ */
		 strInput += "<input type=\"file\" name=\"uploadFile\" id=\"uploadFileElement1\"><br/>"
		 +"<textarea rows=\"4\"  cols=\"30\" name=\"story\" id=\"story\" ></textarea><br>"
		 +"<input type=\"text\" name=\"regdate\" id=\"regdate\"><br>";
	/*  } */
	 $("#more").after(strInput);
}

function sendVFile() {
	formData = new FormData(document.VfileUploadForm);

console.log("cname",formData.get("cname"));
console.log("story",formData.get("story"));
console.log("regdate",formData.get("regdate"));

}

</script>


<head>
	<title>Home</title>
</head>
<body>
<h1>
 Contents Upload page
</h1>

<div id="castaddForm">
<h4>배우 정보 업로드</h4>

<form action=# method="post" name="addcastForm" enctype="multipart/form-data" >

배우이름<input type="text"  name="castname" id="castname" /><br/>
프로필사진<input type="file" name="uploadFile" id="uploadFileElement"><br/>	          
<input type="button" value="보내기" id="addcastBtn" onclick=sendCastFile() ></form><br/>

<p id="result"></p><br>
</div>   



<h4>  작품 text 업로드 </h4>
<!-- <form action="#" method="post"> -->
<!-- 번호<input type="text" id="cnum" ><br> -->
작품이름<input type="text" id="cname" ><br>
줄거리<textarea rows="4"  cols="30" id="story" ></textarea><br>
출연진이름(,구분)<input type="text" id="cast" name="cast"><br>
태그<input type="text" id="tags" ><br>
방송국<input type="text" id="bc" ><br>
연령제한<input type="text" id="agelimit" ><br>
완결유무<input type="text" id="end" >
<button type="button" id="addcontents"  onclick="ajaxContentsInsert()">입력</button>

<div id="insDiv">

 </div>

<!-- </form> -->
<p id="result3"></p><BR>
<p id="result2"></p><BR>



<h4>  작품 포스터 이미지 업로드 </h4>
<form action="addContentsPhoto" method="post" name="fileUploadForm" enctype="multipart/form-data">
<input type="text" name="cname" id="showcname" >
<input type="file" name="uploadFile" id="uploadFileElement">
  <input type="button" value="보내기" id="sendBtn" onclick="sendFile()" >
</form>

<h4>  작품 동영상  업로드 </h4>

<form action="addContentsPhoto" method="post" name="VfileUploadForm" enctype="multipart/form-data">
cno<input type="text" name="cno" id="showcno" ><br>

영상 파일<input type="file" name="uploadFile" id="uploadFileElement1">
동영상스토리<textarea rows="4"  cols="30" name="story" id="story" ></textarea><br>
regdate<input type="text" name="regdate" id="regdate"><br>
<div id="more"></div>
 <input type="button" value="입력 동영상 추가" id="sendBtn" onclick="moreInputBar()" >
 
 <input type="button" value="보내기" id="sendBtn" onclick="sendVFile()" >
 
 <!-- 각자 form을 만들어서 업로드하던지, 전체를 배열? 로 묶어서 보내던지 해야함/ 썸내일 img 파일도 업로드 해야함 -->
 </form>
<p id="result2"></p>
</body>
</html>
