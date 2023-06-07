<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>Insert title here</title>

<style type="text/css">

.input_wrap{
   padding-top:120px;
   margin-left:570px;
   width:400px;
} 

.input_wrap input{
     margin-bottom:60px;
}

.footer_wrap{
        margin-top:60px;
  		height:20px; 
  		width:100%; 
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
       
      <form name="update" method ="POST" action="${path}/board/postupdate?bno=${data.bno}" enctype="multipart/form-data">
        
       <div class="input_wrap">
	  	 <label>제목</label>
	  	 <input class="form-control" type="text" name="Title" required>
	 
	
		
	  	 <label>작성자</label>
	  	 <input class="form-control" type="text" name="userID" required>
		
	
	 	
         <label>내용</label>
         <textarea class="form-control" cols="50" rows="5" name="Content" required></textarea>
    	</div>
    	
   	    <div class="upbtn" style="margin-left:740px; margin-top:50px;">
   	      <input type="submit" class ="btn btn-outline-info" value="완료"/>
   	    </div>
       </form>
    
    <div class="footer_wrap">
      <footer class="py-1 bg-dark mt-auto" style="height:60px;">
    	<nav>
    	 </nav>
       </footer>
     </div> 

</body>
</html>