
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/login.css">
<meta charSet="utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="description"
	content="합법적인 일본드라마 및 일본 방송콘텐츠의 광고기반 무료 OTT서비스 / 일본방송콘텐츠 관련 국내 최다 판권보유" />
<meta property="og:url" content="https://dorama.kr" />
<meta property="og:site_name" content="도라마코리아" />
<meta property="og:image"
	content="https://dorama.kr/images/meta_image.jpeg" />
<meta property="og:description"
	content="합법적인 일본드라마 및 일본 방송콘텐츠의 광고기반 무료 OTT서비스 / 일본방송콘텐츠 관련 국내 최다 판권보유" />
	<script type="text/javascript">
	  $(document).ready(function() {
		  console.lg("클릭 대기");
		$(".name").on("click", function(){
			console.lg("클릭");
			$(".active").removeClass("active");
			$(this).addClass("active");
			
		});
		  
	});
	
	</script>
	<style type="text/css">
	.active{
	    color: rgb(238, 65, 53);
	}
	
	</style>
<title>도라마코리아</title>
</head>
	<div class="HeaderPc__HeaderTop-nc9k3i-2 jljoXO topHeader">
						<div class="Common__Container-sc-1immaas-1 dkajRY container">
						<c:choose>
							<c:when test="${sessionScope.user != null}"><a href="/viewMember"> ${sessionScope.user.name }님 정보 상세보기 &nbsp;</a><a href="/logout">로그아웃</a></c:when>
							<c:otherwise><a href="/login2">로그인</a></c:otherwise>
						</c:choose>
						<a href="#">고객센터</a>
						</div>
					</div>
	<div id="__next">
		<div
			class="Default__Wrapper-vh5sai-0 kGOonh page-login os-undefined browser-undefined">
			<div class="HeaderPc__HeaderWrapper-nc9k3i-4 jSiDVg">
				<div class="HeaderPc__Header-nc9k3i-3 rgyrI">
					<%-- <div class="HeaderPc__HeaderTop-nc9k3i-2 jljoXO">
						<div class="Common__Container-sc-1immaas-1 dkajRY container">
						<c:choose>
							<c:when test="${sessionScope.user != null}"><a href="/viewMember"> ${sessionScope.user.name }님 정보 상세보기 &nbsp;</a><a href="/logout">로그아웃</a></c:when>
							<c:otherwise><a href="/login2">로그인</a></c:otherwise>
						</c:choose>
						<a href="#">고객센터</a>
						</div>
					</div> --%>
					<div class="HeaderPc__HeaderMenu-nc9k3i-0 eLvPLs" style="    border-bottom: 1px solid #393939;">
						<div class="Common__Container-sc-1immaas-1 dkajRY container">
							<div class="menu-group">
								<a class="logo empty-appconf" href="../index""><img class="logoImg" src="/resources/assets/img/logo.png" alt="logo"></a>
								<nav class="Nav__NavWrapper-zfpvto-0 ekGCiX device-pc">
									<ul>
									  
										<li><a class="name homeNav" href="../index">홈</a></li>
										<li><a class="name contentListNav" href="/contentsList">전체보기</a></li>
										<li><a class="name " href="#">스케줄</a></li>
										<li><a class="name comunityNav"" href="/board/list">커뮤니티</a></li>
										<li><a class="name " href="#">광고/제휴</a></li>
										
										<li><c:if test="${sessionScope.user.role[0] eq 'ROLE_ADMIN'}"><a class="name " href="/memberList">회원,작품관리</a></c:if></li>
									</ul>
								</nav>
							</div>
							<a class="search" href="/search"> <img alt="" src="/resources/icon_search.png" > 검색하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
			
			
			
			
			