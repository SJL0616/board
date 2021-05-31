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
$(document).ready(function(){
	$(".start").addClass('active')
    $(this).removeClass('start')
	/* showAllList();	 */
	$(".btn").on("click", function () {
		
		

		/*   if ($(this).hasClass("active") ) {
		        $(this).removeClass('active')
		          $(this).addClass('btn')
		     }else{   */ 
		    	 
		    	 $(this).removeClass('btn')
		    	
		    	  $('.active').addClass('btn')
		    	    $('.active').removeClass('active')
		    	    $('.active').removeClass('start')
		    	 $(this).addClass('active') 
		     
		

	});

});




 
	
	
function showAllList(cno) {

$.ajax({
	url: '/getAllFileList/',
	method: 'get',
	dataType : 'json',
	
success: function(data) {
	console.log("callBack result :",data);
	
	
	var htmlContent ="";
	$.each(data, function(index, item){
		console.log("==========아이템:"+item.pfilename);
		console.log("==========인코딩전:"+item.s_savepath);
		var s_savePath = encodeURIComponent(item.s_savepath);
		var savePath = encodeURIComponent(item.savepath);
		
		 htmlContent ; 
		/*  if(item.filetype == "Y"){ */
			
				console.log("==========인코딩후:"+savePath);
			 htmlContent  +="<li><a href=/showcontents?filename="+item.pfilename+">"
			          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
			          +item.cname+"</a>";
			        
					
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


<link rel="stylesheet" href="/resources/css/contentList.css" >


<head>
	<title>Home</title>
</head>
<body>
${cvo }
${vvo }
<div id="container">
   <div id="poster">
   <div id="posterbox">
    <img src=/display?filename=${cvo.pfilename } alt="backimg" id="posterImg"  height="100%" width="100%" >
    </div> 
        <header>
        <div id="thumbnail_group">
           <img src=/display?filename=s_${cvo.pfilename } alt="sns" class="sns" width="235" height="350"> 
           
                <div id="info">
                <ul>
                   <li>${cvo.bc}/${cvo.agelimit }/${cvo.end }</li> 
                   <li id="li2"><h1>${cvo.cname}</h1></li> 
                   <br>
                   <li>+장르</li> 
                   <li>+평점</li> 
                   <li>+좋아요</li> 
                </ul>
               </div>
         
           
          </div>
        </header>
  </div>    
  <div id="contents"> 
  <input type="text" value="${cvo.cno}">
        <section id="List">
            
            <div class="buttons" id="buttons">
            <button class="btn start">에피소드</button>
            <button class="btn">리뷰</button>
            <button class="btn">프로그램 소개</button>
            <button class="btn">공식이미지</button>
             </div>
             
             <!--에피소드 리스트 --> 
            <div class="selectOreder">
            <P class="result" >총 ~개의 에피소드</P>
            <div class="selectOrderBtn">
            <button type="button" class="active">첫회부터</button>
            <button class="end" type="button" class="">최신회부터</button>
            </div>
            </div>
           
            
             <c:forEach items="${vvo}" var="vvo">
             <div class="episodes">
            <img alt="thumbnail" class="thumbnail" src=/display?filename=${vvo.vfilename}-thumb.png width="120" height="67">
            <div class="episodesText">
            <div class="text1"><p>${cvo.cname}<br>${vvo.vfilename}<br><span class="text2" >2021/05/28</span></p></div>
            </div>
            </div>
            </c:forEach>
        
           
           
            <!-- <div class="thumbs">
             
            </div> -->
            
        </section>
        
        
        
        
        
        <section class="infocol">
            <div class="story">
               <h2>줄거리</h2>
                <P>${cvo.story}</P> 
            </div>
            <div class="cast">
                <h2>제작정보</h2>
                <P>${cvo.cast}</P>
            </div>
            <div class="tags">
		            <div class="text">
		                <h2>태그</h2>
		                <p class="sharp">${cvo.tags}</p>
		             
		
		            </div>
		    </div>
		   
        </section>
   
   </div> 
        <footer>
            <p>ⓒLee Sang-Jun 2021</p>

        </footer>
    </div>


</body>
<footer></footer>

</html>
