<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
 
<script type="text/javascript">
$(document).ready(function(){

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

function filtering(){ //checkbox를 돌아서 checked 된 box의 value를 배열에 담아 넘김.
	
	 var items = document.querySelectorAll('.genrecheckBox');
     
     var selectedG =[];
    items.forEach(function(item, idx){
     	console.log("===========idx:",idx);     
     	
         if(item.checked){
         	console.log("==========item.value:",item.value);  
         	
          selectedG.push(item.value);
         }else{
           
         }
     }); 
    
    console.log("========== selectedG:", selectedG);  

    //태그 필터 배열에 저장
    items = document.querySelectorAll('.tagcheckBox');
  
    var selectedT =[];
   items.forEach(function(item, idx){
    	console.log("===========idx:",idx);     
    	
        if(item.checked){
        	console.log("==========item.value:",item.value);  
         selectedT.push(item.value);
        }else{
          
        }
    }); 
   console.log("========== selectedT:", selectedT);  
   if(selectedG[0]==null){// 아무것도 selected 가 안 됬을 경우 0을 추가해서 넘김.
 	  selectedG.push("0");
   }
   if(selectedT[0]==null){
 	  selectedT.push("0");
   }
   getSelectedList(selectedG,selectedT);
   /* console.log("selectedG[0]==0 && selectedT[0]==0",selectedG[0]=="0" && selectedT[0]=="0") */
 /*    if(selectedG[0]=="0" && selectedT[0]=="0"){
 	   showAllList();
    }else{ }*/
 	 
    
    //필터링된 데이터 호출
    
}



//필터를 db에 전달해서 해당하는 자료 선출
function getSelectedList(selectedG,selectedT){
	   console.log("==========selectedT selectedG:", selectedT,selectedG); 
	   var type= $("#orderVal").val();
	   console.log("==========type:", type); 
	$.ajax({
		
		url: '/getSelectedList/'+selectedG+'/'+selectedT+'/'+type,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
		
		var length = data.length;
		$(".contentN").text(length);
		var htmlContent ="";
		$.each(data.list, function(index, item){
			console.log("==========아이템:"+item.pfilename);

		 htmlContent +="<li><a href=/showcontents?cno="+item.cno+">"
          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
          +"<div class=\"showend\">"+item.end+"</div>"
          +"<div class=\"showcname\">"+item.cname+"</div></a>";
				        
		
		
		});

		$(".fileListView").html(htmlContent);

	},
	error : function() {
		console.log("error"); 
	}
	
	});
	
	
}


function showAllList() {

	$.ajax({
		url: '/getAllFileList/',
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
		
		var length = data.length;
		$(".contentN").text(length);
		var htmlContent ="";
		$.each(data.list, function(index, item){
			console.log("==========아이템:"+item.pfilename);

				
				
				 htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
				          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
				          +"<div class=\"showend\">"+item.end+"</div>"
				          +"<div class=\"showcname\">"+item.cname+"</div></a>";
				      
		
		});
		
		$(".fileListView").html(htmlContent);

	},
	error : function() {
		console.log("error"); 
	}
	
	});
	

}
</script>


<style>
body{
	background-color: rgb(25, 25, 25);
}
#contents{

color:rgb(170, 170, 170);

/* border: 2px solid white;    */
margin: 0 auto;
width: 1100px;
height: 100%;

}
.filterList{
width: 200px;
    background-color: rgb(37, 37, 37);
    padding: 40px 20px;
    height: 100%;
    /* width: 400px; */
    float: left;
}

.fileListView {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}
.fileListView li{

overflow: hidden;
    width: 170px;
    width: 170;
    padding: 0 0 80px 0;
}
.fileListView li img{
height: 100%;
    width: 100%;
}
.fontBox {
    display: flex;
    justify-content: space-between;
    padding: 40px 0 10px 40px;
}
.fontBox .ShowCnum{
 color: white;
}

.fontBox select#selectOrder {
    color: rgb(170, 170, 170);
    background-color: transparent;
    border: transparent;
}
.showend{
    margin-top: 12px;
    font-size: 14px;
}
.showcname{
    margin-top: 3px;
    font-weight: bold;

}
.titlebar {
    display: flex;
    justify-content: space-between;
    height: 20px;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid rgb(57, 57, 57);
}

.genreFileters{
padding: 3px 0 30px 0px;
    border-bottom: 1px solid rgb(57, 57, 57);
}
.checkbox{
 padding: 15px 0;
}
.Filters ul {
    padding-left: 5px;
}
.Filters li {
    margin-bottom: 10px;
}

.genreFileters label,.tagFileters label{/* 라벨 범위 설정  */
/* position: relative;
  display: inline-block;
    margin-left: -6px;
    z-index: 10;
    width: 16px;
    height: 16px;
    background-size: 30px 60px; 
    cursor: pointer; */
    
    /* position: relative;  */
    display: inline-block;
    /* margin-left: -6px; */
    /* z-index: 10; */
    width: 16px;
    height: 16px;
    /* background-size: 30px 60px; */
    cursor: pointer;
    
}

.genreFileters label span, .tagFileters label span{
    line-height: 1;
    position: relative;
    display: block;
    left: 20px;
    width: 60px;
}


input[type="checkbox"] + label{
border:1px solid rgb(57, 57, 57);

}
 input[type="checkbox"]:checked + label{
 background-size: cover;
	background-image: url('/resources/icon_fcheck_on.png');
	background-repeat:no-repeat;
	
	 background-color:  rgb(37, 37, 37);
}
.filterFormat{
 cursor: pointer;
    background-color: transparent;
    border: 1px solid;
    color: rgb(170, 170, 170);
    border-radius: 3px;
}
</style>
<head>
	<title>Home</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>

<div id="container">

<div id="contents">
    <section class="filterList">
 <div class="titlebar"><h1>필터</h1><button type="button" class="filterFormat">초기화</button>
   <!--  <div class="test">
    <input type="checkbox" name="rating" id="rating0.5" value="1" class="rate_radio half" title="0.5점" hidden="hidden">
				                <label for="rating0.5"></label>
				               </div>  -->
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
    </ul>
    </div>
    
    
    </div>
 
    </section>



	<section id="contentsList">
	<div class="fontBox">
	  <div class="ShowCnum">총<span class="contentN"></span> 개의 작품이 있습니다.</div>
	  
	  <div class="selectBox">
	  <select id="selectOrder">
	  <option value="recent" selected="selected">최신순</option>
	  <option value="date">방영일순</option>
	  <option value="popular">인기순</option>
	  <option value="abc">가나다순</option>
	  </select>
	  <input type="text" id="orderVal">
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
