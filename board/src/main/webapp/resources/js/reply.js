/**
 * 리플 Ajax 
 */


function replyPage(pageNavi) {
	
	//시작페이지 번호, 끝페이지 번호.
	var startPage= pageNavi.startPage;
	var endPage= pageNavi.endPage;
	 
	 //이전 다음페이지 버튼
	 pageNavi.prev;
	 pageNavi.next;
	pageContent= "";
   
   if(pageNavi.prev){
	 pageContent+= "<li class='page-item '  onclick=showPage("+(startPage-1)+")><a class='page-link' href='#' >Previous</a></li>";
   }
 
   for(startPage; startPage<=endPage; startPage++){
	   if(startPage != pageNavi.cri.pageNum){
		   pageContent += "<li class='page-item' onclick=showPage("+startPage+") ><a class='page-link' href='#'>"+startPage+"</a></li>";
	   }else{
		   pageContent += "<li class='page-item active'><a class='page-link' href='#' onclick=showPage("+startPage+")>"+startPage+"<span class='sr-only'></span></a></li>";
	   }
	console.log(pageContent);
	
   }
   
   
   if(pageNavi.next){
	   pageContent += "<li class='page-item' onclick=showPage("+(endPage+1)+") ><a class='page-link' href='#'>Next</a></li>";
   }

	    
   $(".pagination").html(pageContent);

}

function getAjaxList(pageNo, bno, callback, error){
	//로딩바 띄우기
	$.ajax({
		
		url :'/reply/list/'+$("#bno").val()+'/'+$("#replypageNum").val(),
		method : 'get',
		dataType : 'json',
		
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			console.log(data.list.length);
			var htmlContent= "";
			if(data.list.length>0){
		/* 	console.log($("#repleTbl").html());
			
			 */
		/* 	$("#repleTbl").html(""); */
			
		
	
			htmlContent ="";
		$.each(data.list, function(index, item){
			htmlContent +="<li onclick=replyDetail("+item.rno+") class='left clearfix' data-rno=''>"
				+"<div>"
				+ "<div class='header'><strong class='primary-font'>["+item.rno+"] "+item.replyer+"</strong>"
				+"<small class='pull-right text-muted'>"+item.replydate+"</small>"
				+"</div>"
				+"<p>" +item.reply+"</p>"
				+"</div>"
				+"</li>";
			replyPage(data.pageNavi);
				
			});
			}else{
				htmlContent ="<li class='left clearfix' data-rno=''>"
					+"<div>"
					+ "<div class='header'><strong class='primary-font'> 등록된 데이터가 없습니다.</strong>"
					+"<small class='pull-right text-muted'></small>"
					+"</div>"
					+"<p ></p>"
					+"</div>"
					+"</li>";
			}
		
			console.log($(".chat").html(htmlContent));
			
			$(".chat").html(htmlContent);
			
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("textStatus", textStatus);
			
		}
		
		
	});
	

	
}


function ajaxInsert() {
	//javascript Object 만드는 방법
	var replydate = {
			bno :$("#bno").val(),
			reply :$("#reply").val(),
			replyer : $("#replyer").val()
	};
	console.log("===================obj",replydate);
	console.log("===================json",JSON.stringify(replydate));
	
	
	$.ajax({
		url : '/reply/insert',
		method : 'post',
		dataType :'json',
		
		//서버에게 보낼 때는 데이터형식 정의.
		data :JSON.stringify(replydate),
		contentType: 'application/json; charset=UTF-8',
		
		success: function(data, status) {
			console.log(data);
			if(data.result == "success"){
				$("#myModal").modal("hide");
				$("#replypageNum").val(1);
				getAjaxList();
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
	
}//insert

function ajaxRemove() {
	$.ajax({
	url : '/reply/remove/'+$("#rno").val(),
	method : 'get',
	dataType : 'json',
	success : function(data, status) {
		console.log(data);
		
		if(data.result == "success"){
			$("#myModal").modal("hide");
			alert("데이터가 삭제되었습니다.");
			getAjaxList();
		}else{
			alert("입력중 오류가 발생했습니다.");
		}
		
	},
	
	error : function(xhr, status, error){
		console.log(error);
	}
});
}


/*1건 댓글 조회**/
function getAjax() {


	$.ajax({
		url : '/reply/get/'+$("#rno").val(),
		method : 'get',
		
		dataType : 'json',
		success : function(data, status) {
			console.log(data);
			
/*			$.each(data, function(index, item){*/
				$("#reply").val(data.reply);
				$("#replyer").val(data.replyer);
		/*	});
		*/
		
			
		},
		
		error : function(xhr, status, error){
			console.log(error);
		}
	});
}

function ajaxModify() {
	var replydate = {
			bno :$("#bno").val(),
			rno :$("#rno").val(),
			reply :$("#reply").val(),
			replyer : $("#replyer").val()
	};
	console.log("===================obj",replydate);
	
	$.ajax({
		
	url : '/reply/modify',
	method : 'post',
	dataType : 'json',
	
	data :JSON.stringify(replydate),
	contentType: 'application/json; charset=UTF-8',
	

	success : function(data, status) {
		console.log(data);
		
		if(data.result == "success"){
			$("#myModal").modal("hide");
			alert("데이터가 수정되었습니다.");
			getAjaxList();
		}else{
			alert("입력중 오류가 발생했습니다.");
		}
		
	},
	
	error : function(xhr, status, error){
		console.log(error);
	}
});
}


