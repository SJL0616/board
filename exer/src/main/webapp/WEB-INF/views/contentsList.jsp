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

		showAllList();	


});

function showAllList() {

	$.ajax({
		url: '/getAllFileList/',
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		console.log("callBack result :",data);
		
		
		var htmlContent ="";
		$.each(data, function(index, item){
			console.log("==========아이템:"+item.pfilename);
			console.log("==========인코딩전:"+item.s_savepath);
			var s_savePath = encodeURIComponent(item.s_savepath);
			var savePath = encodeURIComponent(item.savepath);
			
			 htmlContent ; 
			/*  if(item.filetype == "Y"){ */
				
					console.log("==========인코딩후:"+savePath);
				 htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
				          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
				          +item.cname+"</a>";
				        
						
			/*  }else{
				 htmlContent +="<li>"+item.filename
				 +"<a href=/download?filename="+savePath+"></li>"; 
						 //파일네임에는 파라메터로 넘길수없는 데이터가 있어서 인코딩이 필요.
			 } */
		
		});
		console.log($(".fileListView").html(htmlContent));
		
		$(".fileListView").html(htmlContent);
/* 		var file ="<img alt='immage' src='C:\upload\'"+data.savepath+">";
		$("#text2").html(file);  */
	},
	error : function() {
		console.log("error"); 
	}
	
	});
	

}
</script>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	컨텐츠리스트   
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div>
 <ul class="fileListView">
 
 
 </ul>

</div>

<!--   <div >
                            <table width="100%" class="table table-striped table-bordered table-hover" >
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성시간</th>
                                        <th>수정시간</th>
                                      
                                    </tr>
                                    <tr>
                                    
                                    </tr>
                                    </thead>
                                    </table>
                                    </div> -->
</body>
</html>
