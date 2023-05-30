<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

    img{
    	 margin-top:60px;
         width:450px;
         height:550px;
         border:3px solid black;    
    }
    
    .filter{
    	width: fit-content;
    	margin:0 auto;
    	padding:15px;
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
      <a class="navbar-brand" href="#">Offcanvas dark navbar</a>
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
		  
    	 <div class="filter">
    		<img src="data:image/png;base64,${originalImage}" alt="Image" />
    		<img src="data:image/png;base64,${filteredImage}" alt="Image" />
    	</div>
    
      <div class="buttons">
    	<a id="downloadLink" href="" download="filtered_image.png" onclick="downloadFilteredImage()">
  		  <button class="button" style="margin:auto; display:block; text-decoration:none;">
    		<span>I am a button</span>
  		   </button>
        </a>
       </div>
     
  
   <div class="footer_wrap">
    <footer class="py-1 bg-dark mt-auto" style="height:60px;">
    	<nav>
    	</nav>
     </footer>
   </div> 
  
	<script>
    var filteredImage = "${filteredImage}";
    // 이미지 다운로드 함수
    var isDownloading = false;

	function downloadFilteredImage() {
 	 if (isDownloading) {
     return; // 이미 다운로드 중인 경우, 함수 실행 중단
   }

   isDownloading = true;

   var link = document.createElement('a');
   link.href = 'data:image/png;base64,' + filteredImage;
   link.download = 'filtered_image.png';
   link.click();

   // 다운로드 완료 후 플래그 변수 재설정
   link.addEventListener('load', function() {
    isDownloading = false;
  });
}
</script>

   
</body>
</html>