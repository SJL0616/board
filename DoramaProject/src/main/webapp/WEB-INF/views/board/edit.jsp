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
	#edit{
		border: 1px solid #222;
		width:80%;
		margin: 0 auto;
		padding: 20px;
		background: #222;
		
	}
	
	.text_edit{
		color : #F9FFFF;
	}
	h5{
		margin-top: 0;
		color : #969696;
	}
	
	
	.insert_category{
		padding: 10px;
		color : #F9FFFF;
		
	}
	.btn_edit{
		
		float: right;
	}
	
	.up{
	float: left;
	}
	.test{
		clear: left;
	}
	.input_title{
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
	.inser_title{

		margin-bottom: 20px;
		
	}
	.input_content{
		border: 0px;
		border-radius:5px;
		background-color:  #646464;
		height: 300px;
		width: 100%;
		box-sizing: border-box;
		padding: 10px;
		font-size: 11pt;
		color: #FDF5E6;
	}
	.input_writer{
		border: 0px;
		border-radius:5px;
		background-color:  #646464;
		height: 30px;
		width: 40%;
		box-sizing: border-box;
		padding: 10px;
		font-size: 11pt;
		color: #FDF5E6;
	}
	#register{
		width : 100px;
	}
	
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function regSubmit(){
	
	document.regForm.submit();
}
function listSubmit(){
	 location.href = "/board/list";
}
</script>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div>
 		<div id="header">
        	<h1>도라마 코리아 </h1>
		</div>
      <hr>
	
        <div id="edit">
            <div class="up">
                <div class="edit_title">
                    <h1 class="text_edit">게시글 수정</h1>
                </div>
                 <div class="text_con">
                     <h5> 게시글 수정하여 주세요</h5>
                 </div>
            </div>
            <div class="btn_edit">
                            
						   <button type="button" onClick="listSubmit()">목록으로</button>
							</div>
            <hr class="test">
            
                        <!-- /.panel-heading -->
                        <div class="edit_form">
                        <form method="post" action="/board/edit" name="regForm">
                        <input type=hidden name=pageNo value=${criteria.pageNo}>
						<input type=hidden name=type value=${criteria.type}>
						<input type=hidden name=keyword value=${criteria.keyword}>
						<input type=hidden name=bno value=${vo.bno }>
						
						
                       		<div class="insert_category">
                              <label>분류</label>
                       	
		                         <input class="radio" type="radio" name="category" value="잡담" checked="checked">잡담
								<input  class="radio" type="radio" name="category" value="질문">질문
								<input  class="radio" type="radio" name="category" value="기타">기타
                                
                            </div>
                            <div class="inser_title">
                                
                                <input class="input_title" value="${vo.title}" name=title>
                                
                            </div>
                           
                            <div class="insert_content">
                               
                                <textarea class="input_content" rows="3" name=content>${vo.content}</textarea>
                            </div>
                            	작성자 : <input id="register" readonly="readonly" class="input_writer" name="writer" value=${sessionScope.user.id }>
                            	<button type="submit" onclick="regSubmit()">수정하기</button>				  
							 </form>  
					
                        </div>
                        
                    </div>
                    
               </div>
                
                
           
</body>
<jsp:include page="../footer.jsp"></jsp:include>	
</html>