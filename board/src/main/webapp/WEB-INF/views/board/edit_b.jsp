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
                   <form action="/updateBoard" method="post"> 
                        <div class="form-group">
                       <input type="text" name="bno" value="${vo.bno }" hidden="hidden">
                           <input type=text name= pageNum value="${criteria.pageNum}" hidden="hidden">
                           <input type=text name= type value="${criteria.type}" hidden="hidden">
                           <input type=text name= keyword value="${criteria.keyword}" hidden="hidden">
                        <label>제목</label>
                                <input class="form-control" name="title" value="${vo.title }" >
                              
                         </div>
                        <div class="form-group">
                                 <label>내용</label>
                                 <textarea class="form-control" name="content" rows="3">${vo.content }</textarea>
                         </div>
                          <div class="form-group">
                        	  <label>작성자</label>
                                <input class="form-control"  name="writer" value="${vo.writer}" >
                              
                         </div>
                          <div class="form-group">
                        	  <label>등록시간</label>
                                <input class="form-control"  value="${vo.regdate }">
                             
                         </div>
                      
                       
                               
                                    <!-- <tr class="odd gradeX"> -->
                                  <%--   <td>${vo.bno }</td><td>${vo.title }</td> <td>${vo.content }</td><td>${vo.writer }</td><td>${vo.regdate }</td><td>${vo.updatedate}</td> --%>
                                  <input class="btn btn-default" type="submit" value="수정하기"/></a>
       
                                 </form>
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
