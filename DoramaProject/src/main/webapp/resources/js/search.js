//필터를 db에 전달해서 아래 자동완성 box에 text로 해당하는 자료 이름 출력
function getSearchedList(word2){
	   console.log("==========getSearchedList:"); 
	   console.log("==========word:", word2); 
	   
	$.ajax({
		
		url: '/getSearchedList/'+word2,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {
		 console.log("callBack result :",data.result); 
		 console.log("callBack result :",data); 
		 console.log("callBack result :",data.result=="success"); 
		if(data.result=="success"){
			console.log("success proccess start "); 
			var htmlContent ="";
		$.each(data.contentlist, function(index, item){
			
			
			console.log("==========아이템:"+item.pfilename);
			console.log("==========아이템:"+item.castname);
		var name= item.cname;
	        name= name.replaceAll(' ', '+'); 
		 htmlContent +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[콘텐츠]</span>";
          console.log("============word.length",word2.length);
          var idx = item.cname.indexOf(word2); 

          console.log("============idx",idx);

        var left = item.cname.substring(0,idx);
        var bold =item.cname.substring(idx,idx+word2.length);
        var right = item.cname.substring(idx+word2.length);
        
        console.log("============left",left);
        console.log("============bold",bold);
        console.log("============right",right);
        htmlContent+=left+"<span class=\"redWord\">"+bold+"</span>"+right+"</div></a></li>";
		
		});
		
	
		$.each(data.castlist, function(index, item){
			
	
			
			console.log("==========이름:"+item.castname);
			console.log("==========이름:"+item.castname);
      var name= "배우_"+item.castname;
        name= name.replace(' ', '+');  // 띄어쓰기 있으면 +를 붙임.
         console.log("==========name",name);
         console.log("========name:"+name);
		 htmlContent +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
          +"<div class=\"showcname\"><span class=\"contentSpan\">[출연진]</span>";
        var idx = item.castname.indexOf(word2); 
          console.log("============idx",idx);
          
        var left = item.castname.substring(0,idx);
        var bold = item.castname.substring(idx,idx+word2.length);
        var right = item.castname.substring(idx+word2.length);

        console.log("============left",left);
        console.log("============bold",bold);
        console.log("============right",right);
        htmlContent+=left+"<span class=\"redWord\">"+bold+"</span>"+right+"</div></a></li>"; 
		
		});
		console.log("========textBox 생성됨:");
		$(".startBox").addClass("textBox");
		 $(".textBox").html(htmlContent);
		 $(".textBox").removeClass("startBox");
		 
		}else{
			 $(".textBox").addClass("startBox");
			 $(".startBox").removeClass("textBox"); 
			
			console.log("error proccess start "); 
			


		}

	},
	error : function() {
		 $(".textBox").addClass("startBox");
		 $(".startBox").removeClass("textBox"); 
		console.log("error"); 
	}
	
	});
	
	
}



//검색창에 엔터를 쳐서 검색어를 입력하거나, 자동완성 box의 글을 선택시 필터를 db에 전달해서 아래 text로 해당하는 자료 이름 출력
function SearchList(word){
	console.log("=====================SearchList  시작:");
	$("#castname").val("");
	$(".textBox").html("");
	$(".showtextBox").html("");
	console.log("========textBox 제거됨:");
	 $(".textBox").addClass("startBox3");
	 $(".startBox3").removeClass("textBox");
	
	

	   console.log("==========word:", word); 
	word= word.replaceAll('+', ' '); // +를 제거
	$.ajax({
		
		url: '/searchList/'+word,
		method: 'get',
		dataType : 'json',
		
	success: function(data) {

	
		 console.log("callBack result :",data.result); 
		 console.log("callBack result :",data); 
		if(data.result=="success"){
			
			 $(".font1").html("");
			 $(".font2").html("");
			 $(".fileListView").html("");
			 $(".castListView").html("");

			

			var htmlContent ="";

		if(data.contentlist.length!=0 || data.contentlist2!=null ){
			//컨텐츠 리스트가 길이 0이 아닌 경우
				console.log("=====================contentlist: 존재함");
			
		 $.each(data.contentlist, function(index, item){
			
			console.log("==========아이템:"+item.pfilename);

			
			htmlContent  +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";
			
			

		
		});
		
	
		$.each(data.contentlist2, function(index, item){
			
			
			console.log("==========아이템:"+item.pfilename);
			
			
			htmlContent +="<li><a href=/showcontents?cno="+item.cno+">"
	          +"<img src=/display?filename=s_"+item.pfilename+"><br>"
	          +"<div class=\"showend\">"+item.end+"</div>"
	          +"<div class=\"showcname\">"+item.cname+"</div></a>";

			
		
		});
		
		 $(".fileListView").html(htmlContent);
		 $(".font1").prepend("<div class=\"contentsFont\"><h2>콘텐츠</h2></div>");
		/*  $(".showtextBox").html(""); */
		
		 
		 
		}//컨텐츠 리스트가 있을시 
		
		
		console.log("data.castlist.length!=0",data.castlist.length!=0);
		 if(data.castlist.length!=0){//출연진 리스트가 존재할시
				console.log("=====================castlist: 존재함");
		 var htmlContent2 = "";
			$.each(data.castlist, function(index, item){	
				console.log("==========아이템:"+item.castname);
				 var name= "배우_"+item.castname;
				name= name.replace(' ', '+');  // 띄어쓰기 있으면 +를 붙임.
				

		 		 htmlContent2 +="<li><a href=\"#\" onClick=SearchList('"+name+"')>"
		           +"<div class=\"showcname\">"+item.castname+"</div></a></li>"; 
		          
		          
				
		
			
			});
			
			
			 
			 $(".castListView").html(htmlContent2);
			 $(".font2").prepend("<div class=\"contentsFont\"><h2>출연진</h2></div>");
			
			 
		 }//출연진 리스트가 존재할시 끝

		
		 console.log("=====================SearchList  끝:");
		}else{
			

			var htmlContent ="";
			htmlContent+="<div class=\"redWordBox \"><div><img src=/resources/icon_information_warning.png></div>"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색 결과가 없습니다.</div></div>";
			$(".fileListView").html(htmlContent);

		}
		 console.log("=====================word:",word);
		 console.log("=====================name:",name);
		 $("#textInput").val("");
			
		var resultHtml="";
			resultHtml+="<div class=\"redWordBox successRe\">"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색결과가<span class=\"redWord\"> "+data.length+"건 </span>"
				+"있습니다.</div></div>";

		$(".x").html(resultHtml);
		
		 $(".redWordBox2").addClass("redWordBox3");//상세보기창 검색시
		
		$(".redWordBox3").html(resultHtml);
		 $(".x").addClass("redWordBox3");//일반 검색창 검색시
		 
		 
		 $(".redWordBox3").removeClass("redWordBox2");
		 $(".redWordBox3").removeClass("x");


	},
	error : function() {
		console.log("error");
		 $("#textInput").val("");
		 $(".font1").html("");
		 $(".font2").html("");
		 $(".fileListView").html("");
		 $(".castListView").html("");
		 $(".x").addClass("redWordBox2");
		 $(".redWordBox2").removeClass("x");
		 var htmlContent ="";
			htmlContent+="<div class=\"redWordBox\"><div><img src=/resources/icon_information_warning.png></div>"
				+"<div><span class=\"redWord\">'"+word+"'</span>에 대한 검색 결과가 없습니다.</div></div>";
			$(".redWordBox2").html(htmlContent);

	}
	
	});
	
	
}
/**
 * 
 */