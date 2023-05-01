<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<title>Home</title>
	
	    
    <style>
      body{
          display: grid;
  		  align-items: center;
  		  justify-items: center;
  		  margin: 0;
  		  background-color: #000;   
      }
      
      .maintext{
       text-align:center;
       font-size:25px;
       color:white;
       margin-top :170px;
             
      }
      
      .menu{ 
        
        margin-top:50px;
        text-align:center;
        text-decoration:none;
        
      }
      
      .moon{
          width: 550px;
  		  height: 550px;
  	      border-radius: 50%;
  	      box-shadow:
    		0 0 20px #fff,
    		-20px 0 80px #f0f,
    		20px 0 80px #0ff,
    		inset 0 0 50px #fff,
    		inset 50px 0 80px #f0f,
    		inset -50px 0 80px #0ff,
    		inset 50px 0 300px #f0f,
    		inset -50px 0 300px #0ff;
  			animation: pulsate 6s linear infinite;
      
      }
      
      @keyframes pulsate {
      50% 
      {
    	box-shadow:
      	0 0 20px #fff,
      	20px 0 80px #f0f,
      	-20px 0 80px #0ff,
      	inset 0 0 50px #fff,
      	inset -50px 0 80px #f0f,
      	inset 50px 0 80px #0ff,
      	inset -50px 0 300px #f0f,
      	inset 50px 0 300px #0ff;
  		}
          
    </style>
</head>

<body>

<div class="moon">

 <div class="maintext">
 	<h1>안녕하세요!</h1>
 	<p>사람들과 작품을 게시글을 통해</p>
 	<p>공유하면서 즐겨보세요!</p>
  </div>
  
   <div class="menu">
	<a href="/board/list"><button>작품 보러가기</button></a>
  </div>
  
</div>

</body>
</html>
