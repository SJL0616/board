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
$(document).ready(function() {
	
	var cno =$("#cno").val();
	var sort= "ASC";
	showVList(cno, sort);//시작하면 기본 순서로 video 출력
	
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

/* onclick=\"showWatchPage("+item.vno+")\" */
function showVList(cno, sort) {//안씀

	$.ajax({
		url: '/showVList/'+cno+'/'+sort,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
			 var length= 0;
			 console.log("callBack length :",length);
			 var htmlContent ="";	
	     	$.each(data, function(index, item){
	     		
	     htmlContent +="<div class=\"episodes watchEpisodes\" >"
	          +"<a class=\"thumA\" href=\"/Watch?vno="+item.vno+"&cno="+cno+"\"><img alt=\"thumbnail\" class=\"thumbnail\" src=/display?filename="+item.vfilename+"-thumb.png width=\"150\" height=\"84\">"
	          +"<div class=\"episodesText\">"
	          +"<div class=\"text1\"><p>"+item.vfilename+"<br><span class=\"text2\" >"+item.regdate+"</span>"
	          +"</p></div></div></div></a>";
	          length++;
		})
		
		console.log("after length :",length);
		$("#episodesBar").html(htmlContent);
		$("#showLength").html(length);

	/* 		var file ="<img alt='immage' src='C:\upload\'"+data.savepath+">";
		$("#text2").html(file);  */
	},
	error : function() {
		console.log("error"); 
	}

	});//ajax
	}//showVList
</script>


<link rel="stylesheet" href="/resources/css/contentList.css" >


<head>
	<title>Home</title>
</head>
<body>

${vvo }
${cvo }
<div id="container">
  
  
    <div id="player">
 
    
        <header>
        
        <div id="playerbox">
        <video src="/display?filename=${vvo.vfilename}" id="playerBody" controls="controls"></video>
          <!--  <img src=/display?vfilename=s_${cvo.pfilename } alt="sns" class="sns" width="235" height="350">  
           
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
         -->
           
           
    </div> 
            
        </header>

    </div>
   
  <div id="contents"> 

  <input type="text" id="vno" value="${vvo.vno}">
  <input type="text" id="cno" value="${cvo.cno}">
        <section id="Videoinfo">
            <div id="tutle">
           <h2 style="font-size: 32px; color: white; margin-bottom: 10px; margin-top:33px ">${vvo.vfilename }</h2>
           <p style="font-size: 15px; margin-bottom: 25px">방송사 | 2000-00-00 | +20:20</p>
           <p style="font-size: 14px">${vvo.story}</p>
     
           </div>  
           <a href=/showcontents?cno=${cvo.cno}>
              <div id="thumbnail_group2" style="margin-top: 20px">
	              <img src=/display?filename=s_${cvo.pfilename } alt="sns" class="sns" width="160" height="230"> 
	           
	              <div id="info" style="height: 230;">
		                <ul ><!-- 컨텐츠리스트 페이지 출력 메서드 -->
		                   <li id="li2" style="font-size: 17px"><h1>${cvo.cname}</h1></li> 
		                   <li style="font-size: 12px; color:rgb(87, 87, 87) ">/${cvo.agelimit }/${cvo.end }</li> 
		                   <br>
		                   <li style="font-size: 12px; color:rgb(170, 170, 170) ">방송사  ${cvo.bc}</li> 
		                   <li style="font-size: 12px; color:rgb(170, 170, 170) ">출시   </li> 
		                </ul>
	              </div>
             </div>
          </a>
             </section>
          <section id="List" style="width: 100%; background-color: rgb(25, 25, 25); padding-top: 50px; padding-left: 0px;">
            
            <div class="buttons" id="buttons" style="border-bottom:1px solid rgb(57, 57, 57); ">
            <button class="btn start" id="episodeListBtn" style= "background-color: rgb(25, 25, 25)"  >전체 회차</button>
            <button class="btn" id="reviewListBtn" style= "background-color: rgb(25, 25, 25)" >댓글</button>
           
             </div>
             
             <!--에피소드 리스트 --> 
            <section id="episodeList" >
	            <div class="selectOreder" style="padding: 10px 0 4 0;">
	            <P class="result" >총 <span id="showLength"></span><%-- {vSize} --%>개의 에피소드</P>
	            <div class="selectOrderBtn">
	            <button type="button" class="orderBtn orderStart" id="OrderByVno"  style= "background-color: rgb(25, 25, 25)">첫회부터</button>
	            <button type="button" class="orderBtn"  class="" id="OrderByDESC"  style= "background-color: rgb(25, 25, 25)">최신회부터</button>
	            </div>
	            </div>
		            <div id="episodesBar" class="watchPageEpisodeBar">
		        
		            </div> 
	          
        
        
           </section>
           </section>
            <!-- <div class="thumbs">
             
            </div> -->
           
     
          
          
          
             <!--에피소드 리스트 --> 
           <%--  <section id="episodeList">
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
	            </div>--%>
        
        
           
           
            <!-- <div class="thumbs">
             
            </div> -->
            
    <%--     </section>
        
        <section id="reviewBox">
        <h2>${cvo.cname} 의 평점은?</h2>
        <textarea rows="3" cols="40"></textarea>
        </section> --%>
        
        
        
        
        
       <%--  <section class="infocol">
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
		   
        </section> --%>

   </div> 
    </div>
        <footer>
            <p>ⓒLee Sang-Jun 2021</p>

        </footer>
 


</body>
<footer></footer>

</html>
