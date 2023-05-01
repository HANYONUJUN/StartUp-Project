<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>
   .card{
     width: 49rem; 
     height:65rem; 
     margin:0 auto; 
   	 margin-top:100px; 
     border:2px;
  	}
  
  	bi bi-person-circle{
  		font-size:2rem; 
  		margin-left:12px;
 	 }
  
  	img{
    	width:30rem; 
    	height:26rem; 
    	margin:0 auto; 
    	margin-top:75px; 
    	border:3px solid black;
  	}
  	.card-body{
  	  margin-bottom:-10px; 
  	  text-align:center;
  	  
  	}
  	
  	.text-comment{
  		text-align:left;
  		
  	}
  	
  	.replylist{
  		text-align:left;
  	}
  	
  	.cardcomment{
  		margin-top:20px; 
  		border: 2px solid black; 
  	}
  	
  	.modal-body{
  		text-align:center;
  	}
  	
  	.replyinput{
  		
  		margin-left:-20px;
  	}
  	
  	.inputcontent{
  		
  		margin-top:10px;
  	}
  	
	</style>
	
	<title>상세 페이지</title>
	</head>
	<body>

    <nav class="navbar bg-light fixed-top">
       <div class="container-fluid">
       <a class="navbar-brand" href="#">그림 게시판</a>
       <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
         <span class="navbar-toggler-icon"></span>
       </button>
    
       <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
        <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">그림게시판</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
       </div>
      
       <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
         <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="/">메인으로!</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/enroll">글 작성하기!</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/boardlist">이전으로!</a>
          </li>
          
          </ul>
          
          </div>
       	  </div>
  	  	  </div>
	 	</nav>
		   
         <div class="card">
         <i class="bi bi-person-circle">:${data.userID}</i>
         
         <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <button class="btn btn-outline-danger" id="deletebtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제</button>
         <button class="btn btn-outline-info" id="updatebtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">수정</button>
         </div>
         
         <hr>
         
  	     <img src="/image/${data.fileName}"></img>
  	     <div class="card-body">
         <p class="card-text">${data.getContent()}</p>
    	 
  		 <div class="text-comment">
  		 <h3>comment</h3>
  		 <hr>
  		 </div>
  		 
  		 <p>
  		 <!-- 댓글 출력 -->
  		 <ul>
  		 <c:forEach var="reply" items="${reply}">
  		  <li>
  		 	<div class="replylist">
  		     <p>${reply.rewriter} / <fmt:formatDate value="${reply.redate}" pattern="yyyy-MM-dd"/></p>
  		     <p>${reply.recontent}</p>
  		 	</div>
  	      </li>	 
  		 </c:forEach>
  		</ul>
  		
  		 <div class="cardcomment">
  		 <div class="card-header">
    	 <h4>댓글달기</h4>
  		</div>
  	    	
  	    <div class="card-body">
  	    <form name="comment-form" action="/reply/write" method="post" autocomplete="off">
  	    
  	    <div class="replyinput">
	     <input type="text" name="rewriter" placeholder="작성자" required>
	     <input type="password" name="repassword" placeholder="비밀번호" required>
    	</div>
    	
    	<div class="inputcontent">
    	 <textarea cols="50" rows="3" name="recontent" placeholder="작성" required></textarea><br>
    	</div>
    	
    	 <input type="hidden" name="bno" value="${data.bno}">
    	<button type="submit" class="btn btn-primary">작성</button>
    	</form> 
  	   </div>  
      </div>
     </div>
	</div>
	
	<!-- 모달창 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
     <div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       <div class="modal-body">
        <h2>게시글 삭제</h2>
        <p>게시글을 삭제하시겠습니까?</p>
       <form action="${path}/board/postdelete" method="get">
        <input type="hidden" value="${data.bno}" name="bno">
        <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호를 입력하세요" required>
  		 <hr>
         <button type="submit" class="btn btn-secondary"  onclick="checkPassword()">삭제</button>
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </form>
       </div>
      </div>
     </div>
   </div>
   
   <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
     <div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header"> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <h2>게시글 수정</h2>
        <p>게시글을 수정하시겠습니까?</p>
        <form action="${path}/board/update" method="get">
         <input type="hidden" value="${data.bno}" name="bno">
         <input type="password" id="userpassword2" name="userpassword" placeholder="비밀번호를 입력하세요" required>
  		 <hr>
         <button type="submit" class="btn btn-secondary"  onclick="checkPassword()">수정</button>
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </form>
       </div>  
      </div>
     </div>
    </div>
</body>
</html>