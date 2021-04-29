<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>


<%-- <jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/header.jsp"></jsp:include> --%>

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
 
  <!--/ajax 태그/board/src/main/webapp/resources/js/reply.js/-->
 <script type="text/javascript" src="/resources/js/reply.js">

</script> 
<script type="text/javascript">

$(document).ready(function() {
	//화면이 다 호출되면 이 jsp를 실행해라
	 getAjaxList();
	
	//addReply 버튼을 클릭하면  modal창을 보여준다.
	$("#addReplyBtn").on("click", function () {
		$("#replyModifyBtn").hide();
		$("#replyRemoveBtn").hide();
		
	//
	$("#reply").val("");
	$("#replyer").val("");
		
	//버튼 보이기	
	$("#replyInsertBtn").show();
	//모달창 띄우기
	$("#myModal").modal("show");
		
	});
	
	
	
	//modal===insert 버튼 클릭시 전송
	$("#replyInsertBtn").on("click", function () {
		 ajaxInsert();
	});
	
	$("#replyRemoveBtn").on("click", function () {
		 ajaxRemove();
	});
	
	$("#replyModifyBtn").on("click", function () {
		ajaxModify();
	});

	
	$("#getListBtn").on("click", function() {
		console.log("test");
		
	});
	

	
	
});

function replyDetail(rno) {
	$("#rno").val(rno);
	$("#replyInsertBtn").hide();
	
	
	$("#myModal").modal("show");
	$("#replyModifyBtn").show();
	$("#replyRemoveBtn").show();

	getAjax();

}
function showPage(startPage) {
	$("#replypageNum").val(startPage);

	

	 getAjaxList();

}
</script>

  <!--       <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                /.col-lg-12
            </div> -->
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                            
                            
                           <!-- 답글 -->
                           <div class='row'>

							  <div class="col-lg-12">
							
							    <!-- /.panel -->
							    <div class="panel panel-default">
							      
							      <div class="panel-heading">
							        <i class="fa fa-comments fa-fw"></i> Reply
							        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
							      </div>      
							      
							      
							      <!-- /.panel-heading -->
							      <div class="panel-body">        
							      
							        <ul class="chat" id="repleTbl">
										<!-- <li class='left clearfix' data-rno='"+list.rno+"'>
										<div>
											<div class='header'><strong class='primary-font' id="replyer">[1] 홍길동</strong>
				    						<small class='pull-right text-muted' id="date">12:00:00</small>
				    						</div>
				     						<p id="commment">수고가 많으십니다!</p>
				     					</div>
				     					</li> -->
							        </ul>
							        <!-- ./ end ul -->
							      </div>
							      <!-- /.panel .chat-panel -->
							
								<div class="panel-footer">
								
								<nav aria-label="...">
								  <ul class="pagination">
								  
								  </ul>
								</nav>
																
								
								</div>
							
<input type="text" id="bno" value=${vo.bno}><br>
<input type="text" id="rno" ><br>
<input type="text" id="replypageNum" value="1" ><br>
									</div>
							  </div>
							  <!-- ./ end row -->
							  
							  
							  
						</div>
                            
                            
                      </div>
                       <!--  /.panel-body -->
                    </div>
                   <!--  /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
     <!--    </div>
        /#page-wrapper  -->
			
			
			
        <!-- 모달 Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                       <div class="modal-content">
                           <div class="modal-header">
                               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                               <h4 class="modal-title" id="myModalLabel">Reply</h4>
                           </div>
                           <div class="modal-body">
                                 <ul class="list-group list-group-flush">
							    <li class="list-group-item">
									<input type="text" class="form-control ml-2" placeholder="replyer" id="replyer">
								</li>
								<li class="list-group-item">
									<textarea class="form-control" id="reply" placeholder="reply" rows="3"></textarea>
							    </li>
							</ul>
                           </div>
                           <div class="modal-footer">
                               <button type="button" class="btn btn-default" data-dismiss="modal">cancle</button>
                               <button type="button" class="btn btn-primary" id="replyInsertBtn">insert</button>
                               <button type="button" class="btn btn-primary" id="replyModifyBtn">modify</button>
                               <button type="button" class="btn btn-primary" id="replyRemoveBtn">remove</button>
                           </div>
                       </div>
                       <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
                

        
<%-- <jsp:include page="/resources/startbootstrap-sb-admin-2-gh-pages/header/bottom.jsp"></jsp:include> --%>


