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
	#board{
		border: 1px solid #222;
		width:80%;
		margin: 0 auto;
		padding: 20px;
		background: #222;
	}

	#page_title{
		margin: 10px;
		
		
	}
	.title_text{
		color: #dcdcdc;
	}
	.btn_insert{
	
	display:inline-block;
	padding:6px 12px;
	margin-bottom:0;
	font-size:12px;
	font-weight:400;
	line-height:1.42857143;
	text-align:center;
	white-space:nowrap;
	vertical-align:middle;

	border:1px solid #222;
	border-radius:4px
		
	}
	
	.tbl_b{
		width:90%;
        
        border-collapse:collapse;
        margin: 0 auto;
	}
	td{
		padding-bottom:10px;
		padding-top: 10px; 
		
	}
	.tbl_tr1{
		background-color: #828282;
		border-bottom: 1px solid #646464;
		
	}
	.tbl_tr2{
		border-bottom: 1px solid #646464;
	}
	.category{
		width:50px;
		text-align:center;
		color: #dcdcdc;
		font-weight:bold;
	
	}
	.title{
		width:150px;
		text-align:center;
		
	}
	.writer{
		width:50px;
		text-align:center;
		color: #dcdcdc;
	}
	.regdate{
		width:150px;
		text-align:center;
		color: #dcdcdc;
	}
	a{
		text-decoration: none;
		color: #d2d2d2;
	}
	a:hover{
		color: red;
	}
	ul{
		list-style-type: none;
		
	}
	ul li {
		display:inline; 
		border-left:1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */ 
		font:bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */ 
		padding:0 10px;


	}
	.select{
		background-color: #828282;
	}
	.input_search{
		background-color: #828282;
		color: #dcdcdc;
	}
	
</style>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	  $(".comunityNav").addClass('active');
})



if('${resMsg}' != ''){
	alert('${resMsg}');	
}

// 페이지로 이동
function page(page){
	//location.href = "/board/list?pageNo="+page;
	document.listForm.action="/board/list";
	document.listForm.pageNo.value=page;
	document.listForm.submit();
	
}

// 상세보기 이동
function detail(bno){
	document.listForm.action="/board/get";
	document.listForm.bno.value=bno;
	document.listForm.submit();
}
</script>
<jsp:include page="../header.jsp"></jsp:include>
<body>
        <div id="container">
        <div id="header">
        	<h1>도라마 코리아 </h1>
		</div>
      <hr>
           <div id="board">
           <div id="page_title">
              <h1 class="title_text">자유게시판</h1>
              <div class="btn_in">
                <button type="button" onclick="location.href='/board/register'" class="btn_insert">게시글 쓰기</button>
           		</div>
           </div>
           
           <hr>
                  
            <div class="panel-body">
                 <table  class="tbl_b" >
                    <thead>
                      <tr class="tbl_tr1">
                         
                          <th>분류</th>
                          <th>제목</th>
                          <th>작성자</th>
                          <th>작성시간</th>
                                        
                      </tr>
                     </thead>
                   <tbody>
                                
                      <c:forEach var="vo" items="${list}">
                          <tr class="tbl_tr2">
                              
                              <td class="category">${vo.category }</td>
                              <td class="title" onClick=detail(${vo.bno})><a href="#">${vo.title }
                               <c:if test="${vo.replycnt > 0}">
                               [${vo.replycnt }]</c:if></a></td>
                              <td class="writer">${vo.writer }</td>
                              <td class="regdate">${vo.regdate }</td>
                          </tr>
                      </c:forEach>
                         
                      <c:if test="${list.size() == 0 }">
                      <tr >
                      	<td colspan='4' align="center">
                      	게시글이 존재하지 않습니다.
                      	</td>
                      </tr>
                      </c:if>
                      
                      </tbody>
                  </table>
                              
                            <!-- 페이지 -->                          
                         <nav aria-label="...">
				  
				  <ul class="pagination">
				  
				  <!-- prev 표시 -->
				  <c:if test="${pageNavi.prev }">
				    <li class="page-item" onClick="javascript:page(${pageNavi.startPage-1});">
				      <a class="page-link" href="#" tabindex="-1">Previous</a>
				    </li>
				  </c:if>
				  <c:forEach begin="${pageNavi.startPage }" end="${pageNavi.endPage }" var="page">
				  
				  	<c:choose>
				  		<c:when test="${page eq pageNavi.cri.pageNo }">
						  	<li class="page-item active" onClick="page(${page})">
						      <a class="page-link" href="#" >${page } <span class="sr-only">(current)</span></a>
						    </li>
					    </c:when>
					  	<c:otherwise>
					    	<li class="page-item" onClick="page(${page})"><a class="page-link" href="#">${page }</a></li>
					    </c:otherwise>
				  	</c:choose>
				  
				  </c:forEach>
				  <!-- next 표시 -->
				  <c:if test="${pageNavi.next }">
				    <li class="page-item" onClick="page(${pageNavi.endPage + 1})">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </c:if>
				  </ul>
				  
				</nav>
			    <!-- 페이지끝 -->
				
				<!-- 검색 -->
				<form method=get action=/board/list name=listForm>
                          <!-- 상세보기 검색 유지용 -->
                          
                          <input type=hidden name=bno>
                          <input type=hidden name=pageNo value=${pageNavi.cri.pageNo }> 
                          <!-- 상세보기 검색 유지용 끝 -->
				<div  class="form-inline">
				
					<select class="select" name=type>
					
					 
                              <option value=title  <c:if test="${pageNavi.cri.type == 'title'}">selected</c:if>  >제목</option>
                              <option value=category <c:if test="${pageNavi.cri.type == 'category'}">selected</c:if>>분류</option>
                              <option value=writer <c:if test="${pageNavi.cri.type == 'writer'}">selected</c:if>>작성자</option>
                          </select>
                          
                          <input class="input_search" name=keyword value=${pageNavi.cri.keyword } >
                          <button type="submit" onClick="page(1)" class="btn_search">검색</button>
				</div>
				</form>
				<!-- 검색 끝 -->
				
                        
                    
              </div>
              </div>
              <hr>
              <div id="footer">
              	<h1>푸터</h1>
              </div>
        </div>
       
        
</body>
<jsp:include page="../footer.jsp"></jsp:include>	
</html>
