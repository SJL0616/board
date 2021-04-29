<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
if('${resMsg }' !=""){
	
	alert('${resMsg}');
}else{
	
}

function page(page) {
	/* if('${navi.cri.keyword}' !=""){
	location.href="/search?pageNum="+page;
	}else{
	location.href="/board/list?pageNum="+page;	
	} */
	
	  document.listForm.action= "/board/list";
	   document.listForm.pageNum.value = page;
	  document.listForm.submit();
	
	
}
function detail(bno) {
	
   document.listForm.action= "/board/get";
   document.listForm.bno.value = bno;
   document.listForm.submit();
	
	
}

</script>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                             <div align="left" >
                             <a href="/board/register"><input class="btn btn-default" type="button" value="글쓰기"/></a>
                             </div>
                             <form action="/search" method="get" name="listForm">
                               <div  class="form-inline" align="right">
                               
                               <select name="type" class="form-control">
                                <option value="title"  <c:if test="${navi.cri.type == 'title'}"> selected="selected" </c:if> >제목</option>
                                <option value="content" <c:if test="${navi.cri.type == 'content'}">selected="selected"</c:if>>내용</option>
                                <option value="writer" <c:if test="${navi.cri.type == 'writer'}">selected="selected"</c:if>>작성자</option>
                               </select>
                               <!-- 상세보기 검색유지용 -->
                               <input type="text" name="bno">
                               <input type="text" name="pageNum" value="${navi.cri.pageNum }">
                               
                               <input type="text" name="keyword" class="form-control" value="${navi.cri.keyword }">
                           
                             
                             <input class="btn btn-default" type="button" onclick="page(1)" value="검색" >
                             
                                </div>
                              </form>
                        </div>
                         
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성시간</th>
                                        <th>수정시간</th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="list" >
                                    <tr class="odd gradeX">
                                    <td >${list.bno }</td>
                                  <td onclick=detail(${list.bno})><a href="#">${list.title} 
                                 <script type="text/javascript">
                                 console.log(${list.replycnt })
                                 </script>
                               <c:if test='${list.replycnt>0}'>
                                    [${list.replycnt }]
                               </c:if>
                                    </a></td>
                                    
                                 <td>${list.writer }</td><td>${list.regdate }</td><td>${list.updatedate}</td>
                                    </tr>
                                </c:forEach>
                                       <!--  <td>Trident</td>
                                        <td>Internet Explorer 4.0</td>
                                        <td>Win 95+</td>
                                        <td class="center">4</td>
                                        <td class="center">X</td> -->
                                 <c:if test="${list.size()==0 }">
                                <tr class="odd gradeX">
                                <td colspan='4'>
                                                        게시글이 존재하지 않습니다.
                                </td>
                                </c:if>
                                </tbody>
                             
                                
                            </table>
                            
                            <nav aria-label="Page navigation example">
								  <ul class="pagination">
								   <c:if test="${navi.prev}">
								    
								    
								       
								<li class="page-item">
								<a href="#" onclick=page(${navi.startPage-1}) > prev</a></li>
								
								       
								  
								   
							         </c:if> 
								    
								    <c:forEach begin="${navi.startPage}" end="${navi.endPage}" var ="page" >
								   
								    
								     
								       
								        <c:choose>
								        <c:when test="${page eq pageNum}">
								         <li class="page-item active">
								          <a class="page-link" href="#" onclick=page(${page})>${page }<span class="sr-only"></span></a>
								         </li>
                                         </c:when>
                                         
                                         <c:otherwise>
				                           <li class="page-item"><a href="#" onclick=page(${page})> ${page }</a></li>
				                        </c:otherwise>
				                        </c:choose>
				                        
				                   
				                        
				                        
				                    
				                        
				                        
				                    </c:forEach>
			                            
			                            
			                             
			                          
								     <c:if test="${navi.next}">
								  	<li class="page-item">
								<a href="#" onclick=page(${navi.endPage+1})> next</a></li>
								     </c:if>
								  </ul>
								</nav>
                          
                       
                            
                            
                  
                          
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
          
        </div>
        <!-- /#page-wrapper -->

<jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/bottom.jsp"></jsp:include>

</html>
