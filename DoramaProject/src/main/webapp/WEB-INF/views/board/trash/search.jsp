<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
 
<script type="text/javascript">
$(document).ready(function(){
	
	//input에서 키를 누를 경우
	$("#textInput").keydown(function(key){
		var word =$("#textInput").val();
		 getSearchedList(word);
		
		if(key.keyCode==13){
			console.log("========e: 엔터키 눌림");
			
			console.log("========입력값:", word);
			
		}
	
		
	});
});

//필터를 db에 전달해서 아래 text로 해당하는 자료 이름 출력
function getSearchedList(word){
	   console.log("==========word:", word); 
	$.ajax({
		
		url: '/getSearchedList/'+word,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);

	
		$.each(data.contentlist, function(index, item){
			var htmlContent ="";
			console.log("==========아이템:"+item.pfilename);

		 htmlContent +="<li><a href=/showcontents?cno="+item.cno+">"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>"+item.cname+"</div></a></li>";
		 $(".fileListView").append(htmlContent);
		});
		
		$.each(data.castlist, function(index, item){
			var htmlContent ="";
			console.log("==========아이템:"+item.pfilename);

		 htmlContent +="<li><a href=#>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[출연진]</span>"+item.castname+"</div></a></li>";
		 $(".fileListView").append(htmlContent);
		});
		

	},
	error : function() {
		console.log("error"); 
	}
	
	});
	
	
}


</script>


<style>
body{
	background-color: rgb(25, 25, 25);
}
#contents{

color:rgb(170, 170, 170);

/* border: 2px solid white;    */
margin: 0 auto;
width: 100%;
height: 100%;

}
.searchBar{
height: 700px;
    width: 100%;
    /* max-width: 724px; */
    margin: 0px auto;
    display: flex;
    /* -webkit-box-align: center; */
    align-items: center;
    /* height: 1; */
    background-color: rgb(11, 11, 11);
    justify-content: space-around;
    flex-direction: row;
}
.searchForm{
display:flex;
background-color: rgb(11, 11, 11);
}
.searchForm input{
font-size: 1.8em;
    outline: none;
    background-color: transparent;
    border: 0px;
    height: 50px;
    width: 600px;
    color: rgb(255, 255, 255);}
 
 .searchForm input:focus{
border-bottom: 1px solid rgb(255, 255, 255)}



.searchBar .searchIcon{
    width: 40px;
    height: 40px;
    margin-right: 15px;
}
.searchBar .searchIcon img{
    width: 100%;
}
.searchBar .textBox{
width: 724px;
    /* transform: translateX(-50%); */
    background-color: rgb(37, 37, 37);
    border-radius: 10px;
    padding: 100px;
}
</style>
<head>
	<title>Home</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>

<div id="container">

<div id="contents">
  


	<section class="searchBar">
	  <div class="searchForm">
	  <div class="searchIcon">
	  <img alt="" src="/resources/icon_search.png">
	  </div>
	  <div>
	  <input type="text" placeholder="검색어를 입력해주세요." id="textInput">
	  <div class="textBox"></div>
	  </div>
	  
	  
	  
	  </div>


	</section>
	<section>
	<div>
	 <ul class="fileListView">
	 
	 
	 </ul>
	
	</div>
	
	</section>


</div>

</div>

</body>
</html>
