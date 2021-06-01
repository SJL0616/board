<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>


 <script type="text/javascript" src="/resources/js/contentList.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
	$(".start").addClass('active')
    $(this).removeClass('start')
	/* showAllList();	 */
	
	$(".btn").on("click", function (){

		    	 $(this).removeClass('btn')
		    	  $('.active').addClass('btn')
		    	    $('.active').removeClass('active')//다른 active 클래스 가지고 있는 클래스 삭제.
		    	    $('.active').removeClass('start')
		    	 $(this).addClass('active') 
	});
	
	
	$(".orderStart").addClass('orderActive')//첫회부터, 최신회부터 class 처리 
 
    
		$(".orderBtn").on("click", function (){
  
		    	 $(this).removeClass('orderBtn')
		    	  $('.orderActive').addClass('orderBtn')
		    	    $('.orderActive').removeClass('orderActive')
		    	      $(this).addClass('orderActive')    	
	});
	

 $("#episodeListBtn").on("click", function () {
	
	var cno = $("#cno").val();
	$("#reviewBox").hide();
	$("#episodeList").show();
	
	/* showVList(cno); */

})

$("#reviewListBtn").on("click", function () {
	
 	var cno = $("#cno").val();
	$("#reviewBox").show();
	$("#episodeList").hide();


})
	
          $("#OrderByVno").on("click", function () {
        	  var cno = $("#cno").val(); 
        	 var sort = "ASC";
        	showVList(cno, sort);	

	            });         
	     $("#OrderByDESC").on("click", function () {
	    	 var cno = $("#cno").val();
             var sort = "DESC";
            
             showVList(cno, sort);
	            });            
	

	
	
});

	

 

	
function showVList(cno, sort) {//안씀

$.ajax({
	url: '/showVList/'+cno+'/'+sort,
	method: 'get',
	dataType : 'json',
	
success: function(data) {
	console.log("callBack result :",data);
	
	
	var htmlContent ="";
	

		
		 htmlContent ; 
		 
		 var htmlContent ="";	
     	$.each(data, function(index, item){
     		
     htmlContent +="<div class=\"episodes\" onclick=\"showWatchPage("+item.vno+")\">"
          +"<img alt=\"thumbnail\" class=\"thumbnail\" src=/display?filename="+item.vfilename+"-thumb.png width=\"120\" height=\"67\">"
          +"<div class=\"episodesText\">"
          +"<div class=\"text1\"><p><br>"+item.vfilename+"<br><span class=\"text2\" >"+item.regdate+"</span>"
          +"</p></div></div></div>";
	})
	
	
	$("#episodesBar").html(htmlContent);
		 
	

	console.log($(".fileListView").html(htmlContent));
	
	$(".fileListView").html(htmlContent);
/* 		var file ="<img alt='immage' src='C:\upload\'"+data.savepath+">";
	$("#text2").html(file);  */
},
error : function() {
	console.log("error"); 
}

});//ajax
}//showVList

function  showWatchPage(vno){
	var cno = $("#cno").val();
	console.log(vno);
	console.log(cno);

	location.href="/Watch?vno="+vno+"&cno="+cno;
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
  <input type="text" id="cno" value="${cvo.cno}">
        <section id="List">
            
            <div class="buttons" id="buttons">
            <button class="btn start" id="episodeListBtn" >에피소드</button>
            <button class="btn" id="reviewListBtn" >리뷰</button>
            <button class="btn">프로그램 소개</button>
            <button class="btn">공식이미지</button>
             </div>
             
             <!--에피소드 리스트 --> 
            <section id="episodeList">
	            <div class="selectOreder">
	            <P class="result" >총 ${vSize}개의 에피소드</P>
	            <div class="selectOrderBtn">
	            <button type="button" class="orderBtn orderStart" id="OrderByVno">첫회부터</button>
	            <button type="button" class="orderBtn"  class="" id="OrderByDESC">최신회부터</button>
	            </div>
	            </div>
	           
	            <div id="episodesBar">
	             <c:forEach items="${vvo}" var="vvo">
	             <div class="episodes" onclick="showWatchPage(${vvo.vno})">
	         
	            <img alt="thumbnail" class="thumbnail" src=/display?filename=${vvo.vfilename}-thumb.png width="120" height="67">
	            <div class="episodesText">
	            <div class="text1"><p>${cvo.cname}<br>${vvo.vfilename}<br><span class="text2" >2021/05/28</span></p></div>
	            </div>
	             
	            </div>  
	            
	            </c:forEach>
	            </div>
            </section>
        
           
           
            <!-- <div class="thumbs">
             
            </div> -->
            
        </section>
        
        <section id="reviewBox">
        <h2>${cvo.cname} 의 평점은?</h2>
        <textarea rows="3" cols="40"></textarea>
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
