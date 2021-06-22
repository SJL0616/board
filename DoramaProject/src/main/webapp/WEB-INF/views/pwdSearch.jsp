
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="header.jsp"></jsp:include>
			<div
				class="Common__Container-sc-1immaas-1 Default__ContentsContainer-vh5sai-1 dkajRY jjMRbX">
				<div class="contents">
					<div class="login__LoginFormWrapper-j1y4s9-0 kqJoMI">
						<div
							class="Common__OnlyPc-sc-1immaas-0 login__LoginFormTitle-j1y4s9-1 hbPjvl jYDeTK">
							<h1>비밀번호 재설정</h1>
							<p>아이디와 이메일을 입력하여 아이디를 찾습니다</p>
							<p>${pwdMsg }</p>
						</div>
						<div class="login__LoginForm-j1y4s9-2 bWrptF">
							<form
								class="Form__FormWrapper-sc-1vq2e27-1 cjPriy light"
								action="/pwdSearch" method="post">
								<p id="errorMsgArea"></p>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input type="text" name="id" placeholder="아이디"
												autofocus  />
										</div>
									</div>
								</div>
								<div class="Form__FormGroup-sc-1vq2e27-2 iqYQZK">
									<div class="Form__FormContent-sc-1vq2e27-4 fHKBqf">
										<div class="Form__InputTextBox-sc-1vq2e27-3 eICYnp">
											<input type="email" name="email" placeholder="이메일"
												/>
										</div>
									</div>
								</div>
								
								<div class="Button__ButtonWrap-sc-1dbu5xw-2 eQrQOn">
									<button type="submit" color="primary" radius="30"
										class="Button-sc-1dbu5xw-0 cmqAVJ">찾기</button>
								</div>
							</form>
						<div class="login__LoginLinks-j1y4s9-4 dBZqTe">
								<ul>
									<li><a href="/login2">로그인</a></li>
									<li><a href="/idSearch">아이디찾기</a></li>
									<li><a href="/member">회원가입</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
	<jsp:include page="footer.jsp"></jsp:include>		