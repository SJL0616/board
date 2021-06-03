<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<style type="text/css">

body{
/*  background-image: url("/resources/StarCraft.png") ; */
 background-repeat: no-repeat; 

}

#hz { 

 border:1px solid red; 

  display:inline-block;

  width:25px; height:25px;

  overflow:hidden;

/*  position:relative;  */
text-align: center;
  
  
  
  }
#hz1 {left:0; visibility:visible}
#hz2 { 

position: relative; 

}
#hz3 { 

position: relative; 

}

   

/*  position:absolute;

  left:-60%;

  top:-60%; */
</style>

<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<div id="hz">
<!--  <img id="hz1" src="resources/Star.png"  alt="backimg"  >  -->
 <img id="hz2" src="resources/Star.png"  alt="backimg"  > 

</div>
<div id="hz">
 <img id="hz3" src="resources/VoidStar.png"  alt="backimg"  > 
</div>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
