<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
       
    <title>도라마 코리아</title>

	<script type="text/javascript" src="/resources/js/contentList2.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	 $(".contentListNav").addClass('active');
	/* 	 showAllList();  */
	var order =$("#selectOrder").val();
	$("#orderVal").val(order);
		filtering();
console.log("===========정렬 :", $("#selectOrder").val());


		$(document).on("change",function(){// 정렬 select 버튼이 바뀌면 inputvar에 입력.
			if($("#selectOrder").val()=="recent"){
				console.log("===========정렬 : 최신순");
				$("#orderVal").val("recent");
			}else if($("#selectOrder").val()=="date"){
				console.log("===========정렬 : 방영 날짜순");
				$("#orderVal").val("date");
			}else if($("#selectOrder").val()=="popular"){
				console.log("===========정렬 : 인기순");
				$("#orderVal").val("popular");
			}else if($("#selectOrder").val()=="abc"){
				console.log("===========정렬 : 가나다순");
				$("#orderVal").val("abc");
			}
			filtering();
		});
		
		
		//필터 value를 통해서 작품리스트 가져오기.
		document.querySelector('.Filters').addEventListener('click',function(e){ //checkbox의 name 
    	console.log("===========e:",e);
        var elem = e.target;
        console.log("===========elem:",elem);
        console.log("===========elem.value:",elem.value);
       if(elem.value!=null){
    	
    	filtering();
       
       }//elem.value가  null이 아니면
   });//끝
		
		
		$(".filterFormat").on("click",function(){// 필터 포멧 버튼
			
			
			var items = document.querySelectorAll('.checkBox');

	       items.forEach(function(item, idx){
	        	console.log("===========idx:",idx);     
	        	
	        	item.checked= false;
	         
	        }); 
	       showAllList();	
		});
		
		
});


</script>

<link rel="stylesheet" href="/resources/css/contentList2.css">

<head>

	
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
	<title>Home</title>
</head>

<body>

<div id="container">

<div id="contents">
    <section class="filterList">
    
	<div class="titlebar"><h1>필터</h1><button type="button" class="filterFormat">초기화</button>
	
	</div>
    <div class="Filters">
    
    <div class="genreFileters">
    <h4>장르</h4>
	    <ul>
		    <li>
		       <input type="checkbox" value="액션" name="tagFilters" class="genrecheckBox checkBox" id="actionG"  hidden="hidden">
		       <label for="actionG"><span>액션</span> </label>
		    </li>
		    <li>
			     <input type="checkbox" value="일상" name="tagFilters"  class="genrecheckBox checkBox" id="ordinaryG"  hidden="hidden">
			     <label for="ordinaryG" ><span>일상</span></label>
		    </li>
		    <li>
			     <input type="checkbox" value="모험" name="tagFilters"  class="genrecheckBox checkBox" id="adventureG"  hidden="hidden">
			     <label for="adventureG" ><span>모험</span></label>
		    </li>
		     <li>
			     <input type="checkbox" value="스릴러" name="tagFilters"  class="genrecheckBox checkBox" id="invastG"  hidden="hidden">
			     <label for="invastG" ><span>스릴러</span></label>
		    </li>
		      <li>
				 <input type="checkbox" value="미식" name="tagFilters"  class="genrecheckBox checkBox" id="gurumeG"  hidden="hidden">
				 <label for="gurumeG" ><span>미식</span></label>
		    </li>
		    <li>
				 <input type="checkbox" value="코미디" name="tagFilters"  class="genrecheckBox checkBox" id="comicG"  hidden="hidden">
				 <label for="comicG" ><span>코미디</span></label>
		    </li>
	    </ul>
    </div>
    
    <div class="tagFileters">
    <h4>태그</h4>
	    <ul>
		     <li>
			     <input type="checkbox" value="활극" name="tagF" class="tagcheckBox checkBox" id="comicT"  hidden="hidden">
			     <label for="comicT" ><span>활극</span></label>
		      </li>
		      <li>
			     <input type="checkbox" value="드라마" name="tagF"  class="tagcheckBox checkBox" id="dramaT"  hidden="hidden">
			     <label for="dramaT" ><span>드라마</span></label>
		     </li>
		     <li>
				 <input type="checkbox" value="애니" name="tagF"  class="tagcheckBox checkBox" id="aniT"  hidden="hidden">
				 <label for="aniT" ><span>애니</span></label>
		    </li>
		    <li>
				 <input type="checkbox" value="복수" name="tagF"  class="tagcheckBox checkBox" id="revengeT"  hidden="hidden">
				 <label for="revengeT" ><span>복수</span></label>
		    </li>
		    <li>
				 <input type="checkbox" value="먹방" name="tagF"  class="tagcheckBox checkBox" id="mukbangT"  hidden="hidden">
				 <label for="mukbangT" ><span>먹방</span></label>
		    </li>
		    <li>
				 <input type="checkbox" value="범죄" name="tagF"  class="tagcheckBox checkBox" id="tsumiT"  hidden="hidden">
				 <label for="tsumiT" ><span>범죄</span></label>
		    </li>
		    <li>
				 <input type="checkbox" value="학원" name="tagF"  class="tagcheckBox checkBox" id="schoolT"  hidden="hidden">
				 <label for="schoolT" ><span>학원</span></label>
		    </li>
	    </ul>
    </div>
    
    
    </div>
 
    </section>



	<section id="contentsList">
	<div class="fontBox">
	  <div class="ShowCnum">총 <span class="contentN"></span>개의 작품이 있습니다.</div>
	  
	  <div class="selectBox">
		  <select id="selectOrder">
			  <option value="recent" selected="selected">최신순</option>
			  <option value="date">방영일순</option>
			  <option value="popular">인기순</option>
			  <option value="abc">가나다순</option>
		  </select>
	  <input type="text" id="orderVal" hidden="hidden">
	  </div>
	  
	</div>

	<div>
	 <ul class="fileListView">
	 </ul>
	</div>
	</section>


</div>



</div>

</body>
</html>
