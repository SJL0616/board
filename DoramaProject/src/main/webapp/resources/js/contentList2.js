/**
 * 
 */

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
          +"<img src=/display?filename=s_"+item.pfilename+"><br>";
          if(item.end=="현지 방영중"){
        	  htmlContent +="<div class=\"showRedend\">"+item.end+"</div>";
          }else{
        	  htmlContent +="<div class=\"showend\">"+item.end+"</div>";
          }
    
          htmlContent +="<div class=\"showcname\">"+item.cname+"</div></a>";
				        
		
		
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