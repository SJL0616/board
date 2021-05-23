<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/startbootstrap-sb-admin-2-gh-pages/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
 if('${msg }' !=""){
	
	alert('${msg}');
}else{
	
} 

$(document).ready(function() {
	
	$("#errorMsg").text('${msg}');
	$("input[name=id]").prop("dataValue",false);
	console.log("id.prop :",$("input[name=id]").prop("dataValue"));
	
	$("#id").on("change",function(){
		//id값 변경되면 value값 초기화
		$("input[name=id]").prop("dataValue",false);	
		console.log("id.prop :",$("input[name=id]").prop("dataValue"));
	});
});


 


function idCheck() {
	var id = $("#id").val();
	var id_prop =$("input[name=id]").prop("dataValue");
	console.log("id :",id);
	console.log("id.prop :",id_prop);

	$.ajax({
		
		url: '/idCheckAjax/'+id,
		method: 'get',
		dataType : 'json',
		
		success: function(data,result, textStatus, jqXHR) {
			console.log("callBack result :",result);
				if(data){
					  console.log("결과 : 중복");
						console.log("id.prop :",id_prop);
						alert("중복입니다.");
				}else{
					console.log("결과 : 사용가능");
					  /* $("#checkIdResult").val("1"); */
					  $("input[name=id]").prop("dataValue",true);
						console.log("id.prop :",$("input[name=id]").prop("dataValue"));
					alert("사용가능합니다.");
				}
			  
				
		},
		error : function() {
			console.log("error");
		}
		
	});
}

function check() {
	
	var checkResult =document.getElementById("checkIdResult").value;
	var id =document.getElementById("id").value;
	var pwd =document.getElementById("pwd").value;
	console.log(id);
	console.log(checkIdResult);
	
	/* if(checkResult=="0"){
		alert("중복체크를 진행하십시오");
		   return false

	} */
	if(!$("input[name=id]").prop("dataValue")){
		alert("중복체크를 진행하십시오");
		   return false

	} 
	if(id==""){
		alert("공백은 안됩니다");
	   return false
	}
	
	var regExId = /^[a-z0-9]{4,12}$/;
	var pwReg = /^[a-zA-Z0-9]{7,20}$/;
	 if(!regExId.test(id)){
		alert("ID는 숫자를 조합해서 5~12자까지 입력하세요.")
		return false;
	} 
	if(pwd==""){
		alert("비밀번호를 입력하세요");
	   return false
	}
	
	/* if(!pwReg.test(pwd))
	{ 
	    alert('비밀번호는 숫자와 영문자 조합으로 7~12자리를 사용해야 합니다.'); 
	    return false
	} */
	document.memberForm.submit();
	return true
}


</script>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
               
                    <div class="panel-body">
                        <form action="registerMember" method="post" name="memberForm">
                             <input type="text" id="checkIdResult" value="0" hidden="" >
                            <fieldset>
                                <div class="form-group">
                                    <p id="errorMsg"></p>
                                    <label> ID</label>
                                    <input class="form-control" name="id" id="id" type="text" autofocus>
                                    <input class="btn btn-lg btn btn-block"   value="중복체크" name="idcheck" id="idcheck" type="button" onclick="idCheck()">
                                </div>
                                <div class="form-group">
                                    <label> 비밀번호</label>
                                    <input class="form-control" placeholder="Password" name="pwd" id="pwd"  type="password">
                                </div>
                                <div class="form-group">
                                    <label> 이름</label>
                                    <input class="form-control" placeholder="name" name="name" type="text">
                                </div>
                                <div class="form-group">
                                    <label> 이메일</label>
                                    <input class="form-control" placeholder="email" name="email" type="email">
                                </div>
                                <div class="checkbox">
                                  
                                </div> 
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="check()">
                                <input type="reset" class="btn btn-lg btn-warn btn-block" value="전체삭제">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/startbootstrap-sb-admin-2-gh-pages/dist/js/sb-admin-2.js"></script>

</body>

</html>
