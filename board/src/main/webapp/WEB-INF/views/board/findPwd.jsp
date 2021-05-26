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
$(document).ready(function() {
if('${msg }' !=""){
	
	alert('${msg}');
}else{
	
} 
	$("#searchId").hide();
	$("#searchPwd").hide();
	$("#searchPwd2").hide();
	
	$("#searchPwdHead").on("click",function(){
		$("#searchPwd").show();
		$("#searchId").hide();
		$("#searchPwd2").hide();
	});

	$("#searchIdHead").on("click",function(){
		$("#searchPwd").hide();
		$("#searchPwd2").hide();
		$("#searchId").show();
	});
	
	$("#searchIdPwd2").on("click",function(){
		$("#searchPwd").hide();
		$("#searchId").hide();
		$("#searchPwd2").show();
	});
});


function sendText() {
	
	var contentdate = {
			email : $("#email").val(),
			 name : $("#name").val()
	};
	console.log("===================contentdate",contentdate);
	$.ajax({
		
		url: '/findIdProcess',
		method: 'post',
		dataType: 'json',
		
		data: JSON.stringify(contentdate),
		contentType:'application/json; charset=UTF-8',
		
		success: function (data, status) {
			console.log(data);
			if(data.result == "error"){
				$("#errorMsg").text("이름 혹은 이메일을 확인해주세요.");
				alert("입력중 오류가 발생했습니다.");
		
			}else{
				$("#errorMsg").text("정상적으로 완료되었습니다.");
				$("#showId").text("아이디는 :"+data.result.id+" 입니다.");
				$("#Msgid").hide();
				
		}
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
		
	});
	
}

function sendText2() {
	
	var contentdate = {
			email : $("#email2").val(),
			id : $("#id").val()
	};
	console.log("===================contentdate",contentdate);
	$.ajax({
		
		url: '/findIdProcess',
		method: 'post',
		dataType: 'json',
		
		data: JSON.stringify(contentdate),
		contentType:'application/json; charset=UTF-8',
		
		success: function (data, status) {
			console.log(data);
			if(data.result == "error"){
				$("#errorMsg2").text("아이디 혹은 이메일을 확인해주세요.");
				alert("입력중 오류가 발생했습니다.");
		
			}else{
				$("#errorMsg2").text("정상적으로 완료되었습니다.");
				$("#showPwd").text("비밀번호는 :"+data.tpwd+" 입니다.");
				$("#MsgPwd").hide();
				
		}
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
		
	});
	
}


</script>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" id="searchPwdHead">
                        <h3 class="panel-title">임시 비밀번호 발급</h3>
                    </div>
                    <div class="panel-body">
                        <form action="sendEmail" method="post" name="loginForm">
                            <fieldset id="searchPwd">
                                <div class="form-group">
                                    <p id="Msg">찾으실 계정의 아이디를 입력하세요. 이메일로 비밀번호를 보내드립니다.</p>
                                    <input class="form-control" placeholder="ID" name="id" type="text" autofocus>
                                </div>
                            
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="임시 비밀번호 보내기"><br>
                               
                          
                            </fieldset>
                        </form>
                    </div>
                    <div class="panel-heading" id="searchIdHead">
                        <h3 class="panel-title">아이디 찾기</h3>
                    </div>
                      <div class="panel-body">
                        <form action="showid" method="post" name="loginForm">
                            <fieldset id="searchId">
                                <div class="form-group">
                                <p id="errorMsg"></p> 
                                <p id="showId"></p> 
                                    <p id="Msgid">찾으실 계정의 이름과 이메일을 입력하세요. 아이디를 보여드립니다.</p>
                                    <input class="form-control" placeholder="Name" name="name" id="name" type="text" autofocus>
                                    <input class="form-control" placeholder="ID" name="email" id="email" type="text" >
                                </div>
                            
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" class="btn btn-lg btn-success btn-block" id="sendTextBtn" onclick="sendText()" value="보내기"><br>
                                <a href="/board/login"><input type="button" class="btn btn btn-success btn-block" value="뒤로가기"></a><br>
                          
                            </fieldset>
                        </form>
                    </div>
                     <div class="panel-heading" id="searchIdPwd2">
                        <h3 class="panel-title">비밀번호 찾기(byAjax)</h3>
                    </div>
                      <div class="panel-body">
                        <form action="showid" method="post" name="loginForm2">
                            <fieldset id="searchPwd2">
                                <div class="form-group">
                                <p id="errorMsg2"></p> 
                                <p id="showPwd"></p> 
                                    <p id="MsgPwd">찾으실 계정의 아이디과 이메일을 입력하세요. 비밀번호를 보여드립니다.</p>
                                    <input class="form-control" placeholder="id" name="id" id="id" type="text" autofocus>
                                    <input class="form-control" placeholder="email" name="email2" id="email2" type="text" >
                                </div>
                            
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="button" class="btn btn-lg btn-success btn-block" id="sendTextBtn" onclick="sendText2()" value="보내기"><br>
                                <a href="/board/login"><input type="button" class="btn btn btn-success btn-block" value="뒤로가기"></a><br>
                          
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
