
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#btnEdit").on("click",function(){
			console.log("========버튼");
			var member = {
					id : '${sessionScope.user.id}',
					pwd : $("#pwd").val(),
					name : $("#name").val(),
					email : $("#email").val()
			}
			
			$.ajax({
				url: 'editMember',
				method:'post',
				dataType:'json',
				data:JSON.stringify(member),
				contentType:'application/json; charset=UTF-8',
				success: function(data){
					alert(data.Msg);
					//상세화면으로 이동
					location.href="/viewMember"
				},
				error: function(){
					console.log("error");
				}
				
			})
			
		});
		
	});

</script>
<jsp:include page="header.jsp"></jsp:include>
			<div
				class="Common__Container-sc-1immaas-1 Default__ContentsContainer-vh5sai-1 dkajRY jjMRbX">
				<div class="contents">
					<div class="login__LoginFormWrapper-j1y4s9-0 kqJoMI">
						<div
							class="Common__OnlyPc-sc-1immaas-0 login__LoginFormTitle-j1y4s9-1 hbPjvl jYDeTK">
							<h1>수정하기</h1>
							<p>수정할 회원 정보를 입력하세요</p>
						</div>
						<div class="login__LoginForm-j1y4s9-2 bWrptF">
							<form class="Form__FormWrapper-sc-1vq2e27-1 cjPriy light"
								action="" method="post">
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
											<input type="password" id="pwd" name="pwd" placeholder="현재 비밀번호를 입력하세요"
												pattern = "[0-9A-Za-z!@#$%^&*()]{12,}" required minlength="12"/>
										</div>
									</div>
								</div>
								
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input placeholder="이름" id="name" name="name" required maxlength="5">
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input placeholder="email" id="email" name="email" type="email" required>
										</div>
									</div>
								</div>
								
								<div class="Button__ButtonWrap-sc-1dbu5xw-2 eQrQOn">
									<button id="btnEdit" type="button" color="primary" radius="30"
										class="Button-sc-1dbu5xw-0 cmqAVJ">수정</button>
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
<jsp:include page="footer.jsp"></jsp:include>