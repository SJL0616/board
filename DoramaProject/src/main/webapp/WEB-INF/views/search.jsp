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

//필터를 db에 전달해서 아래 자동완성 box에 text로 해당하는 자료 이름 출력
function getSearchedList(word2){
	   console.log("==========getSearchedList:"); 
	   console.log("==========word:", word2); 
	   
	$.ajax({
		
		url: '/getSearchedList/'+word2,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		 console.log("callBack result :",data.result); 
		 console.log("callBack result :",data); 
		 console.log("callBack result :",data.result=="success"); 
		if(data.result=="success"){
			console.log("success proccess start "); 
			var htmlContent ="";
		$.each(data.contentlist, function(index, item){
			
			
			console.log("==========아이템:"+item.pfilename);
			console.log("==========아이템:"+item.castname);
		var name= item.cname;
	        name= name.replaceAll(' ', '+'); 
		 htmlContent +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
          console.log("============word.length",word2.length);
          var idx = item.cname.indexOf(word2); 

          console.log("============idx",idx);

        var left = item.cname.substring(0,idx);
        var bold =item.cname.substring(idx,idx+word2.length);
        var right = item.cname.substring(idx+word2.length);
        
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
        var idx = item.castname.indexOf(word2); 
          console.log("============idx",idx);
          
        var left = item.castname.substring(0,idx);
        var bold = item.castname.substring(idx,idx+word2.length);
        var right = item.castname.substring(idx+word2.length);

        console.log("============left",left);
        console.log("============bold",bold);
        console.log("============right",right);
        htmlContent+=left+"<span class=\"redWord\">"+bold+"</span>"+right+"</div></a></li>"; 
		
		});
		console.log("========textBox 생성됨:");
		$(".startBox").addClass("textBox");
		 $(".textBox").html(htmlContent);
		 $(".textBox").removeClass("startBox");
		 
		}else{
			 $(".textBox").addClass("startBox");
			 $(".startBox").removeClass("textBox"); 
			
			console.log("error proccess start "); 
			


		}

	},
	error : function() {
		 $(".textBox").addClass("startBox");
		 $(".startBox").removeClass("textBox"); 
		console.log("error"); 
	}
	
	});
	
	
}



