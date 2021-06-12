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
	showReply();
	$("#reviewBox").hide();
	
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
	
	     var textInput = document.querySelector('.textInput');
	     var lengthWblank = document.querySelector('.lengthWblank');

	     document.querySelector('.textInput').addEventListener("input",function(){
	    	 console.log("==============" +textInput.value.length);
	    	
	     	//키보드로 입력할때 실행하는 이벤트.
	     	 lengthWblank.innerHTML = textInput.value.length + " 자 / 300 Byte" ;

	     });
	    
	     $(".Re_replyBtn").on("click",function(){
	    
	     });
	
	  

});

function setRe_rno(rno) {
	
	 console.log("==============Re_replyBtn activated======");

	/* $("#re_rno").val(rno); */
	//댓글-답글달기 BOX를 DIV에 삽입. + 인풋 텍스트에리어 rno추가로 fuction이 움직이게 설정.
		var htmlContent="";
	
	htmlContent+="<div class=\"oneReview\" ><div class=\"re_replyIcon\"><img src=\"resources/icon_re_reply.png\"></div>"
      +"<div class=\"textBox\">"
      +"<textarea placeholder=\"댓글 내용을 입력해 주세요.\" id=\"content\" class=\"Re_textInput"+rno+" textInput\" maxlength=\"300\"></textarea>"
      +"<div class=\"reviewBtns\">"
	  +"<span class=\"Re_lengthWblank"+rno+"\">0 자 / 300 Byte</span>"
	  +"<input id=\"SubmitBtn\" class=\"reviewSubmitBtn\" type=\"button\"value=\"작성\" onclick=\"sendRe_reply("+rno+")\">"
      +"</div>";
	
      $(".re_replyBox"+rno).html(htmlContent);
	
	
	//해당 인풋에리어에 function적용. 
	
 	 var Re_textInput = document.querySelector('.Re_textInput'+rno);
     var Re_lengthWblank = document.querySelector('.Re_lengthWblank'+rno);
     
     //댓글의 답글 글자수 세는 이벤트리스너
     document.querySelector('.Re_textInput'+rno).addEventListener("input",function(){
    	 console.log("==============" +Re_textInput.value.length);
    	
     	//키보드로 입력할때 실행하는 이벤트.
     	 Re_lengthWblank.innerHTML = Re_textInput.value.length + " 자 / 300 Byte" ;

     }); 
     
     
   //+답글달기에서 보내기 누르면 RE_RNO값 조정.
     
}

