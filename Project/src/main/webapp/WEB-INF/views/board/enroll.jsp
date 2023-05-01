<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>게시판 등록</h1>

<form action="/board/enroll" method="post" enctype="multipart/form-data">
	<div class="input_wrap">
	  <label>제목</label>
	  <input type="text" name="Title">
	</div>
	
	<div class="input_wrap">
	  <label>작성자</label>
	  <input type="text" name="userID">
	</div>
	
	<div class="input_wrap">
	  <label>비밀번호</label>
	  <input type="password" name="userPassword">
	</div>
	
	 <div class="input_wrap">
        <label>내용</label>
        <textarea cols="50" rows="5" name="Content"></textarea>
    </div>
    
    <div class="input_wrqp">
    <label>사진 등록</label>
     <input type="file" name="uploadFile">
    </div>
    
	<button type="submit">등록</button>
</form>

</body>
</html>