//검색창에 엔터를 쳐서 검색어를 입력하거나, 자동완성 box의 글을 선택시 필터를 db에 전달해서 아래 text로 해당하는 자료 이름 출력
function SearchList(word){
	console.log("=====================SearchList  시작:");
	$("#castname").val("");
	$(".textBox").html("");
	$(".showtextBox").html("");
	console.log("========textBox 제거됨:");
	 $(".textBox").addClass("startBox3");
	 $(".startBox3").removeClass("textBox");
	
	

	   console.log("==========word:", word); 
	word= word.replaceAll('+', ' '); // +를 제거
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

			

			var htmlContent ="";

		if(data.contentlist.length!=0 || data.contentlist2!=null ){
			//컨텐츠 리스트가 길이 0이 아닌 경우
				console.log("=====================contentlist: 존재함");
			
		 $.each(data.contentlist, function(index, item){
			
			console.log("==========아이템:"+item.pfilename);

			
			htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";
			
			

		
		});
		
	
		$.each(data.contentlist2, function(index, item){
			
			
			console.log("==========아이템:"+item.pfilename);
			
			
			htmlContent +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";

			
		
		});
		
		 $(".fileListView").html(htmlContent);
		 $(".font1").prepend("<div class=\"contentsFont\"><h2>콘텐츠</h2></div>");
		/*  $(".showtextBox").html(""); */
		
		 
		 
		}//컨텐츠 리스트가 있을시 
		
		
		console.log("data.castlist.length!=0",data.castlist.length!=0);
		 if(data.castlist.length!=0){//출연진 리스트가 존재할시
				console.log("=====================castlist: 존재함");
		 var htmlContent2 = "";
			$.each(data.castlist, function(index, item){	
				console.log("==========아이템:"+item.castname);
				 var name= "배우_"+item.castname;
				name= name.replace(' ', '+');  // 띄어쓰기 있으면 +를 붙임.
				

		 		 htmlContent2 +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
		           +"<div class=\"showcname\">"+item.castname+"</div></a></li>"; 
		          
		          
				
		
			
			});
			
			
			 
			 $(".castListView").html(htmlContent2);
			 $(".font2").prepend("<div class=\"contentsFont\"><h2>출연진</h2></div>");
			
			 
		 }//출연진 리스트가 존재할시 끝

		
		 console.log("=====================SearchList  끝:");
		}else{
			

			var htmlContent ="";
			htmlContent+="<div class=\"redWordBox \"><div><img src=/resources/icon_information_warning.png></div>"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색 결과가 없습니다.</div></div>";
			$(".fileListView").html(htmlContent);

		}
		 console.log("=====================word:",word);
		 console.log("=====================name:",name);
		 $("#textInput").val("");
			
		var resultHtml="";
			resultHtml+="<div class=\"redWordBox successRe\">"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색결과가<span class=\"redWord\"> "+data.length+"건 </span>"
				+"있습니다.</div></div>";

		$(".x").html(resultHtml);
		
		 $(".redWordBox2").addClass("redWordBox3");//상세보기창 검색시
		
		$(".redWordBox3").html(resultHtml);
		 $(".x").addClass("redWordBox3");//일반 검색창 검색시
		 
		 
		 $(".redWordBox3").removeClass("redWordBox2");
		 $(".redWordBox3").removeClass("x");


	},
	error : function() {
		console.log("error");
		 $("#textInput").val("");
		 $(".font1").html("");
		 $(".font2").html("");
		 $(".fileListView").html("");
		 $(".castListView").html("");
		 $(".x").addClass("redWordBox2");
		 $(".redWordBox2").removeClass("x");
		 var htmlContent ="";
			htmlContent+="<div class=\"redWordBox\"><div><img src=/resources/icon_information_warning.png></div>"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색 결과가 없습니다.</div></div>";
			$(".redWordBox2").html(htmlContent);

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
/* height: 100%; */
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

    display: flex;
    background-color: rgb(11, 11, 11);
    align-items: center;
    flex-direction: column;
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
    list-style: none;
    width: 500px;
 /*    height: 100px; */
    /* transform: translateX(-50%); */
    background-color: rgb(37, 37, 37);
    border-radius: 10px;
   padding: 40px 80px;
    margin-top: 10px;
    margin-left: -60;
    margin-bottom: 50px;
}
.searchBar .textBox li{
font-size:17px;
 margin: 15px;
}

.redWord{
font-weight: bold;
 color: rgb(238, 65, 53);
}
.showResult{
max-width: 1100px;
    margin: 0px auto;
    /* width: 70%; */
    display: flex;
    flex-direction: column;
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
    .searchInputBox{
    margin-left: -50;
     height: 60px;
    display: flex;
    align-items: flex-end;
    padding: 20px;
    }
    .fontbox2{
    margin-top: 15px;
    }
    
.redWordBox{
    color: rgb(87, 87, 87);
    display: flex;
    flex-direction: column;
    align-items: center;
    }
    .redWordBox img{
   margin-bottom: 15; 
    }
    .showend{
        margin-top: 6px;
    font-size: 14px;
    }
    
    .redWordBox2{
    position: relative;
    top: 200px;
    
/*         height: 70%;
    width: 100%;
    display: flex;
    align-items: center;
    align-content: flex-end;
   justify-content: space-around; */
    }
    .castListView li {
    background-color: rgb(37, 37, 37);
    padding: 12px 20px;
    border-radius: 26px;
    font-size: 18px;
    font-weight: bold;
    min-width: 200px;
    text-align: center;
    margin-left:20px;
        MARGIN-BOTTOM: 20PX;
    width: 200px;
}
  .castListView{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.redWordBox3{
      margin-bottom: -15px;
    height: 150px;
    font-size: 24px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    
    
    }
    
.redWordBox3 .successRe{
color:rgb(170, 170, 170);
}
.startBox{
    width: 580px;
    background-color: rgb(37, 37, 37);
    border-radius: 10px;
    padding: 40px;
    margin-top: 10px;
    margin-left: -60;
    margin-bottom: 50px;
}

img.logoImg {
    /* margin-left: 15px;
    }
</style>
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
