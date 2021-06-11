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
	
	//시작후 별 출력
	var htmlContent= "";
	var rating= ${cvo.rating};
   $("#contentRate").html(setStars(htmlContent,rating));	
	
	showRList(cno);
	
	//List 안의 메뉴BOX 보이기 설정
	$(".reviewBox").hide();
	
	
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
	$(".reviewBox").hide();
	$("#episodeList").show();
	
	/* showVList(cno); */

})

$("#reviewListBtn").on("click", function () {
	
 	var cno = $("#cno").val();
	$(".reviewBox").show();
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

	     document.querySelector('.textInput').addEventListener("input",function() {
	    	 console.log("==============" +textInput.value.length);
	    	
	     	//키보드로 입력할때 실행하는 이벤트.
	     	 lengthWblank.innerHTML = textInput.value.length + " 자 / 300 Byte" ;

	     });
	
});

	

 

/* showWatchPage("+item.vno+")\" */
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
     		
     htmlContent +="<div class=\"episodes\">"
         +"<a class=\"thumA\" href=\"/Watch?vno="+item.vno+"&cno="+cno+"\"><img alt=\"thumbnail\" class=\"thumbnail\" src=/display?filename="+item.vfilename+"-thumb.png width=\"120\" height=\"67\">"
         +"<div class=\"episodesText\">"
         +"<div class=\"text1\"><p><br>"+item.vfilename+"<br><span class=\"text2\" >"+item.regdate+"</span>"
         +"</p></div></div></div></a>";
     
     
     
     
   /*   +="<div class=\"episodes\" onclick=\">"
          +"<a class=\"thumA\" href=\"/Watch?vno="+item.vno+"&cno="+cno+"\"><img alt=\"thumbnail\" class=\"thumbnail\" src=/display?filename="+item.vfilename+"-thumb.png width=\"120\" height=\"67\">"
          +"<div class=\"episodesText\">"
          +"<div class=\"text1\"><p><br>"+item.vfilename+"<br><span class=\"text2\" >"+item.regdate+"</span>"
          +"</p></div></div></div></a>"; */
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

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
    	console.log("===========e:",e);
        var elem = e.target;
        console.log("===========elem:",elem);
        console.log("===========elem.value:",elem.value);
       
        $("#rating").val(elem.value);
        
        var items = document.querySelectorAll('.rate_radio');
        
        items.forEach(function(item, idx){
        	console.log("===========idx:",idx);     
        	
            if(idx < (elem.value-0.5)){
                item.checked = true;
            }else{
                item.checked = false;
            }
        });
      
    })
});

