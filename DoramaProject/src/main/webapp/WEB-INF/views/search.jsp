<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
 <script type="text/javascript" src="/resources/js/search.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var castname =$("#castname").val();
	if( castname!=0){
		castname= "배우_"+castname;
		SearchList(castname);
	}
	
	//input에서 키를 누를 경우
	$("#textInput").keyup(function(key){
		 	$(".showtextBox").html("<div class=\"textBox\"></div>"); 
		 $(".textBox").html("");
		 
		 $(".textBox").addClass("startBox");
		 $(".startBox").removeClass("textBox"); 
		 
		 $(".startBox3").addClass("startBox");
		 $(".startBox").removeClass("startBox3"); 
		 


		 $(".font1").html("");
		 $(".font2").html("");
		 $(".fileListView").html("");
		 $(".castListView").html("");
		 $(".redWordBox2").html("");
		 $(".redWordBox3").html("");
		 $(".redWordBox2").addClass("x");
		 $(".redWordBox3").addClass("x");
		 $(".x").removeClass("redWordBox2");
		 $(".x").removeClass("redWordBox3");
		 var word="";
		 var word2="";
		 
		 if(key.keyCode==13){
				
			 word=$("#textInput").val();
		 }else{
			 word2=$("#textInput").val();
		 }
	
		console.log("========입력값 word:", word);
		console.log("========입력값 word2:", word2);
		console.log("========key.keyCode:", key.keyCode);
		
		
		if(key.keyCode==13){
          	console.log("========e: 엔터키 눌림");
			SearchList(word);

			word ="+";
			console.log("========e: word",word);
		}else if(key.keyCode!=13){
		console.log("========e: word",word2);
		 getSearchedList(word2);
		}
	});
	
	
});



</script>

<link rel="stylesheet" href="/resources/css/search.css">

<head>
	<title>도라마 코리아</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>

<div id="container">

<div id="contents">
<input type="text" id="castname" value="${cvo.castname}" hidden="hidden">
  


	<section class="searchBar">
	  <div class="searchForm">
		
		  
		  <div class="searchInputBox">
		     <div class="searchIcon">
		      <img alt="" src="/resources/icon_search.png">
		     </div>
		      
			 <input type="text" placeholder="검색어를 입력해주세요." id="textInput">
		  </div> 
		  
		  <div class="showtextBox">
		      <div class="startBox"></div>
		  </div>
		 
	  </div>


	</section>
	<section class="showResult">

	<div class="redWordBox2"></div>
	<div class="fontbox">
	<div class="font1"></div>
	 <ul class="fileListView">
	 
	 
	 </ul>
	</div>
	
	<div class="fontbox2">
	<div class="font2"></div>
	 <ul class="castListView">
	 
	 
	 </ul>
	</div>

	

	
	</section>


</div>

</div>
     <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include> 
</body>
</html>
