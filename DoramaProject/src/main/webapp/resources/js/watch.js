
function setRe_rno(rno) {
	$(".Re_replyBtn"+rno).addClass(".Btn"+rno); 
	 
	 var Btn=document.querySelector(".Re_replyBtn"+rno);
	 Btn.setAttribute("onClick", "hideTextBox("+rno+")");
	

	 console.log("==============Re_replyBtn activated======");
	 var writer =$(".Rwriter"+rno).text();
	 console.log("============== $(.Rwriter+item.rno).text()======",writer);

	/* $("#re_rno").val(rno); */
	//댓글-답글달기 BOX를 DIV에 삽입. + 인풋 텍스트에리어 rno추가로 fuction이 움직이게 설정.
		var htmlContent="";
	
	htmlContent+="<div class=\"oneReview \" ><div class=\"TextBoxIcon\"><img src=\"resources/icon_re_reply.png\"></div>"
      +"<div class=\"textBox replyTextBox\">"
      +"<textarea placeholder=\""+writer+"에게 쓸 댓글 내용을 입력해 주세요.\" id=\"content\" class=\"Re_textInput"+rno+" textInput\" maxlength=\"300\"></textarea>"
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
function hideTextBox(rno) {
	 console.log("==============hideTextBox activated======");
	
		  $(".re_replyBox"+rno).html("");
		  var Btn=document.querySelector(".Re_replyBtn"+rno);
			 Btn.setAttribute("onClick", "setRe_rno("+rno+")");
		
	 
}



function sendRe_reply(rno){
	
	 $("#re_rno").val(rno);
	sendReply(rno);
	
	
}
function deleteReplyBtn(rno){
	deleteReply(rno);

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
	     		  var name = item.vfilename.replace(".mp4"," ");
	     		  var vname = name.replaceAll("_"," ");
	     		
	     htmlContent +="<div class=\"episodes watchEpisodes\" >"
	          +"<a class=\"thumA\" href=\"/Watch?vno="+item.vno+"&cno="+cno+"\"><img alt=\"thumbnail\" class=\"thumbnail\" src=/display?filename="+item.vfilename+"-thumb.png width=\"150\" height=\"84\">"
	          +"<div class=\"episodesText\">"
	          +"<div class=\"text1\"><p>"+vname+"<br><span class=\"text2\" >"+item.regdate+"</span>"
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
		console.log("========rno :",rno);
		var replydate= null;
		console.log("========rno==null :",rno==null);
		if(rno==null){ 
		 replydate = {
				vno :$("#vno").val(),
				content :$("#content").val(),
				writer : $("#userName").val(),
				id : $("#userId").val(),
				re_rno : 0,
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



function showReview(i) {//번호에 맞춰 리뷰 출력
	 $("#pageNum").val(i);
	 console.log("==============i",i);
	 console.log("==============$(#pageNum).val()",$("#pageNum").val());
	 showReply();
}



function showReply() {//안씀

	  var vno =$("#vno").val();
	 var pageNum =$("#pageNum").val();
	 var sessionid = $("#userId").val();  
	 console.log("==============sessionid",sessionid);
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
				
				    $("#showReply").html("");
						$.each(data.rlist, function(index, item){
					
							var htmlContent="";
							var Re_replayContent="";
							
							console.log("=====item",item);
							console.log("==============item.re_rno",item.re_rno);
							

						     htmlContent +="<div class=\"showReview\"><div class=\"oneReview\" >"
						     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
						     +"<div class=\"RText\">"
						     +"<div class=\"Rwriter"+item.rno+"\">"+item.writer+"</div>"

						     +"<div class=\"Rcontent\">"+item.content+"</div>"
						     +"<div class=\"RDate\">"+item.regdate+"<button class=\"Re_replyBtn"+item.rno+" \" onclick=\"setRe_rno("+item.rno+")\">댓글쓰기</button>";
						     console.log("==============item.id==sessionid",item.id==sessionid);
					        if(item.id==sessionid){
					        	htmlContent +="<button type=\"button\"  onclick=\"deleteReplyBtn("+item.rno+")\" class=\"deleteBtn"+item.rno+"\" >삭제</button>";
					        };
					        htmlContent +="</div></div></div>"
						     +"<div class=\"re_replyBox"+item.rno+" TextBox1\"></div>"
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
		  var sessionid = $("#userId").val();  
		  
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
									var writer =$(".Rwriter"+item.re_rno).text();
									console.log("==============writer",writer);
									var htmlContent="";//  원래 그냥 만들어서 붙였으나 기존 페이징에 맞춰 출력.
									
								     htmlContent +="<div class=\"oneReview re_reply\" ><div class=\"re_replyIcon \"><img src=\"resources/icon_re_reply.png\"></div>"
								     +"<div class=\"RProfileImg\"><img src=\"resources/profile_default.png\"></div>"
								     +"<div class=\"RText\">"
								     +"<div class=\"Rwriter"+item.rno+"\">"+item.writer+"</div>"

								     +"<div class=\"Rcontent\"><span class=\"mentionee\">@"+writer+"</span><br>"+item.content+"</div>"
								     +"<div class=\"RDate\">"+item.regdate+"<button class=\"Re_replyBtn"+item.rno+"\" onclick=\"setRe_rno("+item.rno+")\">댓글쓰기</button>";
								     
								     if(item.id==sessionid){
								        	htmlContent +="<button type=\"button\"  onclick=\"deleteReplyBtn("+item.rno+")\" class=\"deleteBtn"+item.rno+"\" >삭제</button>";
								        };
								     
								        htmlContent +="</div></div></div>" 	
								     +"<div class=\"re_replyBox"+item.rno+" TextBox2\"></div>"
								     +"<div class=\"re_replyContent"+item.rno+"\"></div>";
									
								     console.log("=====htmlContent",htmlContent);
									 $(".re_replyContent"+item.re_rno).append(htmlContent);
	
								 
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
	
	
	 
	  
	  function  deleteReply(rno){
		  
		  $.ajax({
			  	url: '/deleteReply/'+rno, 
			  	method: 'get',
			  	dataType : 'json',
			  	
			  	success: function(data, status){
					console.log(data);
					if(data.result=='1'){
						console.log("===========",rno+"댓글 삭제완료");
						alert("삭제 완료");
						showReply();
					}
					
			  	},
				error : function(xhr, status, error) {
					console.log(error);
				}

			  });//ajax
	}
     
  function  SaveVno(){
		  

	  var data = {
				cno :$("#cno").val(),
				vno : $("#vno").val(),
				id : $("#userId").val()
				
		};
	  console.log("========data",data);
	  
		  $.ajax({
			  	url: '/SaveVMatch', 
			  	method: 'post',
			  	dataType : 'json',
			  	data :JSON.stringify(data),
			  	contentType: 'application/json; charset=UTF-8',
			  	
			  	success: function(data, status){
					console.log(data);
					if(data.result=='1'){
						console.log("===========vno 등록완료");
					
					}
					
			  	},
				error : function(xhr, status, error) {
					console.log(error);
				}

			  });//ajax
	}
     