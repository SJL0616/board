<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">

</script>

<style type="text/css" >


header{
width: 70%;
background: gray;

}

container{
margin : 0 auto;
width: 50%;
background: skyblue;

}


</style>


<head>
	<title>Home</title>
</head>


<body>
 <div class="container" >
<header>
<h1>
	컨텐츠리스트   
</h1>
</header>



<P>  The time on the server is ${serverTime}. </P>
  
<div>
 <ul class="fileListView">
 
 
 </ul>

</div>

</div>
  
</body>
<footer></footer>

</html>
