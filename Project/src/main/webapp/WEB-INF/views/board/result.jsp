<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

    .uploadimg {
        margin-top: 120px;
        margin-left: 235px;
        display: flex;
        jutify-content: center;
        position:fixed;
    }
    .uploadimg p{
    	font-size:20px;
    	margin-top:20px;
    	text-align:center;	
    }
    img {
        width: 400px;
        height: 500px;
        box-shadow: 6px 6px 6px 0px;
    }  
    .footer_wrap{
		
  		height:5px; 
  		width:100%; 
	}
	
	.sns_icon{
		margin-top:30px;
	    width:100px;
	    display:inline-black;
	    margin: 0 auto;
	    font-size:25px;
	}
	
	.footer_wrap p{
		margin-top:-5px;
		font-size:13px;
		color:white;
		text-align:center;
	} 

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
            <a class="nav-link" href="/board/enroll">글 작성하기</a>
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
                 
	  <div class="uploadimg" style="width:1170px; height:1100px;">
	  	<div class="imgContent">	  
      		<img src="data:image/png;base64,${fileContent}" alt="Uploaded File" />
      		<p>File Name: ${fileName}</p>
	  	</div>
      	<canvas id="labelChart" class="card" style="margin-left:30px; border:2px solid black;"></canvas>
      </div>   
      
    <script>
    // 라벨 결과 데이터
    var labels = [
        <c:forEach items="${labels}" var="label" varStatus="status">
            {
                label: "${label.description}",
                score: ${label.score}
            }<c:if test="${not status.last}">,</c:if>
        </c:forEach>
    ];

    // 막대 그래프 생성
    var ctx = document.getElementById('labelChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels.map(item => item.label),
            datasets: [{
                label: 'Label Scores',
                data: labels.map(item => item.score),
                backgroundColor: 'rgba(75, 192, 192, 0.5)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            indexAxis: 'y', // 세로 막대 그래프로 변경
            scales: {
                x: {
                    beginAtZero: true,
                    max: 1
                }
            }
        }
    });
</script>
    
    <div class="footer_wrap">
      <footer class="py-1 bg-dark mt-auto" style="height:60px;">
    	<nav>
    	  <div class="sns_icon">
    	     <a href="https://github.com/HANYONUJUN"><i class="bi bi-github"></i></a>
    	     <a href="https://facebook.com/profile.php?id=100009281035042"><i class="bi bi-facebook"></i></a>
    	  </div>
    	     <p>Email: gksdydwns34@naver.com</p>
    	 </nav>
       </footer>
     </div> 

	
</body>
</html>