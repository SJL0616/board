<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도라마 코리아</title>
    <!-- jQurey -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/assets/css/reset2.css">
    <link rel="stylesheet" href="/resources/assets/css/style.css">
 <!-- <link rel="stylesheet" href="/resources/assets/css/swiper.css">  -->


    <!-- 파비콘 -->
    <link rel="shortcut icon" href="/resources/assets/icons/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/assets/icons/favicon_72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="96x96" href="/resources/assets/icons/favicon_96.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/assets/icons/favicon_144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="192x192" href="/resources/assets/icons/favicon_192.png" />

    <!-- 페이스북 메타 태그 -->
    <meta property="og:title" content="도라마 코리아" />
    <meta property="og:url" content="https://www.dorama.kr/" />
    <meta property="og:image" content="/resources/assets/img/logo.png" />
    <meta property="og:description" content="도라마 코리아" />

    <!-- 트위터 메타 태그 -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="도라마 코리아">
    <meta name="twitter:url" content="https://www.dorama.kr/">
    <meta name="twitter:image" content="/resources/assets/img/logo.png">
    <meta name="twitter:description" content="도라마 코리아">

    <!-- 웹 폰트-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
        
        
   <script src="/resources/assets/js/html5shiv.min.js"></script>
   <script type="text/javascript">
/*   $(document).ready(function(){
	getImgList(1);
	
	
	
}) */

   
   </script>

    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]> 
      <script src="/resources/assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
         alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
      </script>
   <![endif]-->


</head>

<body>
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1><a href="#">
                            <em><img class="logoImg" src="/resources/assets/img/logo.png" alt="logo"></em>
                        </a>
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">도라마코리아 전체메뉴</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
                          <li class="homeBtn" onclick="goto('index')">홈</li>
                          
                          <li class="showBtn" onclick="goto('contentsList')">전체보기</li>
                            <a href="#"><li>스케쥴</li></a>
                           <a href="#"> <li>커뮤니티</li></a>
                           <!--  <a href="#"><li>광고/제휴</li></a> -->
                            <a href="#"><li>로그인</li></a>
                           
                        </ul>

                    </nav>
                    <h2 class="searchBtn">검색 하기</h2>

                </div>
            </div>


        </div>

    </header>
    <!-- //header-->

   

<!--     <footer id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="footer_info">
            <div class="container">
                <div class="row">
                    <div class="footer_info">
                        <ul>
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">채용정보</a></li>
                            <li><a href="#">제휴/광고/부대사업 문의</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">고객센터</a></li>
                            <li><a href="#">윤리경영</a></li>
                        </ul>
                        <address>
                            <p>(주)도라마코리아 [dorama korea Co., Ltd.] 사업자등록번호 : 760-87-00893<br><span class="bar2">
                                    대표이사 : 오유석</span>
                                개인정보보호 책임자 경영지원실 실장 박영진<br><span class="bar2">TEL : 02-564-1013</span> (평일 10시~17시)</p>
                            <p>ⓒsince 2017 dk rights Co.,Ltd / dorama korea Co.,Ltd. All rights Reserved.</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>

    </footer> -->
    <!-- //footer-->
    <!-- 자바스크립트 라이브러리 -->

    <script src="/resources/assets/js/jquery.min_1.12.4.js"></script>
    <script src="/resources/assets/js/modernizr-custom.js"></script>
    <script src="/resources/assets/js/ie-checker.js"></script>
  <!--   <script src="/resources/assets/js/swiper.min.js"></script> -->

    <script>



        // 배너 이미지 슬라이드 
   /*      var swiper = new Swiper('.swiper-container', {
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            }
        });
 */
        //드라마차트 이미지 슬라이드
       /*  var swiper = new Swiper('.swiper-container2', {
            slidesPerView: 4,
            spaceBetween: 24,
            // mousewheel: {
            //     invert: true,
            // },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 5000,
            },
        }); */

        // nav 탭 메뉴
        const navBtn = $(".nav > ul > li ")

        navBtn.click(function (e) {
            e.preventDefault();
            // 사용자가 클릭한 버튼 확인해서 변수로 담아줌.
            const target = $(this);
            const index = target.index();
            navBtn.removeClass("active");
            target.addClass("active");
        })

    /*     //드라마차트 탭 메뉴
        const movBtn = $(".movie_title > ul > li");
        const movCont = $(".movie_chart > div");

        // 첫번째 차트 박스만 보이게하기
        movCont.hide().eq(0).show();

        // 버튼 눌렀을때 #이라 0.0좌표로 이동되는거 막아주기
        movBtn.click(function (e) {
            e.preventDefault();
            // 사용자가 클릭한 버튼 확인해서 변수로 담아줌.
            const target = $(this);
            const index = target.index();
            movBtn.removeClass("active");
            target.addClass("active");
            movCont.css("display", "none");
            movCont.eq(index).css("display", "block");
        }) */


    </script>
</body>

</html>