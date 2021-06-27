
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	var id = '${sessionScope.user.id }';
	getVMatch(id);
	
	
	
});

function  getVMatch(id){
	  
	  $.ajax({
		  	url: '/getVMatch/'+id, 
		  	method: 'get',
		  	dataType : 'json',
		  	
		  	success: function(data, status){
				console.log(data);

				var length = data.length;
				$(".contentN").text(length);
				var htmlContent ="";
				var htmlContent2 ="<span class=\"span\">전체 시청내역</span>";
				
				$.each(data.list, function(index, item){
					console.log("==========아이템:"+item.pfilename);

					var	vfilename= item.vfilename;
					vfilename= vfilename.replace(".mp4"," ");
						
						 htmlContent  +="<li><a href=/Watch?vno="+item.vno+"&cno="+item.cno+">"
						          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
						          +"<div class=\"showend\">"+item.cname+"</div>"
						          +"<div class=\"showcname\">"+vfilename+"</div></a>";
						      
				
				});
				
				$(".fileListView").html(htmlContent);
				$(".MatchList").prepend(htmlContent2);
				
		  	},
			error : function(xhr, status, error) {
				console.log(error);
			}

		  });//ajax
}

</script>
<style>
.MatchList{
    margin: 0 auto;
    width: 100%;
}
.MatchList .span{
    color: white;
    font-weight: bold;
    font-size: 1.8em;
}
.fileListView{
    display: flex;
    /* width: 500px; */
    justify-content: flex-start;
    align-items: center;
    flex-wrap: wrap;
    }
 .fileListView li{   
        text-align: center;
            margin-right: 30px;
        }
</style>

<jsp:include page="header.jsp"></jsp:include>
			<div
				class="Common__Container-sc-1immaas-1 Default__ContentsContainer-vh5sai-1 dkajRY jjMRbX">
				<div class="contents">
					<div class="login__LoginFormWrapper-j1y4s9-0 kqJoMI">
						<div
							class="Common__OnlyPc-sc-1immaas-0 login__LoginFormTitle-j1y4s9-1 hbPjvl jYDeTK">
							<h1>회원정보 상세보기</h1>
							<p>dorama korea 계정상세보기</p>
						</div>
						<div class="login__LoginForm-j1y4s9-2 bWrptF">
							
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<p>아이디 : ${sessionScope.user.id }
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<p>이름 : ${sessionScope.user.name }
										</div>
										
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<p>이메일 : ${sessionScope.user.email }
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<p>권한 : ${sessionScope.user.role }
										</div>
									</div>
								</div>
								<form action="/editMember" method="get">
								<div class="Button__ButtonWrap-sc-1dbu5xw-2 eQrQOn">
									<button type="submit" color="primary" radius="30"
										class="Button-sc-1dbu5xw-0 cmqAVJ">수정하러가기</button>
								</div>
								</form>
						</div>
					</div>
					
					<div class="MatchList"><ul  class="fileListView"></ul></div>
				</div>
			</div>
			
		
<jsp:include page="footer.jsp"></jsp:include>			