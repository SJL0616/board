<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>


 <script type="text/javascript" src="/resources/js/contentList.js"></script>
 
 <script type="text/javascript">



 $(document).ready(function(){
 	var id = '${sessionScope.user.id }';
  	getMatch(id); 
 	 
 	//시작후 별 출력
 	var htmlContent="";
 	var rating= ${cvo.rating};
 	console.log("rating= :",rating);
    $("#contentRate").html(setStars(htmlContent,rating));	
 	
 	showRList();
 	
 	//List 안의 메뉴BOX 보이기 설정
 	$(".reviewBox").hide();
 	$(".castList").hide();
 	$(".mainImg").hide();
 	
 	$(".start").addClass('active')
     $(this).removeClass('start')
     
     $(".showBtn").addClass('active')
     
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
 	

  $("#episodeListBtn").on("click", function (event) {
 	
 	var cno = $("#cno").val();
 	$(".reviewBox").fadeOut(500);
 	$(".castList").fadeOut(500);
 	$(".mainImg").fadeOut(500);

 	
 	fadeIn("#episodeList",event);
 	
 })

 $("#reviewListBtn").on("click", function () {
 	
  	var cno = $("#cno").val();
 	$("#episodeList").fadeOut(500);
 	$(".castList").fadeOut(500);
 	$(".mainImg").fadeOut(500);
 	
 	fadeIn(".reviewBox",event);
 })
 $("#castListBtn").on("click", function () {
 	
  	var cno = $("#cno").val();
 	$(".reviewBox").fadeOut(500);
 	$("#episodeList").fadeOut(500);
 	$(".mainImg").fadeOut(500);

 	fadeIn(".castList",event);
 })

 $("#showMainImg").on("click", function () {
 	
  	var cno = $("#cno").val();
 	$(".reviewBox").fadeOut(500);
 	$("#episodeList").fadeOut(500);
 	$(".castList").fadeOut(500);

 	fadeIn(".mainImg",event);
 })
 function fadeIn(name,event) {//800만큼 기다린 후에(.delay) animation 실행.
 	$(name).delay(500).fadeIn(500);
 }
 	
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
 	
 	     var textInput = document.querySelector('.textInput');
 	     var lengthWblank = document.querySelector('.lengthWblank');

 	     document.querySelector('.textInput').addEventListener("input",function() {
 	    	 console.log("==============" +textInput.value.length);
 	    	
 	     	//키보드로 입력할때 실행하는 이벤트.
 	     	 lengthWblank.innerHTML = textInput.value.length + " 자 / 300 Byte" ;

 	     });
 	
 });

 	


</script> 


<link rel="stylesheet" href="/resources/css/contentList.css" >


<head>
	<title>Home</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<%-- ${cvo }
