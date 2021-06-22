
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("input[name=id]").on("change",function(){
			// 중복체크를 다시 진행 할수 있도록 처리
			$("input[name=id]").prop("dataValue",false);
		});
		
		// init 페이지 초기화
		$("#registerBtn").on("click", function(){
			
			let id = $("input[name=id]").val();
			if($.isEmptyObject(id)){
				alert("id를 입력해주세요");
				return;
			}
			
			
			// 중복 체크가 제대로 되어 있지 않은 경우 중복체크 메세지를 출력
			// 등록 가능한 아이디 이면 dataValue 가 true가 아니면 중복 검사를 진행 해야 합니다.
			// 중복 체크를 한 경우(등록 가능한 아이디인 경우) dataValue = true 값을 입력 해줍니다.
			if(!$("input[name=id]").prop("dataValue")){
				alert("id 중복검사를 해주세요");
				return false;
			}
			
			
			if(checkPassword()){
				return false;
			};
			
			$("#registerForm").submit();
		});
		
		$("#idCheck").on("click",function(){
			 
			//id 값 #id
			let id = $("input[name=id]").val();
			if($.isEmptyObject(id)){
				alert("id를 입력해주세요");
				return;
			}
			
			// 아이디 체크 여부 초기화
			// 아이디값을 변경했을때
			$("input[name=id]").prop("dataValue",false);
			
			//id가 등록이 되었는지 확인
			$.ajax({
				url : '/checkId/' + id	,
				method : 'get',
				dataType : 'json',
				
				success : function(data){
					if(data){
					// 등록 가능한 아이디인 경우
						alert("등록 가능한 아이디 입니다.");
						
						// 회원 가입 버튼 클릭시 중복처리를 진행했다고 알려주고 싶음
						// 속성값을 추가 해봅시다
						$("input[name=id]").prop("dataValue",true);
					
					} else {
					// 이미 등록된 아이디인 경우
						alert("이미 등록된 아이디 입니다.");
					}
				},
				error : function(){
					console.log('error');	
				} 
				
			});
			
		});
		
		
	});

	function checkPassword(){
		if(!($("input[name=pwd]").val() === $("input[name=pwdCheck]").val())){
			 alert("비밀번호가 일치하지 않습니다.");
		} 
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
			<div
				class="Common__Container-sc-1immaas-1 Default__ContentsContainer-vh5sai-1 dkajRY jjMRbX">
				<div class="contents">
					<div class="login__LoginFormWrapper-j1y4s9-0 kqJoMI">
						<div
							class="Common__OnlyPc-sc-1immaas-0 login__LoginFormTitle-j1y4s9-1 hbPjvl jYDeTK">
							<h1>회원가입</h1>
							<p>dorama korea 계정으로 회원가입</p>
						</div>
						<div class="login__LoginForm-j1y4s9-2 bWrptF">
							<form id="registerForm"
								class="Form__FormWrapper-sc-1vq2e27-1 cjPriy light"
								action="/registerMember" method="post">
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input type="text" id="id" name="id" placeholder="아이디"
												value="" autoComplete="username" />
											<button class="form-control" id="idCheck" type="button" >중복 확인</button>
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input type="password" name="pwd" placeholder="비밀번호"
												pattern = "[0-9A-Za-z!@#$%^&*()]{12,}" required minlength="12"/>
											
										</div>
										
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input placeholder="PasswordCheck" name="pwdCheck" type="password" required minlength="12" onchange="checkPassword()">
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input placeholder="이름" name="name" required maxlength="5">
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input placeholder="email" name="email" type="email" required>
										</div>
									</div>
								</div>
								
								<div class="Button__ButtonWrap-sc-1dbu5xw-2 eQrQOn">
									<button id="registerBtn" type="submit" color="primary" radius="30"
										class="Button-sc-1dbu5xw-0 cmqAVJ">회원가입</button>
								</div>
							</form>
							<a href="/login2">○로그인으로 돌아가기○</a>
						</div>
					</div>
				</div>
			</div>
<jsp:include page="footer.jsp"></jsp:include>		