<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="/resources/assets/js/swiper.min.js"></script>
     <link rel="stylesheet" href="/resources/assets/css/swiper.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li.swiper-slide.swiper-slide {
width: 300px;
height:300px;
background-color: gray;

}

</style>
</head>
<body>

<div id="test-slide" class="swiper-container">
  <ul class="swiper-wrapper">
    <li class="swiper-slide">슬라이드1</li>
    <li class="swiper-slide">슬라이드2</li>
     <li class="swiper-slide">슬라이드1</li>
    <li class="swiper-slide">슬라이드2</li>
  </ul>
  <div class="swiper-pagination"></div> 
    <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
</div>

</body>
<script type="text/javascript">
var slide = new Swiper('.swiper-container', {
	  // 다양한 옵션 설정, 
	  // 아래에서 설명하는 옵션들은 해당 위치에 들어갑니다!!
	  slidesPerView : 2,
	  spaceBetween : 10, 
	  
	  navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
	  
	  pagination: {
          el: '.swiper-pagination',
          type: 'bullets',
      },
      autoplay: {
          delay: 5000,
      },
	})

</script>

</html>