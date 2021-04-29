<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
  function detailBtn(url) {
	  document.detailForm.action=url;
	  console.log("url");
	 document.detailForm.submit(); 
}
  
  if('${resMsg }' !=""){
		
		alert('${resMsg}');
	}else{
		
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
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                   <form action="/board/register" method="post"> 
                        <div class="form-group">
                        <label>제목</label>
                                <input class="form-control" value="${vo.title }" readonly="readonly">
                              
                         </div>
                        <div class="form-group">
                                 <label>내용</label>
                                 <textarea class="form-control" rows="3" readonly="readonly">${vo.content }</textarea>
                         </div>
                          <div class="form-group">
                        	  <label>작성자</label>
                                <input class="form-control"  value="${vo.writer}" readonly="readonly">
                              
                         </div>
                          <div class="form-group">
                        	  <label>등록시간</label>
                                <input class="form-control"  value="${vo.regdate }" readonly="readonly">
                             
                         </div>
                      
                       
                               
                                    <!-- <tr class="odd gradeX"> -->
                                  <%--   <td>${vo.bno }</td><td>${vo.title }</td> <td>${vo.content }</td><td>${vo.writer }</td><td>${vo.regdate }</td><td>${vo.updatedate}</td> --%>
                                 <!--  <a href="/board/list"> --><input class="btn btn-default" type="button"  onclick="detailBtn('/board/list')" value="목록으로"/>
                                  <%-- <a href="/board/edit?bno=${vo.bno }"> --%><input class="btn btn-default" type="button" onclick="detailBtn('/board/edit')" value="수정하기"/>
                                 <input type="button" value="삭제"  class="btn btn-default" onclick="detailBtn('/deleteBoard')">
                              
                                 </form>
                                </tbody>
                                <form  name="detailForm" method="get" >
                                   <input type=hidden name= bno value=${vo.bno} >
                                   <input type=hidden name= pageNum value=${criteria.pageNum}  >
                                   <input type=hidden name= type value=${criteria.type}  >
                                   <input type=hidden name= keyword value=${criteria.keyword}>
                                </form>
                          
                            <!-- /.table-responsive -->
                            
                            <!-- 댓글 -->
                            <jsp:include page="reply.jsp"></jsp:include>
                        
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
