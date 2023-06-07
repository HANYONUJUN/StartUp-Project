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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
  		font-size:4rem; 
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

    <nav class="navbar navbar-dark bg-dark fixed-top">
     <div class="container-fluid">
     
      <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dark offcanvas</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      
       <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">메인으로</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/enroll">글 작성하기</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="/board/list">이전으로</a>
          </li>
             
          </ul>
          </div>
          </div>
  		  </div>
		  </nav>
		   
         <div class="card">
         <i class="bi bi-person-circle">:${data.userID}</i>
         조회수: ${data.viewcnt}
         
         <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <button class="btn btn-outline-danger" id="deletebtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="showDeleteModal(${data.bno})">삭제</button>
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
  		 
  		 <c:if test="${empty reply}">
          <div class="empty">
    		<p style="margin-top:20px;">작성된 댓글이 없습니다.</p>
		  </div>
		 </c:if>
  		 
  		 
		<c:forEach var="replyItem" items="${reply}">
  		<ul>
  		<li>
    	<div class="replylist">
      	<p>${replyItem.rewriter} / <fmt:formatDate value="${replyItem.redate}" pattern="yyyy-MM-dd"/></p>
      	<p>${replyItem.recontent}
        <button class="btn btn-primary" data-bs-target="#modalmodify" data-bs-toggle="modal" style="height:33px; display: inline-block; margin: 0 5px; margin-top:-10px; float: right;" onclick="setReplyId(${replyItem.rno},'${replyItem.recontent}')">수정</button>
        <button class="btn btn-danger" data-bs-target="#modaldelete" data-bs-toggle="modal" style="height:33px; display: inline-block; margin: 0 5px; margin-top:-10px; float: right;" onclick="setReplyId(${replyItem.rno})">삭제</button>
      	</p>
    	</div>
  		</li>
  		</ul>
		</c:forEach>
		
		<script>
  		function setReplyId(rno, recontent) {
    	document.getElementById('deleteRno').value = rno;
    	document.getElementById('ModifyRno').value = rno;
    	document.getElementById('recontent').value = recontent;
  		}
  		
  		$(document).ready(function() {
  			 let result = '<%= request.getParameter("inreply") %>';
   
        	 checkAlert(result);

   		 function checkAlert(result) {
       	 if (result === 'replyOK') {
       		alert("댓글 등록이 완료되었습니다.");
     		}  
  	     }
 	   });
	  </script>
		
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
	
	<!-- 댓글삭제 모달 창 -->
    <div class="modal fade" id="modaldelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
             <h5 class="modal-title" id="deleteModalLabel">댓글 삭제</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
          
           <div class="modal-body">
             <p>댓글을 삭제하시겠습니까?</p>
               <form id="deleteForm"  method="post" action="/board/replyDelete">
                 <input type="hidden" id="deleteRno" name="rno" value="">
                 <input type="hidden"  name="bno" value="${data.bno}">
              
           <div class="mb-3">
              <label for="deletePassword" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="replypassword" name="replypassword" placeholder="비밀번호를 입력하세요" required>
           </div>
              
            <div id="deleteErrorMessage" class="text-danger"></div>
              <hr>
               <button type="submit" class="btn btn-danger">삭제</button>
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              </form>
             </div>
            </div>
      	   </div>
    	  </div>
    	  
    	  <!-- 댓글 삭제 alert창 -->
    	  <script>
  			$(document).ready(function() {
   			 let result = '<%= request.getParameter("reresult") %>';
    
         	 checkAlert(result);

    		 function checkAlert(result) {
        	 if (result === 'redeleteOK') {
        		alert("댓글 삭제가 완료되었습니다.");
      		}else if(result === 'redeleteFail'){
      			alert("비밀번호가 일치하지 않습니다.");
      		}  
   	      }
  	    });
  	   </script>
    	
    	<!-- 댓글 수정 모달 창 -->	
		<div class="modal fade" id="modalmodify" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    	   <div class="modal-dialog">
        	<div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="editModalLabel">댓글 수정</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

            <div class="modal-body">
              <form id="modifyForm" method="post" action="/board/replyModify">
                <input type="hidden" id="ModifyRno" name="rno" value="">
                <input type="hidden" name="bno" value="${data.bno}">
               
               <div class="mb-3">
                   <label for="editPassword" class="form-label">비밀번호</label>
                   <input type="password" class="form-control" id="replypassword" name="replypassword" placeholder="비밀번호를 입력하세요" required>
               </div>

                    <div class="mb-3">
                        <label for="editContent" class="form-label">댓글 내용</label>
                        <textarea class="form-control" id="recontent" name="recontent" rows="3" required></textarea>
                    </div>

                    <div id="editErrorMessage" class="text-danger"></div>
                    <hr>
                    <button type="submit" class="btn btn-primary">수정</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </form>
               </div>
              </div>
             </div>
            </div>
            
            <script>
  			$(document).ready(function() {
   			 let result = '<%= request.getParameter("reupresult") %>';
    
         	 checkAlert(result);

    		 function checkAlert(result) {
        	 if (result === 'reupmodifyOK') {
        		alert("댓글 수정이 완료되었습니다.");
      		}else if(result === 'reupmodifyFail'){
      			alert("비밀번호가 일치하지 않습니다.");
      		}  
   	     }
  	});
  	</script>

	<!-- 게시글 삭제 모달창 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
     <div class="modal-dialog">
      <div class="modal-content">
       <div class="modal-header">      
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       </div>
       
       <div class="modal-body">
        <h2>게시글 삭제</h2>
        <p>게시글을 삭제하시겠습니까?</p>
         <form id="deleteForm" action="${path}/board/postdelete" method="get">
          <input type="hidden" value="${data.bno}" name="bno">
          <input type="password" id="userpassword" name="userpassword" placeholder="비밀번호를 입력하세요" required>
  		 <hr>
         <button id="deleteBtn" type="submit" class="btn btn-secondary"  onclick="checkPassword()">삭제</button>
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </form>
       </div>
      </div>
     </div>
   </div>
      
   <!-- 게시글 수정 모달창 -->
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
         
         <script>
         $(document).ready(function() {
     	    let result = '<%= request.getParameter("update") %>';
     	    
     	    checkAlert(result);

     	    function checkAlert(result) {
     	        if (result === 'updateFail') {
     	        	alert("비밀번호가 맞지 않습니다.");
     	      	}
     	   	  }
     	  	});
        </script>
      
        
</body>
</html>