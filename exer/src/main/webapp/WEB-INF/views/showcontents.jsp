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


#container{
background-color: rgb(25, 25, 25);
	 box-sizing: border-box;
    width: 100%;
    padding: 0;
    margin: 0;
    margin: 0 auto;
    background-color: 
  
}

header{ position: relative;
    border: 2px solid white;
      margin: 0 auto;
    width: 1200px;
    height: 545px;
   
}
#thumbnail_group{
position: absolute;
 left:20px;
 top: 100px;
width:  800px;
height: 400px;
border: 2px solid white;
}

header img{  
float:left; 
}

#info{

float:left; 
width: 460px;
height: 340px;
border: 2px solid white;
color: white;

}
#info ul li{
font-size: 120%;
list-style: none
}


#poster{position:relative;
 background: linear-gradient(0deg,rgb(25, 25, 25), white);
/*  background-image: url("/resources/StarCraft.png"); */
 background-size: contain;

}
#posterbox{

}
#posterImg{position: absolute;
opacity: 0.4; 

}

#contents{
background-color: rgb(25, 25, 25);
border: 2px solid white;   
      margin: 0 auto;
    text-align: center;
   width: 1200px;
    height: 100%;
 
}
#List{   margin: 0 auto;
   border: 2px solid white;
background-color: rgb(53, 53, 53);
    border:1px solid rgb(53, 53, 53);
    width: 700PX;
     overflow: hidden;
    margin-right: 15PX;
    float: left;
}
#story{   margin: 0 auto;
background-color: rgb(73, 73, 73);
 width: 360PX;
 overflow: hidden;

}

</style>


<head>
	<title>Home</title>
</head>
<body>
<div id="container">
   <div id="poster">
   <div id="posterbox">
    <img src="/resources/StarCraft.png"  alt="backimg" id="posterImg"  height="100%" width="100%" >
    </div> 
        <header>
        <div id="thumbnail_group">
           <img src="/resources/s_StarCraft_Remastered.png" alt="sns" class="sns" width="265" height="360"> 
           
                <div id="info">
                <ul>
                   <li>BC/AGELIMIT/END</li> 
                   <li id="li2"><h1>CNAME</h1></li> 
                   <br>
                   <li>+장르</li> 
                   <li>+평점</li> 
                   <li>+좋아요</li> 
                </ul>
               </div>
         
           
          </div>
        </header>
  </div>    
  <div id="contents"> 
        <section id="List">
            
            <div class="buttons">
            <button>에피소드</button>
            <button>리뷰</button>
            <button>프로그램 소개</button>
            <button>공식이미지</button>
            
                <p style="color:rgb(141, 141, 141)">─────────────────────</p>
                <P>컨텐츠리스트</P>

            </div>
            <div class="thumbs">
             
            </div>
        </section>
        <section id="story">
            <div class="photo">
               
            </div>
            <div class="text">
                <h2>줄거리</h2>
                <p style="color:rgb(107, 107, 107)">─────────────────────</p>
                <P>cast</P>
            </div>
		        <section id="tag">
		            <div class="photo">
		                <img src="images/GOMCAM 20210204_1309580093.png" id="myphoto3">
		            </div>
		            <div class="text">
		                <h2>태그</h2>
		                <p style="color:rgb(141, 141, 141)">─────────────────────</p>
		             
		
		            </div>
		        </section>
        </section>
   
   </div> 
        <footer>
            <p>ⓒLee Sang-Jun 2021</p>

        </footer>
    </div>


</body>
<footer></footer>

</html>
