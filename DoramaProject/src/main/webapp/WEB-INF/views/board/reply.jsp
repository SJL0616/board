<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- Ajax.js -->
<script src="/resources/js/reply.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	
	getAjaxList();
	
	$(".replyInsertBtn").on("click",function(){
		// 리플 작성
		ajaxInsert();
			
	});
	
	// 선택자
	// 아이디 : # , class : . , 태그
	// $("#id")
	// $(".class")
	// $("태크명")
	$("#removeBtn").on("click",function(){
		deleteAjax();
	});
	
	
	$("#updateBtn").on("click",function(){
		updateAjax();
	});
	
	
	
	

});



/**
 * 리플 페이지 생성
 */
function replyPage(pageNavi){
	var startPage = pageNavi.startPage;
	var endPage = pageNavi.endPage;
	var pageContent = "";
	
	// 이전 페이지네비게이션으로 이동
	if(pageNavi.prev){
		pageContent += 
			'<li class="page-item" onClick=pageMove('+(startPage-1)+')>'
     		+	'<a class="page-link" href="#" tabindex="-1">Previous</a>'
   			+'</li>';
	   
	}
	// 페이지 번호 생성
	// 1 - 10
	for(startPage;startPage<=endPage; startPage++){
		// 지금 보여주고려고 하는 번호 = startPage
		// pageNavi.cri.pageNo
		if(startPage != pageNavi.cri.pageNo){
			pageContent += '<li onClick=pageMove('+startPage+') class="page-item"><a class="page-link" href="#">'+startPage+'</a></li>';	
		} else {
			pageContent += '<li class="page-item active">'
		      			+'<a class="page-link" href="#">'+ startPage +'<span class="sr-only">(current)</span></a>'
		    			+'</li>';
		}
		
		
	    
	}
	// 다음 페이지네비게이션으로 이동
	
	if(pageNavi.next){
		pageContent += '<li class="page-item" onClick=pageMove('+(endPage+1)+')>'
	      			+'<a class="page-link" href="#">Next</a>'
	    			+'</li>';
	}

	$(".pagination").html(pageContent);

}

/**
 * 페이지 번호를 매개변수로 받아서
 * 해당 페이지 리스트를 서버로 부터 받아와서 화면에 뿌려준다
 */
function pageMove(pageNo){
	$("#replyPageNo").val(pageNo);
	getAjaxList();
}
</script>

	<div >
		<h3 class="reply">댓글 </h3>
	 </div>  
			<form >
			<div class="reply_insert">
				
				<div class="re_wr">
				  <input class="reply_witer" readonly="readonly" id="replyer" name="replyer" value=${sessionScope.user.id } />
				</div>
				<div>
				  <textarea class="reply_content" rows="3" name=reply id="reply" placeholder="댓글을 입력해주세요"></textarea>
				
				</div>
				<div class="btn_reply" id="btn1">
				 <button type="button" class="replyInsertBtn">작성</button>
				</div>
			</div>
			</form>
     		    
			 <div class="reply_list">
					      
		          
			      <div class="reply_chat">        
			        <ul class="chat"></ul>
			      </div>
					     
				<div class="panel-footer">
					<nav aria-label="...">
					  <ul class="pagination"> </ul>
					</nav>
				</div>
												
					<input type="hidden" value="${vo.bno}" id="bno"><br>
					<input type="hidden" id="replyPageNo" value="1"><br>
					<input type="hidden" id="rno"><br>

			</div>
					
 
			
        
                

        


