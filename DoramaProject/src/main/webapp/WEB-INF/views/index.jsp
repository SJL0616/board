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
    <link rel="stylesheet" href="/resources/assets/css/reset.css">
    <link rel="stylesheet" href="/resources/assets/css/style.css">
    <link rel="stylesheet" href="/resources/assets/css/swiper.css">
    <link rel="stylesheet" href="/resources/assets/css/font-awesome.css">

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
  $(document).ready(function(){
	getImgList(1);
	
	  $(".homeBtn").addClass('active')
})

   
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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
  <!--   <header id="header">
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1><a href="#">
                            <em><img src="/resources/assets/img/logo.png" alt="logo"></em>
                        </a>
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">도라마코리아 전체메뉴</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li class="active"><a href=" #">홈</a></li>
                            <li><a href="#">전체보기</a></li>
                            <li><a href="#">스케쥴</a></li>
                            <li><a href="#">커뮤니티</a></li>
                            <li><a href="#">광고/제휴</a></li>
                            <li><a href="#">로그인</a></li>
                            <li><a href="#">고객센터</a></li>
                        </ul>

                    </nav>

                </div>
            </div>


        </div>

    </header> -->
    <!-- //header-->

    <section id="banner">
        <h2 class="ir_so">최신 드라마 소식</h2>
        <div class="banner_menu">
            <div class="container">
                <div class="row">
                    <div class="bm_left">
                        <ul>
                            <li class="total"><a href="#"><i class="fa fa-bars" aria-hidden="true"></i>전체메뉴</a></li>
                        </ul>
                    </div>
                    <div class="bm_right">
                        <ul>
                            <li class="purple"><a href="/search">검색하기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                        <div class="container">
                            <div class="row">

                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss2">
                        <div class="container">
                            <div class="row">

                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">

                            </div>
                        </div>
                    </div>
                </div>
                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>

                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </section>
    <!-- //banner -->
    <section id="movie">
        <div class="container">
            <div class="row">
                <div class="movie">
                    <h2 class="ir_so">최신 드라마 정보</h2>
                    <div class="movie_title">
                        <ul>
                            <li class="active" onclick="getImgList(1)"><a href="#">최신</a></li>
                            <li><a href="#" onclick="getImgList(2)">인기</a></li>
                            <li><a href="#" onclick="getImgList(3)">추천</a></li>
                            <li><a href="#">장르</a></li>
                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="swiper-container2">
                            <div class="chart_cont1 swiper-wrapper recentList">
                                <div class="swiper-slide">
                                    <div class="poster ">
                                        <figure>
                                            <img src="/resources/assets/img/poster01.png" srcset="/resources/assets/img/poster01@2.png 2x"
                                                alt="오늘부터우리는">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>오늘부터 우리는!</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster ">
                                        <figure>
                                            <img src="/resources/assets/img/poster02.png" srcset="/resources/assets/img/poster02@2.png 2x"
                                                alt="당신차례입니다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세</span> <strong>당신차례입니다</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster ">
                                        <figure>
                                            <img src="/resources/assets/img/poster03.png" srcset="/resources/assets/img/poster03@2.png 2x"
                                                alt="니게하지">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세</span> <strong>니게하지</strong>
                                        </h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster04.png" srcset="/resources/assets/img/poster04@2.png 2x"
                                                alt="고독한 미식가">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>고독한 미식가</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster05.png" srcset="/resources/assets/img/poster05@2.png 2x"
                                                alt="루팡의 딸">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>루팡의 딸</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster06.png" srcset="/resources/assets/img/poster06@2.png 2x"
                                                alt="컨피던스맨JP">
                                        </figure>
                                        <div class="rank"><strong>6</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>컨피던스맨JP</strong></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont1-->
                        <div class="swiper-container2">
                            <div class="chart_cont2 swiper-wrapper popularList">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster06.png" srcset="/resources/assets/img/poster06@2.png 2x"
                                                alt="컨피던스맨JP">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>컨피던스맨JP</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster02.png" srcset="/resources/assets/img/poster02@2.png 2x"
                                                alt="당신차례입니다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세</span> <strong>당신차례입니다</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster03.png" srcset="/resources/assets/img/poster03@2.png 2x"
                                                alt="니게하지">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세</span> <strong>니게하지</strong>
                                        </h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster04.png" srcset="/resources/assets/img/poster04@2.png 2x"
                                                alt="고독한 미식가">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>고독한 미식가</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster05.png" srcset="/resources/assets/img/poster05@2.png 2x"
                                                alt="루팡의 딸">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>루팡의 딸</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster01.png" srcset="/resources/assets/img/poster01@2.png 2x"
                                                alt="오늘부터 우리는">
                                        </figure>
                                        <div class="rank"><strong>6</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>오늘부터 우리는</strong></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont2-->
                        <div class="swiper-container2">
                            <div class="chart_cont3 swiper-wrapper recList">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster01.png" srcset="/resources/assets/img/poster01@2.png 2x"
                                                alt="오늘부터우리는">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>오늘부터 우리는!</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster02.png" srcset="/resources/assets/img/poster02@2.png 2x"
                                                alt="당신차례입니다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세</span> <strong>당신차례입니다</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster03.png" srcset="/resources/assets/img/poster03@2.png 2x"
                                                alt="니게하지">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세</span> <strong>니게하지</strong>
                                        </h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster04.png" srcset="/resources/assets/img/poster04@2.png 2x"
                                                alt="고독한 미식가">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>고독한 미식가</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster05.png" srcset="/resources/assets/img/poster05@2.png 2x"
                                                alt="루팡의 딸">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>루팡의 딸</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster06.png" srcset="/resources/assets/img/poster06@2.png 2x"
                                                alt="컨피던스맨JP">
                                        </figure>
                                        <div class="rank"><strong>6</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>컨피던스맨JP</strong></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont3-->
                        <div class="swiper-container2">
                            <div class="chart_cont4 swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster01.png" srcset="/resources/assets/img/poster01@2.png 2x"
                                                alt="오늘부터우리는">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon all ir_pm">전체관람가</span> <strong>오늘부터 우리는!</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster02.png" srcset="/resources/assets/img/poster02@2.png 2x"
                                                alt="당신차례입니다">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a12 ir_pm">12세</span> <strong>당신차례입니다</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster03.png" srcset="/resources/assets/img/poster03@2.png 2x"
                                                alt="니게하지">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">15세</span> <strong>니게하지</strong>
                                        </h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster04.png" srcset="/resources/assets/img/poster04@2.png 2x"
                                                alt="고독한 미식가">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>고독한 미식가</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster05.png" srcset="/resources/assets/img/poster05@2.png 2x"
                                                alt="루팡의 딸">
                                        </figure>
                                        <div class="rank"><strong>5</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>루팡의 딸</strong></h3>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="/resources/assets/img/poster06.png" srcset="/resources/assets/img/poster06@2.png 2x"
                                                alt="컨피던스맨JP">
                                        </figure>
                                        <div class="rank"><strong>6</strong></div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">19세</span> <strong>컨피던스맨JP</strong></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont4-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //movie -->

    <footer id="footer">
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

    </footer>
    <!-- //footer-->
    <!-- 자바스크립트 라이브러리 -->

    <script src="/resources/assets/js/jquery.min_1.12.4.js"></script>
    <script src="/resources/assets/js/modernizr-custom.js"></script>
    <script src="/resources/assets/js/ie-checker.js"></script>
    <script src="/resources/assets/js/swiper.min.js"></script>

    <script>



        // 배너 이미지 슬라이드 
        var swiper = new Swiper('.swiper-container', {
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            }
        });

        //드라마차트 이미지 슬라이드
        var swiper = new Swiper('.swiper-container2', {
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
        });

 

        //드라마차트 탭 메뉴
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
        })


    </script>
</body>

</html>