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
	#insert{
		border: 1px solid #222;
		width:80%;
		margin: 0 auto;
		padding: 20px;
		background: #222;
	}
	
	.text_insert{
		color : #dcdcdc;
	}
	p{
		margin-top: 0;
		color : #969696;
	}
	.insert_category{
		padding: 20px;
		color : #dcdcdc;
	}.btn_insert{
		
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
	textarea::placeholder {
 	 color: #FDF5E6;
  	font-style: italic;
	}input::placeholder {
  	color: #FDF5E6;
  	font-style: italic;
   }
#btn_register{
	font-size : 1.5em;
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

        <div id="insert">
            <div class="up">
                <div class="insert_t">
                    <h1 class="text_insert">게시글 쓰기</h1>
                </div>
                <div class="text_con">
                    <p>게시글의 분류를 선택해 주세요</p>
                </div>
          	  </div>
          	  <div class="btn_insert">
                          
                          <button type="button" onClick="listSubmit()">목록으로</button>
                          </div>
          	<hr class="test">    
                    <div class="insert_form">
                      
                      <form method="post" action="/board/register" name="regForm">
                      	<div class="insert_category">
                              <label>분류</label>
                       	
                         <input class="radio" type="radio" name="category" value="잡담">잡담
						<input  class="radio" type="radio" name="category" value="질문">질문
						<input  class="radio" type="radio" name="category" value="기타">기타
                           
                          </div>
                          
                          <div class="inser_title">
                              <input class="input_title" placeholder="제목을 입력해 주세요" name=title>
                          </div>
                          
                          <div class="insert_content">
                              <textarea class="input_content" rows="3" name=content placeholder="내용을 입력해 주세요"></textarea>
                          </div>
                          <div class="insert_writer">
                              	작성자 : <input readonly="readonly" class="input_writer" name="writer" value=${sessionScope.user.id }>
                          </div>
                          <button id="btn_register" type="button" onclick="regSubmit()">등록하기</button>
					</form> 
				    
				
                      </div>
                       
                    </div>
                    
     </div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>	
</html>
