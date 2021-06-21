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
	$("#textInput").keyup(function(key){
	

		var word =$("#textInput").val();
		console.log("========입력값:", word);
		 getSearchedList(word);
		
		if(key.keyCode==13){
			console.log("========e: 엔터키 눌림");
			SearchList(word);
		}
	
		
	});
	
	
});

//필터를 db에 전달해서 아래 자동완성 box에 text로 해당하는 자료 이름 출력
function getSearchedList(word){
	   console.log("==========word:", word); 
	$.ajax({
		
		url: '/getSearchedList/'+word,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		 console.log("callBack result :",data.result); 
		 console.log("callBack result :",data); 
		if(data.result=="success"){

			var htmlContent ="";
		$.each(data.contentlist, function(index, item){
			
			console.log("==========아이템:"+item.pfilename);
			console.log("==========아이템:"+item.castname);
		var name= item.cname;
		 htmlContent +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
          console.log("============word.length",word.length);
          var idx = item.cname.indexOf(word); 

          console.log("============idx",idx);

        var left = item.cname.substring(0,idx);
        var bold =item.cname.substring(idx,idx+word.length);
        var right = item.cname.substring(idx+word.length);
        
        console.log("============left",left);
        console.log("============bold",bold);
        console.log("============right",right);
        htmlContent+=left+"<span class=\"redWord\">"+bold+"</span>"+right+"</div></a></li>";
		
		});
		
	
		$.each(data.castlist, function(index, item){
			
	
			
			console.log("==========이름:"+item.castname);
			console.log("==========이름:"+item.castname);
      var name= "배우_"+item.castname;
        name= name.replace(' ', '+');  // 띄어쓰기 있으면 +를 붙임.
         console.log("==========name",name);
         console.log("========name:"+name);
		 htmlContent +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[출연진]</span>";
        var idx = item.castname.indexOf(word); 
          console.log("============idx",idx);
          
        var left = item.castname.substring(0,idx);
        var bold = item.castname.substring(idx,idx+word.length);
        var right = item.castname.substring(idx+word.length);

        console.log("============left",left);
        console.log("============bold",bold);
        console.log("============right",right);
        htmlContent+=left+"<span class=\"redWord\">"+bold+"</span>"+right+"</div></a></li>"; 
		
		});
		
		 $(".textBox").html(htmlContent);
		 
		}else{
			
			var htmlContent =data.word+"에 대한 검색 결과가 없습니다.";
			$(".textBox").html(htmlContent);
		}

	},
	error : function() {
		console.log("error"); 
	}
	
	});
	
	
}



//검색창에 엔터를 쳐서 검색어를 입력하거나, 자동완성 box의 글을 선택시 필터를 db에 전달해서 아래 text로 해당하는 자료 이름 출력
function SearchList(word){
	   console.log("==========word:", word); 
	word= word.replace('+', ' '); // +를 제거
	$.ajax({
		
		url: '/searchList/'+word,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		 console.log("callBack result :",data.result); 
		 console.log("callBack result :",data); 
		if(data.result=="success"){
			
			 $(".font1").html("");
			 $(".font2").html("");
			 $(".fileListView").html("");
			 $(".castListView").html("");
			 $(".textBox").html("");
			

			var htmlContent ="";
			
		if(data.contentlist.length!=null || data.contentlist2.length!=null  ){
			//컨텐츠 리스트가 길이 0이 아닌 경우
				console.log("=====================contentlist: 존재함");
			
		 $.each(data.contentlist, function(index, item){
			
			console.log("==========아이템:"+item.pfilename);

			
			htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";
			
			
	/* 	 htmlContent +="<li>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
          var idx = item.cname.indexOf(word); 
          console.log("============idx",idx);
        var bold = item.cname.substring(0,idx+1);
        var left = item.cname.substring(idx+1);
        console.log("============bold",bold);
        console.log("============left",left);
        htmlContent+="<span class=\"redWord\">"+bold+"</span>"+left+"</div></li>"; */
		
		});
		
	
		$.each(data.contentlist2, function(index, item){
			
			
			console.log("==========아이템:"+item.pfilename);
			
			
			htmlContent +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";

			/*  htmlContent +="<li>"
	          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
	          var idx = item.cname.indexOf(word); 
	          console.log("============idx",idx);
	        var bold = item.cname.substring(0,idx+1);
	        var left = item.cname.substring(idx+1);
	        console.log("============bold",bold);
	        console.log("============left",left);
	        htmlContent+="<span class=\"redWord\">"+bold+"</span>"+left+"</div></li>";
			 */
			
			
		/* console.log("==========이름:"+item.castname);

		 htmlContent +="<li><a href=#>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[출연진]</span>";
          var idx = item.cname.indexOf(word); 
          console.log("============idx",idx);
        var bold = item.cname.substring(0,idx+1);
        var left = item.cname.substring(idx+1);
        console.log("============bold",bold);
        console.log("============left",left);
          
        htmlContent+="<span class=\"redWord\">"+bold+"</span>"+left+"</div></a></li>";  */
		
		});
		
		 $(".fileListView").html(htmlContent);
		 $(".font1").prepend("<div class=\"contentsFont\"><h2>콘텐츠</h2></div>");
		}//컨텐츠 리스트가 있을시 
		
		
		
		 if(data.castlist.length!=0){//출연진 리스트가 존재할시
				console.log("=====================castlist: 존재함");
		 var htmlContent2 = "";
			$.each(data.castlist, function(index, item){	
				console.log("==========아이템:"+item.castname);
				 var name= "배우_"+item.castname;
				name= name.replace(' ', '+');  // 띄어쓰기 있으면 +를 붙임.
				

		 		 htmlContent2 +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
		           +"<div class=\"showcname\">"+item.castname+"</div></a></li>"; 
		          
		          
				
		/* 	 htmlContent +="<li>"
	          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
	          var idx = item.cname.indexOf(word); 
	          console.log("============idx",idx);
	        var bold = item.cname.substring(0,idx+1);
	        var left = item.cname.substring(idx+1);
	        console.log("============bold",bold);
	        console.log("============left",left);
	        htmlContent+="<span class=\"redWord\">"+bold+"</span>"+left+"</div></li>"; */
			
			});
			
			
			
			 $(".castListView").html(htmlContent2);
			 $(".font2").prepend("<div class=\"contentsFont\"><h2>출연진</h2></div>");
		 }//출연진 리스트가 존재할시 끝
		 
		 
		}else{
			
			var htmlContent =data.word+"에 대한 검색 결과가 없습니다.";
			$(".fileListView").html(htmlContent2);
		}

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
.redWord{
font-weight: bold;
color: red;
}
.fileListView{
    display: flex;
    /* DISPLAY: flex; */
    flex-direction: row;
    flex-wrap: wrap;
    align-items: flex-end;
    justify-content: flex-start;
}
.fileListView li{
    padding: 0 15 15 15px;
height: 240px;
width: 170px;
}
.fileListView li img{
    height: 100%;
    width: 100%;
    }
     .contentsFont{
margin-left: 55px;
    color: white;
      font-weight: bold;
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
	<section class="showResult">

	
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

</body>
</html>
