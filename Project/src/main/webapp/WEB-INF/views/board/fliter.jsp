<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>

  .fileinput{
     width:300px;
     margin-left:950px;
     margin-top:-50px;
  }
  img{
		width:400px;
		height:500px;
		margin-top:25px;
		margin-left:100px;
		border-radius:6px;
		box-shadow: 6px 6px 6px 0px;	
		
	}
 .canvaspre{
 	margin-top: 80px;
 	display: flex;
    justify-content: center;
    
 }
  
 .color-picker-wrapper{
 	margin-top:40px;
 	margin-left:375px;
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

    <form action="/board/uploadfilter" method="post" enctype="multipart/form-data">
     <div class="canvaspre">
      <canvas id="myCanvas" width="550" height="400" style="border-radius: 50%; border: 5px solid black;"></canvas>
      <img id="preview" /><br>
    </div>

  <div class="color-picker-wrapper">
    <label for="colorPicker" class="color-label">Color:</label>
    <input type="color" id="colorPicker" name="hexColor" value="#000000" class="color-picker-input" onchange="updatePreviewColor()">
  </div>

  <br>
  <div class="fileinput">
    <input class="form-control" type="file" name="image" accept="image/*" multiple required onchange="readURL(this);">
  </div>
  <br>
  
  <div class="btn">
	<button type="submit" onclick="showLoading()" style="margin-left:680px; margin-top:-20px;" class="btn btn-outline-primary">Upload</button>
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

<script>
  // Get the canvas element
  var canvas = document.getElementById("myCanvas");
  var ctx = canvas.getContext("2d");

  // Function to redraw the canvas with the updated color
  function drawCanvas(hexColor) {
    // Clear the canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Set the fill style to the hex color
    ctx.fillStyle = hexColor;

    // Draw a circle on the canvas
    ctx.beginPath();
    ctx.arc(canvas.width / 2, canvas.height / 2, canvas.width / 2, 0, 2 * Math.PI);
    ctx.closePath();
    ctx.fill();
  }

  // Call the drawCanvas function when the hex color value changes
  function updatePreviewColor() {
    var colorPicker = document.getElementById("colorPicker");
    var hexColor = colorPicker.value;
    drawCanvas(hexColor);
    applyFilterToPreviewImage(hexColor);
  }

  // Initial drawing
  var colorPicker = document.getElementById("colorPicker");
  var initialHexColor = colorPicker.value;
  drawCanvas(initialHexColor);

  // Image preview
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById('preview').src = e.target.result;
        applyFilterToPreviewImage(initialHexColor);
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      document.getElementById('preview').src = "";
    }
  }
  
  function showLoading() {
	    document.getElementById('loading-overlay').style.display = 'block';
	}
</script>
</body>
</html>