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
#hw{
background-image: url('resources/Star.png');
width: 300px;
height: 300px;
box-shadow: -5px 0px 18px rgba(0,0,0,0.2);
}
#hh{
background-image: url('resources/OneStar.png');
width: 300px;
height: 300px;
box-shadow: -5px 0px 18px rgba(0,0,0,0.2);
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

<div class="container-fulid" style="margin-top:50px; position:relative">

      <div style="position:absolute; background-color:rgba(0, 0, 0, 0.65); z-index:10; height:100%; width:100% "></div>

      <img src="resources/Star.png"" width="100%" alt="배경1" style="position:relative; z-index:1">

    </div>



출처: https://topsyn.tistory.com/27 [죠노이 노트]




<div id="hz">
 <img id="hz3" src="resources/VoidStar.png"  alt="backimg"  > 
</div>
<div id="hw"></div>
<div id="hh"></div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
