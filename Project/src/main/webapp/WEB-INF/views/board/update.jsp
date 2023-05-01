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
</head>
<body>


        <form name="update" method ="POST" action="${path}/board/postupdate?bno=${data.bno}">
        
        <div class="input_wrap">
	  	<label>제목</label>
	  	<input type="text" name="Title">
		</div>
	
		<div class="input_wrap">
	  	<label>작성자</label>
	  	<input type="text" name="userID">
		</div>
	
	 	<div class="input_wrap">
        <label>내용</label>
        <textarea cols="50" rows="5" name="Content"></textarea>
    	</div>
    
   	    <div>
   	      <input type="submit" class ="btn btn-outline-info" value="완료"/>
   	    </div>
   	    
    </form>

</body>
</html>