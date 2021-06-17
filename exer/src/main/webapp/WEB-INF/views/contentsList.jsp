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

		showAllList();	


});

function showAllList() {

	$.ajax({
		url: '/getAllFileList/',
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
		
		var length = data.length;
		$(".contentN").text(length);
		var htmlContent ="";
		$.each(data.list, function(index, item){
			console.log("==========아이템:"+item.pfilename);
			console.log("==========인코딩전:"+item.s_savepath);
			var s_savePath = encodeURIComponent(item.s_savepath);
			var savePath = encodeURIComponent(item.savepath);
			
			 htmlContent ; 
			/*  if(item.filetype == "Y"){ */
				
					console.log("==========인코딩후:"+savePath);
				 htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
				          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
				          +"<div class=\"showend\">"+item.end+"</div>"
				          +"<div class=\"showcname\">"+item.cname+"</div></a>";
				        
						
			/*  }else{
				 htmlContent +="<li>"+item.filename
				 +"<a href=/download?filename="+savePath+"></li>"; 
						 //파일네임에는 파라메터로 넘길수없는 데이터가 있어서 인코딩이 필요.
			 } */
		
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


<style>
body{
	background-color: rgb(25, 25, 25);
}
#contents{

color:rgb(170, 170, 170);

/* border: 2px solid white;    */
margin: 0 auto;
width: 1100px;
height: 100%;

}
.filterList{
width: 200px;
    background-color: rgb(37, 37, 37);
    padding: 40px 20px;
    height: 100%;
    /* width: 400px; */
    float: left;
}

.fileListView {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
.fileListView li{

overflow: hidden;
    width: 170px;
    width: 170;
    padding: 0 0 80px 0;
}
.fileListView li img{
height: 100%;
    width: 100%;
}
.fontBox {
    display: flex;
    justify-content: space-between;
    padding: 40px 0 10px 40px;
}
.fontBox .ShowCnum{
 color: white;
}

.fontBox select#selectOrder {
    color: rgb(170, 170, 170);
    background-color: transparent;
    border: transparent;
}
.showend{
    margin-top: 12px;
    font-size: 14px;
}
.showcname{
    margin-top: 3px;
    font-weight: bold;

}
.titlebar {
    display: flex;
    justify-content: space-between;
    height: 20px;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid rgb(57, 57, 57);
}

</style>
<head>
	<title>Home</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>

<div id="container">

<div id="contents">
    <section class="filterList">
 <div class="titlebar"><h1>필터</h1><button type="button">초기화</button></div>
    
    
    </section>



	<section id="contentsList">
	<div class="fontBox">
	  <div class="ShowCnum">총<span class="contentN"></span> 개의 작품이 있습니다.</div>
	  
	  <div class="selectBox">
	  <select id="selectOrder">
	  <option>최신순</option>
	  <option>방영일순</option>
	  <option>인기순</option>
	  <option>가나다순</option>
	  </select>
	  
	  </div>
	</div>
	
	
	
	<div>
	 <ul class="fileListView">
	 
	 
	 </ul>
	
	</div>
	</section>


</div>



</div>
<!--   <div >
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성시간</th>
                                        <th>수정시간</th>
                                      
                                    </tr>
                                    <tr>
                                    
                                    </tr>
                                    </thead>
                                    </table>
                                    </div> -->
</body>
</html>
