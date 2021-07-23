<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{
	position: absolute;
	left: 22%;
	}
	.noticeDetail{
	 	margin-left:100px;
		width:977px;
	}
	
	.noticeDetailTitle{
		height:80px;	
		font-weight:bold;
		font-size:36px;
		margin-top:100px;
		}
		
	.noticeDate{
	font-size: 18px; 
	color: rgb(158, 158, 158);
	margin-bottom:80px;
	}
	
	.noticeContent{
	font-size: 20px;
	width:765px;
	height:503px;
	}
	.Button{
	font-size: 16px; 
	color: rgb(0, 0, 0); 
	text-align: center; 
	line-height: 3.5em; 
	border-radius: 4px; 
	background-color: rgb(224, 224, 224);
	width:99px;
	float:right;
	margin: 40px 0 0 40px ;
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
	
</style>


</head>

<body>
<jsp:include page="../menubar.jsp"/>
	<div class="noticeDetail">
	<div class="noticeDetailTitle">북포유 이용안내</div>
	<div class="noticeDate">2021-07-01</div>
	
	<div class="noticeContent">
	<p>북포유 이용안내 상세 내용</p>
	</div>	
	<hr>
		
	<div class="Button">수정</div>
	<div class="Button">삭제</div>
	
	<div class="ListButton">목록으로</div>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>