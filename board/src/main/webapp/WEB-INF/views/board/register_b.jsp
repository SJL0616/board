<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                                <input class="form-control" type="text" name="title" value="${vo.title }" >
                              
                         </div>
                        <div class="form-group">
                                 <label>내용</label>
                                 <textarea class="form-control"  type="text" name="content" rows="3">${vo.content }</textarea>
                         </div>
                          <div class="form-group">
                        	  <label>작성자</label>
                                <input class="form-control"  type="text"  name="writer" value="${vo.writer}" >
                              
                         </div>
              
                        
                                  <input class="btn btn-default" type="submit" value="보내기"/>
       
                                 </form>
                                           <jsp:include page="fileupload3.jsp"></jsp:include>
                                </tbody>
                          
                            <!-- /.table-responsive -->
                        
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

