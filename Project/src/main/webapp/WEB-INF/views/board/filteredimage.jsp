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
    	 <a href="#" id="downloadLink" style="text-decoration:none;">
  		  <button class="btn btn-outline-primary" style="margin:auto; display:block;">
    		다운로드
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
  // 이미지 다운로드 링크 클릭 이벤트 핸들러
  document.getElementById("downloadLink").addEventListener("click", function() {
    // Base64 인코딩된 이미지 데이터
    var filteredImage = "${filteredImage}";

    // 이미지 다운로드 함수 호출
    downloadImage(filteredImage);
  });

  // 이미지 다운로드 함수
  function downloadImage(filteredImage) {
    // Base64 문자열을 Blob 객체로 변환
    var byteCharacters = atob(filteredImage);
    var byteArrays = [];
    for (var i = 0; i < byteCharacters.length; i++) {
      byteArrays.push(byteCharacters.charCodeAt(i));
    }
    var blob = new Blob([new Uint8Array(byteArrays)], { type: "image/png" });

    // 다운로드 링크 생성
    var downloadLink = document.createElement("a");
    downloadLink.href = URL.createObjectURL(blob);
    downloadLink.download = "filtered_image.png";

    // 다운로드 링크 클릭
    downloadLink.click();

    // 다운로드 링크 제거
    URL.revokeObjectURL(downloadLink.href);
    downloadLink.remove();
  }
</script>
</body>
</html>