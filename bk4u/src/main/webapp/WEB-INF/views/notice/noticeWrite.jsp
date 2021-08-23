<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.body1{
		width:900px;
		margin:auto;

	}
	
	.noticeTitle{	
		width:100%;
		height:80px;	
		font-weight:bold;
		font-size:36px;
		margin-top:200px;
		margin-bottom:70px;
		margin-left:80px;	
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
		margin-left:420px;
		margin-bottom:200px;
	}
	
	h4{
	float:left;
	}	
	.titleinput{	
    width: 787px;
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
	width:787px;
	height:587px;
	resize:none;
	margin-left: 40px;
	}
	.uploadButton{
		font-size: 16px; 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px;
		border:none;
		background-color: rgb(224, 224, 224);
		width:136px;
		height:48px;
		margin-top:100px;
		margin-left:200px;	
	}
	
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div class="body1">
<div class="noticeTitle">공지사항</div>

<form id="noticeWrite" method="post" action="write.no" >
<h4 style="margin-top:12px;">제목</h4>
<input type="text" placeholder="제목을 입력해주세요" name="noTitle" class="titleinput">
<br><br><br><br><br><br>

<h4 style="margin-top:12px;">내용</h4>
<textarea class="content" placeholder="내용을 입력해주세요" name="noContent"></textarea>

<div style="width:360px; height:100px; float:right;">
<button type="submit" class="uploadButton">등록하기</button>
</div>  
</form>
 
<div class="ListButton" onclick="location.href='list.no'">목록으로</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>