function sendRe_reply(rno){
	
	 $("#re_rno").val(rno);
	sendReply(rno);
}

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
	
	function sendReply(rno) {
		
		var replydate= null;
		if(rno==null){ 
		 replydate = {
				vno :$("#vno").val(),
				content :$("#content").val(),
				writer : $("#userName").val(),
				id : $("#userId").val(),
				re_rno : $("#re_rno").val(),
		};
		}else{
			 replydate = {
					vno :$("#vno").val(),
					content :$(".Re_textInput"+rno).val(),
					writer : $("#userName").val(),
					id : $("#userId").val(),
					re_rno : $("#re_rno").val(),
			};	
		}
		console.log("===================obj",replydate);
		console.log("===================obj",replydate.re_rno);
		console.log("===================json",JSON.stringify(replydate));
	 
			
			$.ajax({
				url : '/replyInsert',
				method : 'post',
				dataType :'json',
				
				//서버에게 보낼 때는 데이터형식 정의.
				data :JSON.stringify(replydate),
				contentType: 'application/json; charset=UTF-8',
				
				success: function(data, status) {
					console.log(data);
					if(data.result == "success"){
						alert("입력완료");
						 showReply(); 
				}else{
						alert("입력중 오류가 발생했습니다.");
					}

				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
			
		//insert
	  
	  
}//reply insert






function showReply() {//안씀

	  var vno =$("#vno").val();
	 var pageNum =$("#pageNum").val();
	  
	  $.ajax({
	  	url: '/getReplyList/'+vno +'/'+pageNum, 
	  	method: 'get',
	  	dataType : 'json',
	  	
	  	success: function(data, status){
			console.log(data);
			console.log(data.rlist);
			if(data.result == "success"){
				
				$("#reviewListBtn").text("댓글(" +data.rCount+ ")");
				
				
				var PagingHtml="";
				var PagingHtml2="";
				var PagingHtml3="";
	      		var j =0;//실제 마지막페이지가 lastPage와 같은 형우 1로 함. 
	      		var x =0;//시작페이지 설정 로직에 필요한 변수
				PagingHtml+="<li class=\"first\"><a href=\"#\" onclick=showReview("+data.cri.startPage+")>⟨</a></li>";
				
				PagingHtml3+="<li><a href=\"#\"onclick=showReview("+data.cri.lastPage+") class=\"last\">⟩ </a></li>"; 
				console.log("=====cri"+data.cri.startPage);
				
				
				if(data.cri.lastPage==data.cri.realLastPage){j=0;}else{j=1;}
				if(data.cri.pageNum<=10){x=0;}else{x=1;}
				
				for(var i =(data.cri.startPage+x); i<=(data.cri.lastPage-j);i++){
					if(i==data.cri.pageNum){
						PagingHtml2+="<a href=\"#\" onclick=showReview("+i+")><li class=\"nowPage\">"+i+"</li></a>";	
						}else{
							PagingHtml2+="<a href=\"#\" onclick=showReview("+i+")><li>"+i+"</li></a>";	
						}
					}
					

				 PagingHtml= PagingHtml+PagingHtml2+PagingHtml3;
				 $("#pagingUl").html(PagingHtml); 
				
			
				console.log("=====item");
				
				 	
						$.each(data.rlist, function(index, item){
					
							var htmlContent="";
							var Re_replayContent="";
							
							console.log("=====item",item);
							console.log("==============item.re_rno",item.re_rno);
							

						     htmlContent +="<div class=\"showReview\"><div class=\"oneReview\" >"
						     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
						     +"<div class=\"RText\">"
						     +"<div class=\"Rwriter\">"+item.writer+"</div>"

						     +"<div class=\"Rcontent\">"+item.content+"</div>"
						     +"<div class=\"RDate\">"+item.regdate+"<button class=\"Re_replyBtn\" onclick=\"setRe_rno("+item.rno+")\">댓글쓰기</button></div></div></div>"
						     +"<div class=\"re_replyBox"+item.rno+"\"></div>"
						     +"<div class=\"re_replyContent"+item.rno+"\"></div></div>";
		
						     console.log("=====htmlContent",htmlContent);
							 $("#showReply").append(htmlContent);
							});
						
						 
							 showRe_reply();
						
						   
			    		
			
					
				
			}else{
				$("#showReview").html("입력중 오류가 발생했습니다.");
			}
	  	},
		error : function(xhr, status, error) {
			console.log(error);
		}

	  });//ajax
	  }//showRList
	  
	  
	  function showRe_reply() {
		  
		  $.ajax({
			  	url: '/getRe_reply/', 
			  	method: 'get',
			  	dataType : 'json',
			  	
			  	success: function(data, status){
					console.log(data);
					console.log(data.rlist);
					if(data.result == "success"){

						
			/* 			var PagingHtml="";
						var PagingHtml2="";
						var PagingHtml3="";
			      		var j =0;//실제 마지막페이지가 lastPage와 같은 형우 1로 함. 
			      		var x =0;//시작페이지 설정 로직에 필요한 변수
						PagingHtml+="<li class=\"first\"><a href=\"#\" onclick=showReview("+data.cri.startPage+")>⟨</a></li>";
						
						PagingHtml3+="<li><a href=\"#\"onclick=showReview("+data.cri.lastPage+") class=\"last\">⟩ </a></li>"; 
						console.log("=====cri"+data.cri.startPage);
						
						
						if(data.cri.lastPage==data.cri.realLastPage){j=0;}else{j=1;}
						if(data.cri.pageNum<=10){x=0;}else{x=1;}
						
						for(var i =(data.cri.startPage+x); i<=(data.cri.lastPage-j);i++){
							if(i==data.cri.pageNum){
								PagingHtml2+="<a href=\"#\" onclick=showReview("+i+")><li class=\"nowPage\">"+i+"</li></a>";	
								}else{
									PagingHtml2+="<a href=\"#\" onclick=showReview("+i+")><li>"+i+"</li></a>";	
								}
							} 
							

						 PagingHtml= PagingHtml+PagingHtml2+PagingHtml3;
						 $("#pagingUl").html(PagingHtml); */
						
						var htmlContent="";
						var Re_replayContent="";
						
						console.log("=====item");
						
						
						
								$.each(data.rlist, function(index, item){
							
									
									console.log("=====item",item);
									console.log("==============item.re_rno",item.re_rno);
									 var htmlContent="";//  원래 그냥 만들어서 붙였으나 기존 페이징에 맞춰 출력.
									
								     htmlContent +="<div class=\"oneReview re_reply\" ><div class=\"re_replyIcon \"><img src=\"resources/icon_re_reply.png\"></div>"
								     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
								     +"<div class=\"RText\">"
								     +"<div class=\"Rwriter\">"+item.writer+"</div>"

								     +"<div class=\"Rcontent\">"+item.content+"</div>"
								     +"<div class=\"RDate\">"+item.regdate+"<button class=\"Re_replyBtn\" onclick=\"setRe_rno("+item.rno+")\">댓글쓰기</button></div></div></div>"
								     +"<div class=\"re_replyBox"+item.rno+"\"></div>"
								     +"<div class=\"re_replyContent"+item.rno+"\"></div>";
									
								     console.log("=====htmlContent",htmlContent);
									 $(".re_replyContent"+item.re_rno).html(htmlContent);
	
								 
									});
								
									
								
								   
					    		
					
							
						
					}else{
						$("#showReview").html("입력중 오류가 발생했습니다.");
					}
			  	},
				error : function(xhr, status, error) {
					console.log(error);
				}

			  });//ajax
	}
	
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
	          
        
        
             </section><!--끝 에피소드리스트 끝 -->
              <section id="reviewBox"><!--시작 댓글 리스트 시작 -->
              <input type="text" id="re_rno" value="0">
                        유저 닉네임<input type="text" id="userName">
                        유저아이디<input type="text" id="userId">
                         <div class="textBox">
					        <textarea placeholder="댓글 내용을 입력해 주세요." id="content" class="textInput" maxlength="300"></textarea>
					        <div class="reviewBtns">
						        <span class="lengthWblank">0 자 / 300 Byte</span>
						        <input id="SubmitBtn" class="reviewSubmitBtn" type="button"value="작성" onclick="sendReply()">
				            </div>
		 	             </div>
		 	             <div id="showReply" >
				        </div>
				         
				        
				        <div id="pagingBox">
				        <input type="text" id="pageNum" value="1" hidden="hidden">
				        <ul class="pagination" id="pagingUl">
				      <!--   <li class="first"><a href="#">⟨</a></li>
	
				        <li href="#" class="last">⟩</li> -->
				        </ul>
				        
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
