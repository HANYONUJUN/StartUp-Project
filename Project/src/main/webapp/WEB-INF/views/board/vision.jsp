<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

 <style type="text/css">
 
	img{
		width:400px;
		height:500px;
		box-shadow: 6px 6px 6px 0px;	
	}
	
	.image{
		margin-top:100px;
		text-align:center;
		
	}

	.form-control{
		width:400px;
		margin:0 auto;
	}
	
	.inupload{
		text-align:center;
	}
	
	.footer_wrap{
		margin-top:3%;
  		height:6px; 
  		width:100%; 
	}
	
	
	#loading-overlay {
    	position: fixed;
    	top: 0;
    	left: 0;
    	width: 100%;
    	height: 100%;
    	background-color: rgba(0, 0, 0, 0.5);
    	display: none;
    	z-index: 9999;
	}

	.spinner {
    	position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	width: 40px;
    	height: 40px;
    	border: 4px solid #f3f3f3;
    	border-top: 4px solid #3498db;
    	border-radius: 50%;
    	animation: spin 10s linear infinite;
	}

	@keyframes spin {
    	0% { transform: rotate(0deg); }
    	100% { transform: rotate(360deg); }
	}
  </style>
 </head>
 
<body>
 <nav class="navbar navbar-dark bg-dark fixed-top">
      <div class="container-fluid">
      <a class="navbar-brand" href="#">그림게시판</a>
       
       
      <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">메뉴</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      
       <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">메인으로</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/enroll">글 작성하기!</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/vision">사진 특징 보러가기</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/fliter">사진 필터 변경하러 가기</a>
          </li>
             
           </ul>
          </div>
        </div>
  	   </div>
      </nav>
      
		<form method="post" action="/board/upload" enctype="multipart/form-data">
		   <div class="image">
			 <img id ="preview"/>
		   </div>
			<br><br>
			
		    <div class="form-control">
			    <input type="file" name="file" multiple required onchange="readURL(this);">
			</div>
			<br>
			
			<div class="inupload">
			  <input type="submit" onclick="showLoading()" value="Upload">
		    </div>
		    
		    <div id="loading-overlay">
        		<div class="spinner"></div>
    		</div>
		    
		</form>
		
  <div class="footer_wrap">
    <footer class="py-1 bg-dark mt-auto" style="height:60px;">
    	<nav>
    	</nav>
     </footer>
   </div> 	
			
<script type="text/javascript">
  function readURL(input){
	  if(input.files && input.files[0]){
		  var reader = new FileReader();
		  reader.onload = function(e){
			document.getElementById('preview').src=e.target.result;  
		  };
		  reader.readAsDataURL(input.files[0]);
	  }else{
		  document.getElementById('preview').src="";
	  }
  }
  
  function showLoading() {
	    document.getElementById('loading-overlay').style.display = 'block';
	}
  </script>
 </body>
</html>