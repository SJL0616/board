/**
 * 리플 Ajax 
 */



 

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
						showReview(1);
						
						/*var htmlContent="";  원래 그냥 만들어서 붙였으나 기존 페이징에 맞춰 출력.
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
							});*/
					
					
						
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

 
 function showReview(i) {//번호에 맞춰 리뷰 출력
	 $("#pageNum").val(i);
	 showRList(); 
}
 

  function showRList() {//안씀

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
				
				$("#reviewListBtn").text("리뷰("+data.rCount+")");
				
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
				
				var htmlContent="";
			
				$.each(data.rlist, function(index, item){
				
					console.log("=====item");
				
				     htmlContent+="<div class=\"showReview\"><div class=\"oneReview\" >"
				     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
				     +"<div class=\"RText\"><div class=\"Rwriter\">"+item.writer+"</div>"

				     
				     
				     
				     
				      console.log("=====item.rating",item.rating);
				     switch(item.rating)
				     {
				     case 0:
				    	 htmlContent+="<div class=\"stars\"><img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\" class=\"voidOneStar\" >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"   class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  >"
						     +"<img id=\"Star\" src=\"resources/VoidOneStar.png\"  alt=\"backimg\"  class=\"voidOneStar\"  ></div>"

				     break;

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
	  
function  getMatch(id){
	
		  

		  var data = {
					cno :$("#cno").val(),
					id : $("#userId").val()
					
			};
		  console.log("========data",data);
		  
			  $.ajax({
				  	url: '/getMatch', 
				  	method: 'post',
				  	dataType : 'json',
				  	data :JSON.stringify(data),
				  	contentType: 'application/json; charset=UTF-8',
				  	
				  	success: function(data, status){
						console.log(data);
						if(data.result=='success'){
							
							var name= $(".text"+data.ulist.vno).text();
							var idx= name.indexOf("화");
							name= name.substring(idx-1);
							var htmlContent = "";
							 htmlContent +="<a class=\"MainButton\"  href=/Watch?vno="+data.ulist.vno+"&cno="+data.ulist.cno+">"
				                   +"<div class=\"watchButton\">"+name+"이어 보기</div>"
				                   +"</a>";
							$(".watchButtonBox").html(htmlContent);
						}else{
							console.log("error");
						}
						
				  	},
					error : function(xhr, status, error) {
						console.log("error");
					}

				  });//ajax
	
	     
}



