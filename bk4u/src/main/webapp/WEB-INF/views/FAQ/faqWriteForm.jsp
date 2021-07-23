<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

	.body1{
		width:1000px;
		margin: auto;		
	}
	
	.faqTitle{	
		height:100px;	
		font-weight:bold;
		font-size:36px;	
		margin: 200px 0 60px 180px;
	}
	
	.ListButton{		
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		background-color: rgb(252, 190, 52);
		width:120px;
		margin-top:300px;
		margin-left:500px;
		margin-bottom:200px;
	}
	
	h2{
	float:left
	}	
	.titleinput{	
    width: 800px;
    height: 60px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
    margin-left: 40px;
	}
	
	.content{
	color: rgb(94, 94, 94); 
	 background: #fff;
    border: 1px solid #ccc;
     border-radius: 4px;    
    font-size: 20px;
	width:800px;
	height:587px;
	resize:none;
	margin-left: 80px;
	}
	.uploadButton{
		font-size: 16px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px;
		background-color: rgb(224, 224, 224);
		width:136px;
		height:48px;		
		margin-top:100px;
		margin-left:840px;
	}
	select{
	width: 800px;
    height: 60px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
    
	}
	
</style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>
<div class="body1">
<div class="faqTitle">FAQ</div>

<h2 style="margin-top:10px;">문의 제목</h2>
<input type="text" placeholder="제목을 입력해주세요." class="titleinput">
<br><br><br>
<h2 style="margin-top:10px;">유형 선택</h2>
<select style="margin-left:40px;"><option>기타</option></select>
<br><br><br>

<h2 style="margin-left:35px;">내용</h2>
<textarea class="content">문의내용</textarea>

<div class="uploadButton">등록하기</div> 
 
<div class="ListButton">목록으로</div>
</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>