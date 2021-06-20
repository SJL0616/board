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

});
</script>


<style>
body{
	background-color: rgb(25, 25, 25);
}
#contents{

color:rgb(170, 170, 170);

/* border: 2px solid white;    */
margin: 0 auto;
width: 100%;
height: 100%;

}
.searchBar{
    height: 700px;
        width: 100%;
    /* max-width: 724px; */
    margin: 0px auto;
    display: flex;
    -webkit-box-align: center;
    /* align-items: center; */
    /* height: 1; */
    background-color: rgb(11, 11, 11);
}
.searchForm{
background-color: rgb(11, 11, 11);
}
</style>
<head>
	<title>Home</title>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<body>

<div id="container">

<div id="contents">
  


	<section class="searchBar">
	  <div class="searchForm">
	  <div>
	  <img alt="" src="/resources/icon_search.png">
	  </div>
	  <div>
	  <input type="text">
	  </div>
	  
	  
	  </div>


	</section>


</div>

</div>

</body>
</html>
