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
		margin: 200px 0 0 180px;
	}
	
	.cancelButton{		
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		background-color: rgb(252, 190, 52);
		width:120px;
		float:right;
		
		
	}
	.uploadButton{
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		width:120px;
		background-color: rgb(224, 224, 224);
		float:right;
		margin-right:100px;
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
    margin-left: 50px;
    
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
	
	.uploadfile{
	width:500px;
	height:200px;
	}
	.foot{
	width:700px;
	height:200px;
	margin-bottom:300px;
	margin-top:100px;

	}
	
</style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>
<div class="body1">
<div class="faqTitle">신고</div>
<hr>
<h2 style="margin-top:10px;">신고 유형</h2>
<input type="text" placeholder="게시글유형자동등록" class="titleinput" readonly>
<br><br><br>


<h2 style="margin-left:35px;">내용</h2>
<textarea class="content">내용을 입력해주세요.</textarea>
<br><br><br><br>
<h2>사진 첨부</h2>
<div class="uploadfile">
<input type="file" style="margin-top:5px; float:right;" >
</div>

<h2 >신고 링크</h2>
<a href="" style="margin-left:30px; font-size:20px;">신고링크 자동등록</a>
<br><br><br><br><hr>

<div class="foot">
<div class="cancelButton">취소</div> 
<div class="uploadButton">등록하기</div>
</div> 
 

</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>