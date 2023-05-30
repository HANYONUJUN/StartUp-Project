<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

	<style>
	img{
		width:200px;
		height:200px;
		margin-top:13px;
		margin-left:200px;
		border-radius:6px;
		border:1px solid black;
		
	}
	
	.card{
	  border:2px solid black;
	  box-shadow : 5px 5px 5px 0px;
	  margin:auto;
	  margin-top:20px;
	  width:610px;
	  height:680px;
	}
	
    .boardwrite{
    	margin-top:60px;	
    }
    
    .input_board{
    	margin-top:10px;
    	margin-left:12px;
    	text-align:left;	
    }
    
    .input_title{
    	margin-left:12px;
    	text-align:left;
    }
     
    .input_content{
    	margin-top:20px;
    	text-align:center;
    }
     
    .input_file{
    	margin-top:20px;
    	margin-left:12px;
    	width: 400px;
    }
    
    .input_board input{
    	border:1px solid black;
    	border-radius:6px;
    }
    
    .input_title input{
		border:1px solid black;
    	border-radius:6px;
		    	
    }
    
    .input_title input{
    	width:580px;
    	height:45px;
    }
    
    .input_content textarea{
    	border:1px solid black;
    	border-radius:6px;
    	
    }
    
   .inputbtn button{
    	margin-top:10px;
    	margin-left:57px;
    	display: block;
  		width: 80%;
  		padding:10px;
  		
    }
    
    .footer_wrap{
		margin-top:3%;
  		height:6px; 
  		width:100%; 
	}
    
	</style>
	
	<title>Insert title here</title>
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
               <a class="nav-link" href="/board/list">뒤로가기</a>
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
     
     <h2 style="text-align:center; margin-top:100px;">게시글 작성</h2>
     
      <div class="card"> 
       <div class="boardwrite">
     
        <form action="/board/enroll" method="post" enctype="multipart/form-data">
     
         <div class="input_title">
	  	  <input type="text" name="Title" placeholder="제목" required>
	     </div>
     
	     <div class="input_board">
	       <input type="text" name="userID" placeholder="작성자" required >
	 	   <input type="password" name="userPassword" placeholder="비밀번호" required>
	    </div> 
	   
	    <div class="input_content">
          <textarea cols="75" rows="7" name="Content" placeholder="글 내용 작성" required>
        </textarea>
      </div>
    
      <div class="input_file">
        <input class="form-control" type="file" name="uploadFile"  multiple required onchange="readURL(this);">
      </div>
      
      <img id ="preview"/>
        
      <div class="inputbtn">
        <button type="submit" class="btn btn-outline-primary">등록</button>
	  </div>
	 </form>
	</div>
   </div>

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
 </script>
</body>
</html>