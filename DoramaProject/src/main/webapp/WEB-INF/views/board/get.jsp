<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#header{
		padding: 20px;
		margin-bottom: :20px;
	}
	#get{
		border: 1px solid #222;
		width:80%;
		margin: 0 auto;
		padding: 20px;
		background: #222;
	}
	
	
	.text_category{
		color:#a0a0a0;
		margin-bottom: 0;
	}
	
	.text_title{
		color: #F9FFFF;
	}
	
	p{
		margin-top:0;
		color:#F9FFFF;
	}
	.set{
	float: left;
	}
	.btn-default{
		float: right;
	}
	.test{
		clear: left;
	}
	.content{
		padding: 30px
	}
	.reply{
		
		color:#F9FFFF;
	}
	.reply_insert{
		background-color: #505050;
		padding: 20px;
		padding-bottom: 40px;
	}
	.btn_reply{
		float: right;
	}
	ul{
		list-style: none;
	}
	
	li{
		color: #a0a0a0;
		border-bottom: 1px solid #a0a0a0;
	}
	.reply_content{
		border: 0px;
		border-radius:5px;
		background-color:  #646464;
		height: 100px;
		width: 100%;
		box-sizing: border-box;
		padding: 10px;
		font-size: 11pt;
		color: #FDF5E6;
		
	}
	.reply_witer{
		border: 0px;
		border-radius:5px;
		background-color:  #646464;
		height: 30px;
		width: 100%;
		box-sizing: border-box;
		padding: 10px;
		font-size: 11pt;
		color: #FDF5E6;
	}
	.re_wr{
	margin-bottom: 10px;
	}
	textarea::placeholder {
 	 color: #FDF5E6;
  	font-style: italic;
	}input::placeholder {
  	color: #FDF5E6;
  	font-style: italic;
   }
	
	
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/reply.js" type="text/javascript"></script>
<script type="text/javascript">
if('${resMsg}' != ''){
	alert('${resMsg}');	
}


//상세보기 이동
function detailBtn(url){
	document.detailForm.action=url;
	document.detailForm.submit();
		
}

function replyInsertBtn(){
	document.reinsertForm.submit();
}
function deleteBtn(){
	document.reinsertForm.submit();
}



</script>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	 	<form method="get" name="detailForm">
			<input type=hidden name=bno value=${vo.bno}>
			<input type=hidden name=pageNo value=${criteria.pageNo}>
			<input type=hidden name=type value=${criteria.type}>
			<input type=hidden name=keyword value=${criteria.keyword}>
		</form> 
	<div id="container">
        <div id="header">
        	<h1>도라마 코리아 </h1>
		</div>
      <hr>
        <div id="get">
            <div class="container">
            <div class="set">
            	<div class="category">
                   <h4 class="text_category">${vo.category}</h4>
                </div>
                <div class="title">
                    <h1 class="text_title">${vo.title}</h1>
                </div>
         		<div class="imfor">             
                   <p><a>${vo.writer}</a>&nbsp;&nbsp;<a>${vo.regdate}</a></p>
				</div>
				</div>
                 <div class="btn-default">
              	<c:if test="${vo.writer eq sessionScope.user.id}">
                    <button type="button" onClick="detailBtn('/board/edit')" >수정</button>
					<button onClick="detailBtn('/board/delete')">삭제</button>
				</c:if>
					<button  onClick="detailBtn('/board/list')">목록</button>
				</div>
              
            </div>
            <hr class="test">
             <div class="content">
                <P>${vo.content}</P>
             </div>
                          
               <hr>   
               
               <form action="/replyWrite" method="post" name="reinsertForm">
				<div class="reply_insert">
				<input type=hidden name=bno value=${vo.bno}>
				<div class="re_wr">
				 <input class="reply_witer" readonly="readonly" id="replyer" name="replyer" value=${sessionScope.user.id } />
				  </div>
				  <div>
				  <textarea class="reply_content" rows="3" name=reply id="reply" placeholder="댓글을 입력해주세요"></textarea>
				
				</div>
				<div class="btn_reply" id="btn1">
				 <button type="button"  onclick="replyInsertBtn()" class="replyInsertBtn" >작성</button>
				</div>
			</div>
			</form>   
			  
				<!-- 댓글 -->
				<div id="reply">
				  <ol class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li>
				        <p>
				        작성자 : ${replyList.replyer}<br />
				        작성 날짜 : ${replyList.replydate}
				        </p>
				
				        <p>${replyList.reply}</p>
				        <c:if test="${replyList.replyer eq sessionScope.user.id}">
				        <button type="button"  onclick="deleteBtn()" class="deleteBtn" >삭제</button>
				        </c:if>
				      </li>
				    </c:forEach>   
				  </ol>
				</div>
                                 
      </div>
                        
  </div>
                  
  

</body>
<jsp:include page="../footer.jsp"></jsp:include>	
</html>