${vvo } --%>
<div id="container">
<%-- --%>
   <div id="poster">
	   <c:choose>
		   <c:when test='${cvo.pfilename2 !=null }' >
		    <div id="posterbox" style="background-image: url('/display?filename=${cvo.pfilename2 }');">   </div> 
		   </c:when>
		   
		   <c:otherwise>
		    <div id="posterbox" style="background-image: url('/display?filename=${cvo.pfilename }');">   </div> 
		   </c:otherwise>
	   </c:choose>
   <!--  <img src=/display?filename=${cvo.pfilename } alt="backimg" id="posterImg"  height="100%" width="100%" > -->
            <div class="posterFilter"></div>
        <header id="contentHeader">
        <div id="thumbnail_group">
           <img src=/display?filename=${cvo.pfilename } alt="sns" class="sns" width="235" height="350"> 
           
                <div id="info">
                <ul>
                   <li>${cvo.bc}/${cvo.agelimit }/${cvo.end }</li> 
                   <li id="li2"><h1>${cvo.cname}</h1></li> 
                   <br>
                   <li>${cvo.genre}</li> 
                   <li>평점 ${cvo.rating}</li> 
                  
                   <li id="contentRate" class="rateBox">+평점
                  
                   </li> 
                 
                   <li></li> 
                </ul>
               </div>
      
           
          </div>
          <div class="watchButtonBox">
           <c:forEach items="${vvo}" var="vvo" begin="0" end="0" step="1" varStatus="status">
                    <!-- 나중에는 forEach문 안쓰고 user테이블에 저장해둔 vno값을 user.vno로 불러오자. -->
	             <a class="MainButton"  href=/Watch?vno=${vvo.vno}&cno=${cvo.cno} >
                   <div class="watchButton"> 1화 보기  </div>
                 </a> 
                
	            
	       </c:forEach>
          </div>
        </header>
  </div>    
  <div id="contents"> 
  <input type="text" id="cno" value="${cvo.cno}" hidden="">
        <section id="List">
            
            <div class="buttons" id="buttons">
            <button class="btn start" id="episodeListBtn" >에피소드</button>
            <button class="btn" id="reviewListBtn" >리뷰</button>
            <button class="btn" id="castListBtn">출연진 소개</button>
            <button class="btn" id="showMainImg">공식이미지</button>
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
	             <c:forEach items="${vvo}" var="vvo" begin="0" step="1" varStatus="i">
	             		             
		         
		             
	             <div class="episodes" >
	             <a  class="thumA" href=/Watch?vno=${vvo.vno}&cno=${cvo.cno}>

	            <img alt="thumbnail" class="thumbnail" src=/display?filename=${vvo.vfilename}-thumb.png width="120" height="67">
	            <div class="episodesText">
	            <div class="text1"><p>${cvo.cname}<br>
	            <span class=text${vvo.vno} ></span><br>
	            <span class="text2" >2021/05/28</span></p></div>
	            </div>
	             
	            </div></a> 
	                <script type="text/javascript">
	                //.mp4를 filename에서 떼어내기 위해,  indexOf로 "." 까지 길이를 구하고, 그 값(인덱스)을 subString 끝(end) 지점에 넣고 0(시작점)부터 떼어온 filename을 
	                //var name 변수에 넣어서 text+vno span 클래스에 넣음.
	                   var vno= '${vvo.vno}';
			            var fileName= '${vvo.vfilename}';

			          var name1 = fileName.replaceAll("_"," ");
			          var name2 = name1.replaceAll(".mp4"," ");
			          console.log("============name",name2);
			          console.log("============.text+vno",".text"+vno);

		          $(".text"+vno).text(name2);

		             </script>
	            
	            </c:forEach>
	            </div>
            </section>
        
           
           
            <!-- <div class="thumbs">
             
            </div> -->
            
               <section class="reviewBox">
                 <form name="reviewform" class="reviewform" method="post" action="/save">
				        
				    <h2 class="title_star"> ${cvo.cname}의 별점과 리뷰를 남겨주세요.</h2>
			        
			       
			        
			            <div class="review_rating">
				            
				            <div class="rating">
				                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				                 <input type="checkbox" name="rating" id="rating0.5" value="1" class="rate_radio half" title="0.5점" hidden="hidden">
				                <label for="rating0.5"></label>
				                <input type="checkbox" name="rating" id="rating1" value="2" class="rate_radio right" title="1점" hidden="hidden">
				                <label for="rating1"></label>
				                <input type="checkbox" name="rating" id="rating1.5" value="3" class="rate_radio half" title="1.5점" hidden="hidden">
				                <label for="rating1.5"></label>
				                <input type="checkbox" name="rating" id="rating2" value="4" class="rate_radio right" title="2점" hidden="hidden">
				                <label for="rating2"></label>
				                <input type="checkbox" name="rating" id="rating2.5" value="5" class="rate_radio half" title="2.5점" hidden="hidden">
				                <label for="rating2.5"></label>
				                <input type="checkbox" name="rating" id="rating3" value="6" class="rate_radio right" title="3점" hidden="hidden">
				                <label for="rating3"></label>
				                <input type="checkbox" name="rating" id="rating3.5" value="7" class="rate_radio half" title="3.5점" hidden="hidden">
				                <label for="rating3.5"></label>
				                <input type="checkbox" name="rating" id="rating4" value="8" class="rate_radio right" title="4점" hidden="hidden">
				                <label for="rating4"></label>
				                <input type="checkbox" name="rating" id="rating4.5" value="9" class="rate_radio half" title="4.5점" hidden="hidden">
				                <label for="rating4.5"></label>
				                <input type="checkbox" name="rating" id="rating5" value="10" class="rate_radio right" title="5점" hidden="hidden">
				                <label for="rating5"></label>
				                <input type="text" id="rating" hidden="">
				                
				               
				            </div>
				            <div class="warning_msg">( 별점을 선택해 주세요. )</div>
				            <br>
				           <input type="text" id="userName" value="${sessionScope.user.name}" hidden="hiiden">
				                <input type="text" id="userId" value="${sessionScope.user.id}" hidden="hiiden">
				        </div>
				        <div class="textBox">
					        <textarea placeholder="솔직한 평가 또는 작품의 매력을 알려주세요 (스토리, 인물, OST 등)" id="content" class="textInput" maxlength="300"></textarea>
					        <div class="reviewBtns">
						        <span class="lengthWblank">0 자 / 300 Byte</span>
						        <input id="SubmitBtn" class="reviewSubmitBtn" type="button"value="작성" onclick="sendReview()">
				            </div>
		 	             </div>
				        </form>
				        
				        <div id="showReview" >
				        </div>
				        
				        <div id="pagingBox">
				        <input type="text" id="pageNum" value="1" hidden="hidden">
				        <ul class="pagination" id="pagingUl">
				      <!--   <li class="first"><a href="#">⟨</a></li>
	
				        <li href="#" class="last">⟩</li> -->
				        </ul>
				        
				        </div>
			
			        
		       </section>
		       
		       <section class="castList">
		       
		        <section id="episodeList" >
	           <%--  <div class="selectOreder" style="padding: 10px 0 4 0;">
	            <P class="result" >총 <span id="showLength"></span>{vSize}개의 에피소드</P>
	            <div class="selectOrderBtn">
	            <button type="button" class="orderBtn orderStart" id="OrderByVno"  style= "background-color: rgb(25, 25, 25)">첫회부터</button>
	            <button type="button" class="orderBtn"  class="" id="OrderByDESC"  style= "background-color: rgb(25, 25, 25)">최신회부터</button>
	            </div>
	            </div> --%>
		        <div id="episodesBar" class="CastBar">
		             <c:forEach items="${castVo}" var="cvo">

		              
				        <div class="episodes actors">
					         <a class="thumA" href="/search2?castname=${cvo.castname}">
						         <div class="castImg">
						       
						         <img alt=\"thumbnail\" class="thumbnail actorImg" src="/display?filename=${cvo.profileImgName}">
						         </div>
						         <div class=\"episodesText\">
						         <div class="text1">
						         <p>${cvo.castname }<br>
						         <br>
						         <span class="text2" >${cvo.cast }</span></p>
						         </div>
						         </div>
					         </div>
					         </a>
					        
		        
		             </c:forEach>
		        </div> 
	          </section>
         </section><!-- CastList 섹션끝 -->
         
          <section class="mainImg">
          <div id="mainbox" <%-- style="background-image: url('/display?filename=${cvo.pfilename }')" --%>>
                <img alt="" src=/display?filename=${cvo.pfilename }>
          </div>
          
          
          </section>
             
		       
		     
            
           
        </section><!-- LIST 섹션끝 -->
        
     
        
        
        
        
        
        <section class="infocol">
            <div class="story">
               <h2>줄거리</h2>
                <P class="storyText">${cvo.story}</P> 
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
   
    </div>
  
     <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include> 
            <p>ⓒLee Sang-Jun 2021</p>

     

</body>
<footer></footer>

</html>
