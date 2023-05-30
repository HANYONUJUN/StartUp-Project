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
  
   body {
  		display: flex;
  		align-items: center;
  		justify-content: center;
  		overflow: hidden;
  		margin: 0; 
  		padding: 0;
  		
	}
   
   .container {
  		display: flex;
  		width: 100%;
  		padding: 4% 50%;
  		box-sizing: border-box;
  		height: 100vh;
  		padding-left:5px;
	}

	.box {
  		flex: 1;
  		overflow: hidden;
  		transition: .5s;
  		margin: 0 2%;
  		box-shadow: 0 20px 30px rgba(0,0,0,.1);
  		line-height: 0;
	}

	.box > img {
  		width: 100%;
  		height: calc(115% - 10vh);
  		object-fit: cover; 
  		transition: .5s;
	}

	.box > span {
  		display: block;
  		text-align: center;
  		height: 10vh;
  		line-height: 2.6;
	}

	.box:hover { flex: 1 1 50%; }
	.box:hover > img {
  		width: 100%;
  		height: 100%;
	}
	
	.btn {
  		position: relative;
  		background-image: linear-gradient(135deg, #ffffff 0%, #000000 30%);
  		padding: 14px 50px;
  		border-radius: 4px;
  		border: none;
  		color: #fff;
  		cursor: pointer;
  		outline: none;
  		overflow: hidden;
  		box-shadow: 0 14px 30px rgba(0,0,0,0.15);
  		font-family: 'Lato', sans-serif;
  		font-size: 16px;
  		text-transform: uppercase;
 		letter-spacing: 2px;
  
      }
      
      .btn span {
   		 position: relative;
  		}
      
  	  .btn::before {
    	--size: 0;
    	content: '';
    	position: absolute;
    	left: var(--x);
    	top: var(--y);
    	width: var(--size);
    	height: var(--size);
    	background: radial-gradient(circle closest-side, #ffffff, transparent);
    	transform: translate(-50%, -50%);
    	transition: all .2s ease, left 0s, top 0s;
  	}
  
  	 .btn:hover::before {
    	   --size: 200px;
 		 }
	
	
	.text-animation {
		 margin-left:-40%;
		 margin-top:-5%;
 		 font-size: 27px;
		}

	.text-animation h1,
	.text-animation h2,
	.text-animation h3 {
  		opacity: 0;
  		animation: fadeInUp 1s ease-in-out forwards;
	}

	@keyframes fadeInUp {
  	0% {
    	opacity: 0;
    	transform: translateY(100%);
  	}
  	100% {
    	opacity: 1;
    	transform: translateY(0);
  	}
	}

	.text-animation h1 {
		text-align:center;
 	 	animation-delay: 0s;
	}

	.text-animation h2 {
		text-align:center;		
  		animation-delay: 1s;
	}

	.text-animation h3 {
		text-align:center;		
  		animation-delay: 2s;
	}
	
 </style>
</head>

<body>

<div class="container">
  <div class="box">
    <img src="/resources/image/KakaoTalk_20230413_000026384_02.jpg">
    
  </div>
  <div class="box">
    <img src="/resources/image/KakaoTalk_20230512_213225965_01.jpg">
    
  </div>
  <div class="box">
    <img src="/resources/image/KakaoTalk_20230512_213225965.jpg">
   
  </div>
  <div class="box">
    <img src="/resources/image/sketch3.jpg">
    
  </div>
</div>

<div class="text-animation">
  <h1>안녕하세요</h1>
  <h2>자신의 작품을</h2>
  <h3>사람들과 공유하며 즐겨보세요</h3>
</div>

<a href="/board/list">
<button id="startBtn" class="btn" style="margin-left:-300px; margin-top:400px;">
  <span>Strat!</span>
</button>
</a>

<script type="text/javascript">
const btn = document.querySelector('.btn')

btn.onmousemove = function (e) {
  const x = e.pageX - btn.offsetLeft
  const y = e.pageY - btn.offsetTop
  
  btn.style.setProperty('--x', x + 'px')
  btn.style.setProperty('--y', y + 'px')
}
</script>

</body>
</html>
