<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
	<style>
	.container {
	    margin-top:100px;
		text-align:center;
	}
    
    .card{
    	border:2px solid black;
    	margin-top:15px;
    }
     
	img {
  		width: 100%;
  		height: 100%;
	}
	
	.empty{
		font-size:20px;
		text-align:center;
	}
	
	.enrollbtn{
	
		margin-top:30px;
		margin-left:115px;	
		
	}
	
	.search_area{
		display:inline-black;
		margin-top:-20px;
		padding-left:82%;
	}
	
	.search_area button{
		width:100px;
		height:36px;
	}
	
	.pageInfo{
		list-style: none;
		display: inlinee-block;
		maring:50px 0 0 100px;
	}
	
	.pageInfo li{
		float:left;
		font-size:20px;
		margin-left:18px;
		padding: 7px;
		font-weight: 500;
		
	}
	.pagenum{
		text-decoration:none;
		color:black;
	}
</style>  
    
  <title>게시글 목록</title>
   </head>
    <body>
     <script>
    $(document).ready(function(){
    
 		 let result ='<c:out value="${result}"/>';
 		 
 		 checkAlert(result);
 		 
 		 function checkAlert(result){
 			 
 			 if(result === ''){
 				 return;
 			 }
 			 if(result === "insert success"){
 				 alert("등록이 완료되었습니다.")
 			 }
 		 }
 		 
    });
    
    let moveForm =$("#moveForm");
    
    $(".pageInfo a").on("click", function(e){
    	
    	e.preventDefault();
    	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/list");
		moveForm.submit();
    	
    });
    
    $(".search_area button").on("click", function(e){
    	
    	e.preventDefault();
    	let val=$("input[name='keyword']").val();
    	moveForm.find("input[name='keyword']").val(val);
    	moveForm.find("input[name='pageNum']").val(1);
    	moveForm.submit();
    });
    </script>
    
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
          </ul>
        
          
          </div>
       	  </div>
  	  	  </div>
	 	 </nav>
	 	   
	     <div class="container">
  		  <div class="row">
  		  
  		  <!-- 검색 기능 -->
          <div class="search_area">
           <form class="d-flex" role="search" action="/board/list">
        	 <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${pageMaker.cri.keyword }" required>
        	 <button class="btn btn-outline-success" type="submit">Search</button>
      	   </form>
      	  </div>
          
          <div class="empty">
  		   <c:if test="${empty getlist}">
    		<p>작성된 글이 없습니다.</p>
		   </c:if>
		  </div>
             
	      <c:forEach var="board" items="${getlist}">
	        <div class="col-sm-6 col-md-5 col-lg-3">
	          <div class="card">	
	            <a href="${path}/board/detail?bno=${board.bno}">
	       		 <img src="/image/${board.fileName}"></img>
		 	    </a>
		 	    <div class="card-body">
            	 <h5 class="card-title">${board.title}</h5>
            	 <p class="card-text">
            	 ${board.userID}<br>
            	 조회수: ${board.viewcnt}
            	 </p>	       
		        </div>
		       </div>
		      </div>
	        </c:forEach>
	        </div>
		   </div>
		    <div class="enrollbtn">
    		<a href="/board/enroll"><button type="button" class="btn btn-dark">글 작성</button></a>
    	   </div>
    	   
    	   <div class="pageInfo_wrap">
    	   	<div class="pageInfo_area">
    	   	  <ul id="pageInfo" class="pageInfo">
    	   	  
    	   	  <nav aria-label="Page navigation example">
  			    <ul class="pagination justify-content-center">
  			    
    			<li class="page-item disabled">
    	   	    <c:if test="${pageMaker.prev}">
    	   	     <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">이전</a></li>
    	   	    </c:if>
    	   	    </li>
    	   	     
    	   	    <li class="page-item">
    	   		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn"><a href="${path}/board/list?pageNum=${num}">${num}</a></li>
				</c:forEach>
    	   		</li>
    	   		
    	   		<li class="page-item">
    	   		<c:if test="${pageMaker.next}">
    	   	    	<li class="pageInfo_btn next"><a href="${pageMaker.endPage+1}">다음</a></li>
    	   	    </c:if>
    	   	    </li>
    	   	   </ul>
    	   	  </nav>
    	   	 </ul>
    	    </div>
    	   </div>
    	   
    	   <form id="moveForm" method="get">
    	   	<input type="hidden" name="PageNum" value="${pageMaker.cri.pageNum }">
    	   	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
    	   	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
    	   </form>   
</body>
</html>