/* 리뷰 등록 ajax*/
  function sendReview() {
	
	 
		var reviewdate = {
				cno :$("#cno").val(),
				content :$("#content").val(),
				writer : $("#userName").val(),
				id : $("#userId").val(),
				rating: $("#rating").val()
		};
		console.log("===================obj",reviewdate);
		console.log("===================json",JSON.stringify(reviewdate));
	 
			
			$.ajax({
				url : '/reviewInsert',
				method : 'post',
				dataType :'json',
				
				//서버에게 보낼 때는 데이터형식 정의.
				data :JSON.stringify(reviewdate),
				contentType: 'application/json; charset=UTF-8',
				
				success: function(data, status) {
					console.log(data);
					console.log(data.rlist);
					if(data.result == "success"){
						alert("입력완료");
					
						
						var htmlContent="";
						var setRating="";
						$.each(data.rlist, function(index, item){
							console.log("=====item",item);
						     htmlContent +="<div class=\"showReview\"><div class=\"oneReview\" >"
						     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
						     +"<div class=\"RText\">"
						     +"<div class=\"Rwriter\">"+item.writer+"</div>";
						     setRating=setStars(htmlContent,item.rating);
						     
						     setRating+="<div class=\"Rcontent\">"+item.content+"</div>"
						     +"<div class=\"RDate\">"+item.regdate+"</div></div></div></div>";
						     
						     
						    	  $("#showReview").prepend(setRating);
						     return false;
							});
					
					
						
					}else{
						alert("입력중 오류가 발생했습니다.");
					}
					
					//모달창 닫기
					
					//jsp파일은 기다리지 않기 떄문에 메세지가 전해지면 
					//닫히게 함.
					
					//리스트 조회하기
				
				
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
			
		//insert
	  
	  
}

 
  function showRList(cno) {//안씀

	  var cno =$("#cno").val();
	  var pageNum =$("#pageNum").val();
	  
	  $.ajax({
	  	url: '/getReviewList/'+cno+'/'+pageNum,
	  	method: 'get',
	  	dataType : 'json',
	  	
	  	success: function(data, status){
			console.log(data);
			console.log(data.rlist);
			if(data.result == "success"){
				
				var PagingHtml="";
				var PagingHtml2="";
				var PagingHtml3="";
	      			
				PagingHtml+="<li class=\"first\"><a href="+data.cri.startPage+">⟨</a></li>";
				
				PagingHtml3+="<li href="+data.cri.lastPage+" class=\"last\">⟩</li>"; 
				console.log("=====cri"+data.cri.startPage);
				
				for(var i =1; i<(data.cri.lastPage-1);i++){
					
				if(i==data.cri.pageNum){
					PagingHtml2+="<a href="+i+" class=\"nowPage\"><li>"+i+"</li></a>";	
					}else{
						PagingHtml2+="<a href="+i+"><li>"+i+"</li></a>";	
					}
				}
					
				
				
				/* $.each(8, function(index, item){
					
					console.log("=====item"+item);
					
					
					
				/* 	 ;
					
					
				

					}); */
				 PagingHtml= PagingHtml+PagingHtml2+PagingHtml3;
				 $("#pagingUl").html(PagingHtml); 
				
				var htmlContent="";
			
				$.each(data.rlist, function(index, item){
				
					console.log("=====item");
				
				     htmlContent+="<div class=\"showReview\"><div class=\"oneReview\" >"
				     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
				     +"<div class=\"RText\"><div class=\"Rwriter\">"+item.writer+"</div>"

				     
				     
				     
				     
				      console.log("=====item.rating",item.rating);
				     switch(item.rating)
				     {
				     case 1:
				     htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\"  >" 
				     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\"  >"
				     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
				     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
				     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
				     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
				     break;
				     
				     case 2:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
					break;
                     case 3:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    		 +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\"  >" 
							     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
					break;	     
                     case 4:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	 +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
						     break;	     
                     case 5:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
						     break;	     
                     case 6:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
						     break;	     
                     case 7:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
						     break;	     
                     case 8:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
						     break;	     
                     case 9:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\"  >" 
						     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\"  ></div>"
						   
						     break;	     
                     case 10:
				    	 
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
				    	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  ></div>" 
				    	   
						     break;	     
						     
				     } 
				    
				    	 
				    	 /* if(item.rating/2==0){
				         +"<img src=\"resources/rightStar.png\"></div>"	 
				    	 }else{
				    	 +"<img src=\"resources/leftStar.png\"></div>"}
				     
					 if(item.rating<voidStar){
			    		 if(voidStar/2==0){
					         +"<img src=\"resources/VoidRightStar.png\"><img src=\"resources/VoidLeftStar.png\"></div>"	 
					    	 }else{
					    	 +</div>"}
			    		 
			    	 }else{ */
				    	 
	 
				
				  /*    for(var i=1; i<item.rating; i++){
				    	 
				    	 
				     }; */
				    
				  
				    
				     htmlContent+="<div class=\"Rcontent\">"+item.content+"</div><br>"
						     +"<div class=\"RDate\">"+item.regdate+"</div></div></div></div>"; 
						     
			    		
					})
					console.log("=====htmlContent",htmlContent);
				 $("#showReview").html(htmlContent);
				
				
			}else{
				$("#showReview").html("입력중 오류가 발생했습니다.");
			}
	  	},
		error : function(xhr, status, error) {
			console.log(error);
		}

	  });//ajax
	  }//showVList




function setStars(htmlContent,rating){
	console.log(" setStars 메서드 시작 =====htmlContent",htmlContent);
	console.log(" setStars 메서드 시작 =====htmlContent",htmlContent=="");
		  var main = "";
		  var halfStar="";
	  
		  if(htmlContent==""){//contentList 페이지의 가운데 큰 별에서 필요한 클래스.
			  main="main";
			  halfStar="halfStar";
		  }else{
			 main=""; 
			 halfStar="notuse";
		  }
		  
	switch(rating)
    {
    case 1:
    htmlContent+="<div class=\"stars "+ main+"\"><img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\" class="+halfStar+"  >" 
    +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\" class="+halfStar+" >"
    +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
    +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
    +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
    +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
    break;
    
    case 2:
   	 
   	 htmlContent+="<div class=\"stars "+ main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
	break;
    case 3:
   	 
   	 htmlContent+="<div class=\"stars "+ main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   		 +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\" class="+halfStar+"  >" 
			     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\" class="+halfStar+"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
	break;	     
    case 4:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\" class="+halfStar+"   >" 
   	 +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\" class="+halfStar+"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
		     break;	     
    case 5:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\" class="+halfStar+"   >" 
		     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\" class="+halfStar+"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
		     break;	     
    case 6:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\" class="+halfStar+"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\" class="+halfStar+"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
		     break;	     
    case 7:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\" class="+halfStar+"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\" class="+halfStar+"  >"
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
		     break;	     
    case 8:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"
		     break;	     
    case 9:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/leftStar.png\"  alt=\"backimg\" class="+halfStar+"  >" 
		     +"<img id=\"Star\" src=\"resources/VoidRightStar.png\"  alt=\"backimg\" class="+halfStar+"  ></div>"
		   
		     break;	     
    case 10:
   	 
   	 htmlContent+="<div class=\"stars "+main+"\"><img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  >" 
   	     +"<img id=\"Star\" src=\"resources/OneStar.png\" class=\"voidOneStar\" alt=\"backimg\"  ></div>" 
   	   
		     break;	     
		     
    }
	console.log(" setStars 메서드 끝 =====htmlContent",htmlContent);
	return htmlContent;
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
   <div id="posterbox" style="background-image: url('/display?filename=${cvo.pfilename }');">
   <!--  <img src=/display?filename=${cvo.pfilename } alt="backimg" id="posterImg"  height="100%" width="100%" > -->
    </div> 
        <header>
        <div id="thumbnail_group">
           <img src=/display?filename=s_${cvo.pfilename } alt="sns" class="sns" width="235" height="350"> 
           
                <div id="info">
                <ul>
                   <li>${cvo.bc}/${cvo.agelimit }/${cvo.end }</li> 
                   <li id="li2"><h1>${cvo.cname}</h1></li> 
                   <br>
                   <li>장르</li> 
                   <li>평점 ${cvo.rating}</li> 
                   <li id="contentRate">+평점</li> 
                   <li></li> 
                </ul>
               </div>
         
           
          </div>
        </header>
  </div>    
  <div id="contents"> 
  <input type="text" id="cno" value="${cvo.cno}" hidden="">
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
	             <div class="episodes" >
	             <a  class="thumA" href=/Watch?vno=${vvo.vno}&cno=${cvo.cno}>

	            <img alt="thumbnail" class="thumbnail" src=/display?filename=${vvo.vfilename}-thumb.png width="120" height="67">
	            <div class="episodesText">
	            <div class="text1"><p>${cvo.cname}<br>${vvo.vfilename}<br><span class="text2" >2021/05/28</span></p></div>
	            </div>
	             
	            </div></a> 
	            
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
				            유저 닉네임<input type="text" id="userName">
				                유저아이디<input type="text" id="userId">
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
				        <input type="text" id="pageNum" value="1">
				        <ul class="pagination" id="pagingUl">
				        <li class="first"><a href="#">⟨</a></li>
				     
				        <li href="#" class="last">⟩</li>
				        </ul>
				        
				        </div>
			
			        
		       </section>
            
            
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
